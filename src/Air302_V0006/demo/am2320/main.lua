
-- LuaTools需要PROJECT和VERSION这两个信息
PROJECT = "dht12"
VERSION = "1.0.0"

-- sys库是标配
_G.sys = require("sys")

--- 读取AM2320的数据(未调试成功)
-- @number id, 端口号0-2
-- @return string，string，第一个参数是温度，第二个是湿度
-- @usage tmp, hum = read()
function am2320(id, addr)
    --id, addr = id or 0, addr or 0x5C
    --if not i2c_open(id) then return end
    --i2c.send(id, addr, string.char(0x03))
    i2c.send(id, addr, string.char(0x03, 0x00, 0x04))
    local data = i2c.recv(id, addr, 8)
    log.info("AM2320 HEX data: ", data:toHex())
    if data == nil or #data == 0 then return end
    log.info("AM2320 HEX data: ", data:toHex())
    --i2c.close(id)
    local _, crc = pack.unpack(data, '<H', 7)
    data = data:sub(1, 6)
    if crc == crypto.crc16_modbus(data, 6) then
        local _, hum, tmp = pack.unpack(string.sub(data, 3, -1), '>H2')
        if tmp == nil or hum == nil then return 0, 0 end
        if tmp >= 0x8000 then tmp = 0x8000 - tmp end
        if float then
            tmp, hum = tmp / 10, hum / 10
        else
            tmp = tmp / 10 .. "." .. tmp % 10
            hum = hum / 10 .. "." .. hum % 10
        end
        log.info("AM2320 data: ", tmp, hum)
        return tmp, hum
    end
end

sys.taskInit(function()
    local id = 0
    i2c.setup(id, i2c.SLOW)
    while 1 do
        log.info("am2320", am2320(id, 0x5C))
        sys.wait(5000) -- 5秒读取一次
    end
end)

-- 用户代码已结束---------------------------------------------
-- 结尾总是这一句
sys.run()
-- sys.run()之后后面不要加任何语句!!!!!
