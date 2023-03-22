myCoroutine = coroutine.create(function()
    print("Coroutine started")
    local x = coroutine.yield(1)
    print("Coroutine resumed with value", x)
    local y = coroutine.yield(2)
    print("Coroutine resumed with value", y)
    print("Coroutine finished")
end)

status, value = coroutine.resume(myCoroutine)
print("Coroutine status:", status, "Coroutine value:", value)

status, value = coroutine.resume(myCoroutine, "Hello")
print("Coroutine status:", status, "Coroutine value:", value)

status, value = coroutine.resume(myCoroutine, "World")
print("Coroutine status:", status, "Coroutine value:", value)