-- miner.lua

print("Enter d1 (length):")
local d1 = read()

print("Enter d2 (width):")
local d2 = read()

print("Enter d3 (depth):")
local d3 = read()

local status = "Mining"

function printStatus()
  term.clear()
  print("------ Miner Status ------")
  print("Fuel: "..turtle.getFuelLevel())
  print("Status: "..status)
end

function tryToMove()
  if turtle.getFuelLevel() == 0 then
    print("Need fuel (press enter to continue)")
    read()
  end

  turtle.refuel()

  turtle.forward()
end

local flip = 0

turtle.refuel()

for i = 1, d3, 1 do -- For each layer

  for j = 0, d2, 1 do -- For width

    for k = 1, d1, 1 do
      turtle.digDown()
      tryToMove()
      printStatus()
    end
  
    if i + flip % 2 == 0 then -- Even row
      turtle.turnRight()
      tryToMove()
      turtle.turnRight()
    else
      turtle.turnLeft()
      tryToMove()
      turtle.turnLeft()
    end

  end

  -- Rotate at the end
  turtle.turnLeft()
  turtle.turnLeft()

  if flip == 0 then
    flip = 1
  else
    flip = 0
  end

end