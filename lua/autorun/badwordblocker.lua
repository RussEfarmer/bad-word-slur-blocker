badwords = {
	"badword1",
	"badword2",
	"badword3",
	"badword4",
	"badword5" -- don't put a comma on the last one, must be in lowercase
}

function findBadWords(table, text)
	for k,v in pairs(table) do
		if string.find(string.lower(text), v) then return true end
	end
end

if SERVER then
	hook.Remove("PlayerSay", "nobadword")
	hook.Add( "PlayerSay", "nobadword", function(ply, text)
		if findBadWords(badwords, text) then 
			if not ply:GetPData("tmuted") or ply:GetPData("tmuted") == 0 or ply:GetPData("tmuted") == "0" then
				RunConsoleCommand("ulx", "tmute", ply:Nick(), "5")
				RunConsoleCommand("ulx", "asay", ply:Nick().." ("..ply:SteamID().. ") was muted for saying: \""..text.."\"")
				return ""
			end
		end
	end)
end
