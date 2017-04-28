function serialize(data, name)
  if not fs.exists('/data') then
    fs.makeDir('/data')
  end
  local file=fs.open('/data'..name, 'w')
  file.write(textutils.serialize(data))
  file.close()
end

function unserialize(name)
  if fs.exists('/data'..name) then
    local  file=fs.open('/data'..name, 'r')
    data = textutils.unserialize(file.readAll())
    file.close()
  end
  return data
end

function forward(reps)
  
