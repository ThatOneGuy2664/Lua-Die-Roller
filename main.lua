local function prompt(msg)
    print(msg)
    return tonumber(io.read())
end

local dieType = prompt("How many sides should each die have?")
local mod = prompt("Input the sum of all modifiers to the roll:")
local num = prompt("How many dice should be rolled?")
local numMod = prompt("How many times should the modifier be added?")

local rolls = {}
local total = 0

for i = 1, num do
    local roll = math.random(1, dieType)
    table.insert(rolls, roll)
    total = total + roll
end

local final = total + (mod * numMod)

print("\nRolled " .. num .. "d" .. dieType .. " + " .. mod .. " x" .. numMod)
print("Individual rolls: " .. table.concat(rolls, ", "))
print("Total (with modifiers): " .. final)

print("\nPress Enter to close, or type 'data' for additional data about your rolls.")
local closeDec = io.read()

if closeDec == string.lower("data") then
  print("Average roll: " .. total / num)
end
