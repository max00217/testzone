import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)

print(lua.eval('1+1'))

lua_func = lua.eval('function(f, n) return f(n) end')

def py_add1(n): 
  return n+1

print(lua_func(py_add1, 2))

print(lua.eval('python.eval(" 2 ** 2 ")') == 4)

print(lua.eval('python.builtins.str(4)') == '4')