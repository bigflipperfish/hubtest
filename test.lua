function serialize(data, name)
  if not fs.exists('/data') then
    fs.makeDir('/data')
  end
  local file = fs.open('/data/'..name, 'w')
  file.write(textutils.serialize(data))
  file.close()
end

function unserialize(name)
  local  file = fs.open('/data/'..name, 'r')
  data = textutils.unserialize(file.readAll())
  file.close()
  return data
end

function setPos(x,y,z,facing)
  local pos = {}
  pos.x = x
  pos.y = y
  pos.z = z
  pos.facing = facing
  
  serialize(pos, 'posData')
end

function getPos()
  if fs.exists('/data/posData') then
    local pos = unserialize(posData)
    return pos
  else
    error("positional data missing")
  end

function forward(reps)
  local pos = getPos()
  for i=1,reps do
    while not turtle.forward() do
      turtle.dig()
    end
  end
end
  
