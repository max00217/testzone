TypeSize = {
    a = "",
    b = 0,
    c = 0.0
}

print("크기")
print(string.len(TypeSize.a) .. ", " .. tostring(TypeSize.b):len() .. ", " .. string.len(tostring(TypeSize.c)))

print("타입사이즈 크기")
print(table.getn(TypeSize))