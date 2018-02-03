local npcName = "World Quests"
local AvailableQuest = {}

ChatFrame1:AddMessage("|cFFFF0000Welcome to LazyCH by Moas on Retro-WoW");
ChatFrame1:AddMessage("|cFFFF0000Intended to make CH farming even more braindead.");
function LazyCH_OnLoad()
	LazyCH:RegisterEvent("ADDON_LOADED");
	LazyCH:RegisterEvent("PLAYER_LOGIN");
	LazyCH:RegisterEvent("QUEST_GREETING")
	LazyCH:RegisterEvent("QUEST_PROGRESS")
	LazyCH:RegisterEvent("QUEST_COMPLETE")
	LazyCH:RegisterEvent("CHAT_MSG_SAY")
	LazyCH:RegisterEvent("QUEST_DETAIL")
end
function LazyCH_OnEvent(event)
	if (event == "PLAYER_LOGIN") then
	elseif event == "QUEST_GREETING" then
		local tarName = UnitName("target");
		if (tarName == npcName) then
		LazyCH:RegisterEvent("QUEST_DETAIL");
		AvailableQuest = GetNumAvailableQuests();
		ActiveQuest = GetNumActiveQuests();
			if (ActiveQuest >= 1) then
				SelectActiveQuest(1);
				CompleteQuest();
			else
			SelectAvailableQuest(9);
			end
		end	
	elseif event == "QUEST_DETAIL" then
		AcceptQuest();
	elseif event == "QUEST_PROGRESS" then
		CompleteQuest();
	elseif event == "QUEST_COMPLETE" then
		GetQuestReward();
	end		
end
