local str = io.read()

function CMS(s)
    local len = #s
    local count_a = 0
    for i = 1, len do
        if s:sub(i, i) == 'a' then
            count_a = count_a + 1
        end
    end
    local q = len
    for i = 1, len do
        local count = count_a
        local t = 0
        for j = i, i + len - 1 do
            if count == 0 then
                break
            end
            if s:sub(j % len + 1, j % len + 1) == 'b' then
                t = t + 1
                count = count - 1
            else
                count = count - 1
            end
        end
        q = math.min(q, t)
    end
    return q
end

print(CMS(str))