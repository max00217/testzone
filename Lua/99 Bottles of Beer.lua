Bottle = 99
while Bottle > -1 do
    if Bottle > 1 then
        print(Bottle.." bottles of beer on the wall, "..Bottle.." bottles of beer.")
        Bottle = Bottle - 1
        print("Take one down and pass it around, "..Bottle.." bottles of beer on the wall.\n")
    elseif Bottle >=1 then
        print(Bottle.." bottle of beer on the wall, "..Bottle.." bottle of beer.")
        Bottle = Bottle - 1
        print("Take one down and pass it around, No more bottle of beer on the wall.\n")
    elseif Bottle == 0 then
        print("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.")
        Bottle = Bottle - 1
    end
end