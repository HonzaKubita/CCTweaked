-- miner.lua

print("Enter d1 (length):")
d1 = tonumber(read())

print("Enter d2 (width):")
d2 = tonumber(read())

print("Enter d3 (depth):")
d3 = tonumber(read())

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

  turtle.dig()

  turtle.forward()

  printStatus()
end

flip = 1

turtle.refuel()

for i = 1, d3, 1 do

  -- For width
  for j = 1, d2, 1 do

    for k = 1, d1 - 1, 1 do
      turtle.digDown()
      tryToMove()
    end

    -- Remove last block in the row
    turtle.digDown()

    -- Prevent normal rotation at the end of last row
    if j == d2 then
      print("Last row break")
      break
    end
    
    -- Even row
    if flip % 2 == 0 then
      turtle.turnRight()
      tryToMove()
      turtle.turnRight()
    else
      turtle.turnLeft()
      tryToMove()
      turtle.turnLeft()
    end

    if flip == 0 then
      flip = 1
    else
      flip = 0
    end

  end

  -- Rotate at the end
  turtle.turnLeft()
  turtle.turnLeft()

  turtle.digDown()

  turtle.down()

end