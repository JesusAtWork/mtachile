function skin(folder,FromName,id)
	engineImportTXD(engineLoadTXD('Skins/'..folder..'/'..FromName..'.txd'),id)
	engineReplaceModel(engineLoadDFF('Skins/'..folder..'/'..FromName..'.dff'),id)
	if not txd then
		outputConsole("ERROR at txd reemplased:"..folder.." from ".. FromName .." to ".. id)
	end
	if not txd then
		outputConsole("ERROR at dff reemplased:"..folder.." from " .. FromName .." to ".. id)
	end
end
addEventHandler("onClientResourceStart",resourceRoot,
	function()
		skin('police',1,280)
		skin('police',2,281)
		skin('police',3,282)
		skin('police',4,283)
		skin('police',1,284)
		skin('police',2,288)

		skin('colo',1,105)
		skin('colo',1,106)
		skin('colo',1,107)

		skin('u',1,102)
		skin('u',2,103)
		skin('u',3,104)

		skin('otakus',1,125)
		--skin('otakus',2,126)
		skin('otakus',3,127)
		skin('otakus',4,173)
		skin('otakus',5,174)						
	end
)