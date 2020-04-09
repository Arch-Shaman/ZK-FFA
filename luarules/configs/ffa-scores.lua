-- prices --

local store = {
	calldown-bomb = 620,
	calldown-tp = 1200,
	calldown-missile = 1500,
	calldown-stealth = 2000,
	calldown-sling = 750,
	calldown-super-nuke = 7000,
	calldown-arty = 2250,
	anti-nuke = 6500,
	calldown-super-meteor = 10000,
	striderarty = 2000,
	striderdante = 1500,
	striderdetriment = 6000,
	striderfunnelweb = 2700,
	striderscorpion = 3600,
	striderbantha = 5000,
	energyfusion = 600,
	energysingu = 2200,
	metalmaker = 4500,
	super-eco = 20000,
	elimination = 3000,
	super-tremor = 10000,
	comm-hp = 2200,
}

-- objective base --

local bonus = {} -- when do you get a bonus?
bonus[1] = 2500
bonus[2] = 5000
bonus[3] = 7500
bonus[4] = 10000

local bonuspts = {} -- how much do you get for achieving this milestone?
bonuspts[1] = 500
bonuspts[2] = 1000
bonuspts[3] = 1500
bonuspts[4] = 2500

local eliminationbonus = 1000
local bestscorebonus = 1.1

-- bonus score for scoring objectives --
local objectivebonus = {
	pyro = 0.2, -- 20% of damage as points
	rampage = 0.1, -- 10% of kill value as points
	slow = 0.2, -- 20% of slow damage as points
	reclaim = 0.1, -- 10% of reclaim as points. 200m = 20pts
	attrition = 0.05, -- transfers 5% of value when killed.
	comm = 0.25, -- 25% of damage as points
	perfectionend = 250, -- 250pts rewarded for owner of perfection.
	perfectionkill = 0.1, -- 10% when perfection kills something or is killed.
	air = 0.25, -- 25% of air damage as points.
	ship = 0.25, -- 25% of damage dealt by airships as points
	reaper = 0.5, -- grandfinale reaper does 50% of damage as points.
	terror = 0.5, -- damage to the terror is rewarded with this value
	terrordmg = 0.4,
	silo = 0.4, -- 40% of silo damage is rewarded with points.
	killer = 0.5, -- 50% of kills as points during turbo killer.
	carrier = 0.25, -- 25% of damage by carriers as points
	carrierloss = -500, -- 500pts to respawn a carrier.
	carrierkill = 100, -- 100pts for killing a carrier.
	phantom = 0.3, -- damage as pts during phantom warfare.
	phantomloss = -10, -- 10 pt penalty for losing phantoms.
	phantomkill = 5, -- 5pts for killing a phantom.
	strider = 0.25, -- pts for ultimate cobblation
}

local livingbonus = 2.25 -- bonus score for surviving until the end.
