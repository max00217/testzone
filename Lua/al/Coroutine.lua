-- Define a coroutine that yields two values
function myCoroutine()
    coroutine.yield(1)
    coroutine.yield(2)
  end
  
  -- Create a new coroutine
  co = coroutine.create(myCoroutine)
  
  -- Call the coroutine and print the yielded values
  print(coroutine.resume(co))  --> true 1
  print(coroutine.resume(co))  --> true 2
  print(coroutine.resume(co))  --> false "cannot resume dead coroutine"