mt = {}
t1 = {}
t2 = {}
t3 = {}
 
function mt:new(o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
end
 
function mt:funcTest()
        print('mtFunc')
end
 
function t2:funcTest()
        print('t2Func')
end
 
function t3:funcTest()
        print('t3Func')
end
 
t1 = mt:new(t1)
t1.funcTest()
 
t2 = mt:new(t2)
t2.funcTest()
 
t3 = t2:new(t3)
t3.funcTest()