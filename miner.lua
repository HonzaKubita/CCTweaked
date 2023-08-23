-- miner.lua

print("Enter d1 (length):")
d1 = read()

print("Enter d2 (width):")
d2 = read()

print("Enter d3 (depth):")
d3 = read()

local status = "Mining"

function printStatus()
  -- term.clear()
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

  printStatus()
end

flip = 0

turtle.refuel()

-- For each layer
for i = 1, d3, 1 do

  -- For width
  for j = 1, d2, 1 do

    for k = 1, d1, 1 do
      turtle.digDown()
      tryToMove()
    end
    
    -- Even row
    if (j + flip) % 2 == 0 and j ~= d2 then
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

  turtle.digDown()

  turtle.down()

  if flip == 0 then
    flip = 1
  else
    flip = 0
  end

end