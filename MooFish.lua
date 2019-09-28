local c = {}

SLASH_MOOFISH1 = "/moofish"
function SlashCmdList.MOOFISH(msg, editbox)
	if next(c) == nil then print("Noch keinen Fisch gefangen."); return end
	for k,v in pairs(c) do print(k..": "..v.." Stück") end
end

local f = CreateFrame("FRAME")
f:RegisterEvent("LOOT_READY")

f:SetScript("OnEvent", function(self, event, autoLoot)
	if not IsFishingLoot() then return end
	-- fires two times if autolooting is enabled
	valueToAdd = autoLoot and 0.5 or 1
	local lootInfo = GetLootInfo()
	for i=#lootInfo,1,-1 do
		if c[lootInfo[i].item] == nil then
			c[lootInfo[i].item] = valueToAdd
		else
			c[lootInfo[i].item] = c[lootInfo[i].item] + valueToAdd
		end
	end
end)
