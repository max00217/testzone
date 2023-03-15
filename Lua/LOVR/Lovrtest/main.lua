function lovr.load()
  model = lovr.graphics.newModel('lptp.fbx')
end

function lovr.draw(pass)
  pass:cube(0, 1.7, -1, .5, lovr.timer.getTime())
  pass:draw(model, 0, -200, 0)
end

