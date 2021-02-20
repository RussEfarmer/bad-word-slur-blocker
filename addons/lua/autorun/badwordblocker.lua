badwords = {
	"badword1",
	"badword2",
	"badword3",
	"badword4",
	"badword5" -- don't put a comma on the last one
}

function findBadWords(table, text)
	for k,v in pairs(table) do
		if string.find(text, v) then return true end
	end
end


if SERVER then
	hook.Remove("PlayerSay", "nobadword")
	hook.Add( "PlayerSay", "nobadword", function(ply, text)
		if findBadWords(badwords, text) then return "" end --this blocks the player message, we can make other things happen too
	end)
end
