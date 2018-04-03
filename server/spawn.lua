players = getElementsByType("player")

-- Skins
uSkins = {102,103,104}
ccSkins = {105,106,107}
pSkins = {280,281,282,283,284,288}
oSkins = {125,127,173,174} --126 

-- X Y Z Angulo Skin
u = {426,-1566,28,180,uSkins[math.random(1,3)]}
cc = {2489,-1666,14,0,ccSkins[math.random(1,3)]}
p = {1539,-1686,6,0,pSkins[math.random(1,3)]}
o = {-2404,700,36,0,oSkins[math.random(1,3)]}

--[[function getTeam(team)
	outputChatBox(team,passedPlayer)
	return team
end
]]--

function playerJoin()
	_G.player = source
	--fadeCamera(source, true)
	--setTimer(spawnFunct, 3000, 1, source)
	local amount = 50000  -- 50 lucas
		for id, source in ipairs(getElementsByType("player")) do
		givePlayerMoney ( source, amount )
	end
end
addEventHandler("onPlayerJoin", root, playerJoin)

function spawnFunct(team)
	if (not isElement(_G.player)) then return false end
	if team == 1 then
		spawnPlayer(_G.player,u[1],u[2], u[3], u[4],u[5])
	elseif team == 2 then
		spawnPlayer(_G.player,cc[1],cc[2], cc[3], cc[4],cc[5])
	elseif team == 3 then
		spawnPlayer(_G.player,p[1],p[2], p[3], p[4],p[5])
	elseif team == 4 then
		spawnPlayer(_G.player,o[1],o[2], o[3], o[4],o[5])
	end
	setCameraTarget(_G.player, _G.player)
end
addEvent( "onSpawn", true )
addEventHandler( "onSpawn", root, spawnFunct)

for k,v in ipairs(players) do
	spawnFunct(v)
end

function playerWasted()
	fadeCamera(source, true)	
	setTimer(spawnFunct, 3000, 1, source)
	takePlayerMoney (source, 4000 )
end
addEventHandler("onPlayerWasted", root, playerWasted)