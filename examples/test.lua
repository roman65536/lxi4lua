require "os"

function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

function text_prompt(msg)
  io.write(msg)
  io.flush()
  return io.read()
end

function call_scpi(con,msg)
print(lxi_scpi(con,msg))
err_msg=lxi_scpi(con,"SYSTem:ERRor?")
print(err_msg)
end


l=require("lxit")
addr=text_prompt("Hostname or Ip address of SCPI/LXI Device")
dev=lxi_connect(addr,nil, nil, 2000, "RAW")
dev_id=lxi_scpi(dev,"*IDN?")
print(dev_id)

for a=1,10 do
lxi_scpi(dev,string.format("SOURce0:FREQ %d",a*1000))
sleep(1)
end

for a=0,10 do
lxi_scpi(dev,string.format("OUTP0 ON"))
sleep(1)
lxi_scpi(dev,string.format("OUTP1 ON"))
sleep(1)
lxi_scpi(dev,string.format("OUTP0 OFF"))
sleep(1)
lxi_scpi(dev,string.format("OUTP1 OFF"))
sleep(1)
end

