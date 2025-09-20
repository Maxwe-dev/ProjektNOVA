local event = require("event")
local component = require("component")
local computer = require("computer")
local modem = component.modem

local port = 123
modem.open(port)

print("Listening on port", port)

local lastMsg, lastFrom = nil, nil

while true do
  local _, _, from, _, _, message = event.pull("modem_message")

  if message == "exit" then
    print("Exit command received. Shutting down receiver.")
    break
  end

  if message ~= lastMsg or from ~= lastFrom then
    computer.beep(880, 0.15)
    computer.beep(660, 0.15)

    print("Message received:", message, "from:", from)
  end

  lastMsg, lastFrom = message, from
end
