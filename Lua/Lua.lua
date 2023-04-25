s="1010010"
p=""
l=""

for i=1,#s do 
    if string.sub(s,i,i)=="0" then 
        l=l.." " 
    else l=l.."." 
    end 
end

s=string.reverse(s)

for i=1,#s do
    if string.sub(s,i,i)=="0" then 
        p=p.." "
    else p=p.."."
    end
end

for i=1,#p do 
    if string.sub(p,i,i)=="." then 
        io.write(string.char(32)) 
    else io.write(string.char(72)) 
    end
end

io.write(string.char(32))
for i=1,#l do 
    if string.sub(l,i,i)=="." then 
        io.write(string.char(87)) 
    else io.write(string.char(111)) 
    end
end

io.write(string.char(32,72,87,111,32,46,87,46,46,46,87,46,87,111,87,33,87,111,87,33))
