badwords = {
	"badword1",
	"badword2",
	"badword3",
	"badword4",
<<<<<<< HEAD
	"badword5" -- don't put a comma on the last one
=======
	"badword5" -- don't put a comma on the last one, entries must be lowercase
>>>>>>> parent of 970f4d3... Delete badwordblocker.lua
}

function findBadWords(table, text)
	for k,v in pairs(table) do
<<<<<<< HEAD
		if string.find(text, v) then return true end
=======
		if string.find(string.lower(text), v) then return true end
>>>>>>> parent of 970f4d3... Delete badwordblocker.lua
	end
end

if SERVER then
	hook.Remove("PlayerSay", "nobadword")
	hook.Add( "PlayerSay", "nobadword", function(ply, text)
		if findBadWords(badwords, text) then return "" end --this blocks the player message, we can make other things happen too
	end)
end
