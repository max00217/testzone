fl = require("moonfltk")

win = fl.window(1280, 960, arg[0])
box = fl.box(640, 480, 300, 100, "MoonflTK Test + 저기 한국어 지원 하십니까?, 아 대굴빡이");
box:box('up box')
box:labelfont(fl.BOLD + fl.ITALIC)
box:labelsize(36)
box:labeltype('shadow')
win:done() -- 'end' is a keyword in Lua
win:show(arg[0], arg)

return fl.run()
