
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

