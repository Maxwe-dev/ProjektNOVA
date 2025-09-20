local component = require("component")
local computer = component.computer
local computer = require("computer")

function wait(t, x)
  computer.beep(t, x)
end

print("Video Check")
  wait(50, 0.25)

local GPUIn = component.isAvailable("gpu")

if GPUIn then
  print("GPU Loaded:         True")
  wait(50, 0.25)

  local gpu = component.gpu
  local w, h = gpu.getResolution()
  print("Total VRAM:         " .. gpu.totalMemory() .. " Bytes")
  wait(50, 0.25)
  print("Resolution:         " .. w .. " X " .. h)
wait(50, 0.25)
else
  computer.beep(75, 0.15)
  computer.beep(50, 0.15)
end

local TotalRam = computer.totalMemory()
local FreeRam = computer.freeMemory()
local UsedRam = TotalRam - FreeRam

print("RAM Check")
  wait(30, 0.25)

  print("RAM Loaded:         True")
  wait(30, 0.25)

  print("Total RAM:          " .. TotalRam .. " Bytes")
  wait(30, 0.25)
  print("Free RAM:           " .. FreeRam .. " Bytes")
  wait(30, 0.25)
 print("Used RAM:           " .. UsedRam .. " Bytes")
  wait(30, 0.25)

print("File Check")
wait(80, 0.25)

local FileSysIN = component.isAvailable("filesystem")

if FileSysIN then
local filesystem = component.filesystem
local used = filesystem.spaceUsed()
local total = filesystem.spaceTotal()
local free = total - used


print("FileSYS Loaded:     True")
wait(80, 0.25)
print("Storage Used:       "..used.." Bytes")
wait(80, 0.25)
print("Storage Free:       "..free.." Bytes")
wait(80, 0.25)
else
print"FileSYS Unmanaged or missing."
  computer.beep(10, 0.15)
  computer.beep(5, 0.15)
end

print("Modem Check")
wait(30, 0.25)

local ModemIn = component.isAvailable("modem")

if ModemIn then
  local modem = component.modem
  if modem.isWireless() then
print("Modem Connected:    True" )
wait(30, 0.25)
print("Is Modem Wireless:  True" )
else
print("Is Modem Wireless:  False" )
end
wait(30, 0.25)
else
print("Modem Connected: False" )
wait(25, 0.25)
wait(20, 0.25)
end

print("Modem Check")
wait(90, 0.25)

local InternetIN = component.isAvailable("internet")

if InternetIN then
print("Internet Connected: True")
else
print("Internet Loaded: False")
wait(90, 0.25)
wait(80, 0.25)
end


print("DataCard Check")
wait(70, 0.25)
local DataCardIn = component.isAvailable("data")
local InitData = "ProjektNova 1.0.0"
local encoded = 0
local decoded = 0
if DataCardIn then
local data = component.data
print("DataCard Loaded:    True")
wait(70, 0.25)
print("Initial Data:       "..InitData)
wait(70, 0.25)
local encoded = data.encode64(InitData)
print("Base64 Encoding:    "..encoded)
wait(70, 0.25)
local decoded = data.decode64(encoded)
print("Base64 Decoding:    "..decoded)
wait(70, 0.25)
else
print("DataCard Loaded:    False")

end
