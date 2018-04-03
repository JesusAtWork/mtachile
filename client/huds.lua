function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

sw,sh = guiGetScreenSize()


function drawSelector()
	--udechile = isMouseInPosition(0,sh/2-150,300,300)
	--colocolo = isMouseInPosition(sw/4+50,sh/2-150,300,300)
	--police = isMouseInPosition(sw/2+50,sh/2-150,300,300)
	--otakus = isMouseInPosition(sw*3/4+50,sh/2-50,300,100)
	-- Fondo
	dxDrawRectangle(0,0,sw/4,sh,tocolor(219,39,23,200))
	dxDrawRectangle(sw/4,0,sw/4,sh,tocolor(27,27,31,200))
	dxDrawRectangle(sw/2,0,sw/4,sh,tocolor(0,115,40,200))
	dxDrawRectangle(sw*3/4,0,sw/4,sh,tocolor(57,147,205,200))

	-- Logo

	dxDrawText('Escoge tu Equipo',sw/2-230,30,0.5,0.5,tocolor(255,255,255,255),5,'princedown')


end
addEventHandler("onClientRender",root,drawSelector)

local components = { "weapon", "ammo", "health", "clock", "money", "breath", "armour", "wanted", "Radar" }

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
function ()

	--if udechile then
	--	guiCreateStaticImage(-25,sh/2-175,350,350,'client/img/udechile.png',false)
	--else
		udechile = guiCreateStaticImage(0,sh/2-150,300,300,'client/img/udechile.png',false)
	--end
	--if colocolo then
	--	guiCreateStaticImage(sw/4+25,sh/2-175,350,350,'client/img/colocolo.png',false)	
	--else
		colocolo = guiCreateStaticImage(sw/4+50,sh/2-150,300,300,'client/img/colocolo.png',false)	
	--end		
	--if police then
	--	guiCreateStaticImage(sw/2+25,sh/2-175,350,350,'client/img/police.png',false)										
	--else
		police = guiCreateStaticImage(sw/2+50,sh/2-150,300,300,'client/img/police.png',false)										
	--end		
	--if otakus then
	--	guiCreateStaticImage(sw*3/4+25,sh/2-75,350,120,'client/img/otakus.png',false)	
	--else
		otakus = guiCreateStaticImage(sw*3/4+50,sh/2-50,300,100,'client/img/otakus.png',false)	
	--end	

	addEventHandler("onClientGUIClick", udechile, 
	function() 
	   join(1)
	end
	) 
	addEventHandler("onClientGUIClick", colocolo, 
	function() 
	   join(2)
	end
	)
	addEventHandler("onClientGUIClick", police, 
	function() 
	   join(3)
	end
	)
	addEventHandler("onClientGUIClick", otakus, 
	function() 
	   join(4)
	end
	)

	setCameraMatrix(2489,-1666,14)		
	showCursor(true,true)
	himno = playSound('client/sounds/himno.mp3')

	local x,y,z = getElementPosition(getLocalPlayer())
	for _, component in ipairs( components ) do
		setPlayerHudComponentVisible( component, false )
	end
end
)

function join(id)
	triggerServerEvent ( "onSpawn", resourceRoot, id )
	removeEventHandler('onClientRender',getRootElement(),drawSelector)
	showCursor(false,true)
	guiSetVisible(udechile,false)
	guiSetVisible(colocolo,false)
	guiSetVisible(police,false)
	guiSetVisible(otakus,false)
	stopSound(himno)
	setPlayerHudComponentVisible( 'Radar', true )
end

addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
function ()
	for _, component in ipairs( components ) do
		setPlayerHudComponentVisible( component, true )
	end
end
)