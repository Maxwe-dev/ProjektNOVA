local component = require("component")
local modem = component.modem
local io = require("io")

local port = 123
modem.open(port)

print("ProjektNOVA Message Relay")
print("Type your message and press Enter. Type 'exit' to quit.")

while true do
  io.write("> ")
  local message = io.read()

  if message == "exit" then
    print("Exiting sender.")
    break
  end

  modem.broadcast(port, message)
  print("Message sent:", message)
end
