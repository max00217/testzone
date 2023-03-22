function myCoroutine()
  coroutine.yield(1)
  coroutine.yield(2)
  return "end"
end

co = coroutine.create(myCoroutine)
  
 
print(coroutine.resume(co))  --> true 1
print(coroutine.resume(co))  --> true 2  --> false "cannot resume dead coroutine"
print(coroutine.resume(co))
print(coroutine.resume(co))