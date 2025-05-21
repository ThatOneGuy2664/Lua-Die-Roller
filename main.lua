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

if closeDec then
    if string.lower(closeDec) == "data" then
        local rollCounts = {}
        local mostRolled = 0
        local leastRolled = 0 
        local highestCount = 0
        local leastCount = math.huge -- Make sure to count the first low

        for _, v in ipairs(rolls) do
            rollCounts[v] = (rollCounts[v] or 0) + 1

            if rollCounts[v] > highestCount then
                highestCount = rollCounts[v]
                mostRolled = v
            end
        
            if rollCounts[v] < tonumber(leastCount) then
                leastCount = rollCounts[v]
                leastRolled = v
            end
        end

        print("Average roll: " .. string.format("%.2f", total / num))
        print("Most rolled number: " .. mostRolled .. " (" .. highestCount .. " times)")
        print("Least rolled number: " .. leastRolled .. " (" .. leastCount .. " times)")
    end    
end