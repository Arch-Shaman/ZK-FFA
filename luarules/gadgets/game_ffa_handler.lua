function gadget:GetInfo()
	return {
		name      = "FFA Game Mode",
		desc      = "Handles game mode",
		author    = "_Shaman",
		date      = "April 5, 2020",
		license   = "CC-0",
		layer     = 5,
		enabled   = true,
	}
end

if not gadgetHandler:IsSyncedCode() then -- no unsynced nonsense
	
end
-- Speedups --
local PRIVATE = {private = true, public = false}
local INLOS = {allied = true, inlos = true, inradar = false, public = false}
local PUBLIC = {public = true}

-- vars --
local teamlist = {}
local bonus = {}
local teamcount = 0
local timer = 60 * 3 -- timer until next round
local peace = true
local round = "peace"
local roundcount = 0
local roundmax = 5
local roundscore = {}
local score = {} -- hold score for each team.
local purchases = {} -- who has what purchased?


local function OrderScores()
	local ordered = {}
	local scores = score
	local maxvalue = scores[1]
	local maxindex = 1
	for i=1, #scores do
		for j=1, #scores do
			if scores[j] > maxvalue then
				maxvalue = scores[j]
				maxindex = j
			end
		end
		ordered[#ordered+1] = maxindex
		maxvalue = -99999999
		table.remove(scores, maxindex)
		maxindex = -9
	end
end

local function MakePeace()
	for i=1, #Spring.GetAllyTeamList()-1 do
		for j=1, #Spring.GetAllyTeamList()-1 do
			if j ~= i then
				Spring.SetAlly(i,j,true)
			end
		end
	end
	peace = true
end

local function MakeWar()
	for i=1, #Spring.GetAllyTeamList()-1 do
		for j=1, #Spring.GetAllyTeamList()-1 do
			if j ~= i then
				Spring.SetAlly(i,j,false)
			end
		end
	end
	peace = false
end

local function StoreBought(item,team)
	

function gadget:Initialized()
	Spring.SetGlobalLos(#Spring.GetAllyTeamList(), true)
	MakePeace()
	for i=1, #Spring.GetAllyTeamList()-1 do
		local teamlist = Spring.GetTeamList(i)
		score[i] = 0
		roundscore[i] = 0
		for j = 1 #teamlist do
			teamcount = teamcount+1
			Spring.SetTeamRulesParam(teamlist[j], "isAlive", 1)
		end
	end
end

local function ResetRound()
	for i=1, #Spring.GetTeamList()-1 do
		
		Spring.SetTeamRulesParam(i, "rscore", 0)
		

function gadget:GameFrame(f)
	if f == 1 then
		Spring.Echo("game_message: \t\tUntitled FFA mode v0.1 by _Shaman.\nCheat, Lie, Kill your way to victory!\nBeta")
	if f%30 == 0 then
		timer = timer - 1
		if timer == 0 and not peace then
			MakePeace()
			-- do end of round stuff --
		elseif timer == 0 and peace then
			MakeWar()
			
