function car(FromName,id)
	local txd = engineImportTXD(engineLoadTXD('cars/'..FromName..'.txd'),id)
	local dff = engineReplaceModel(engineLoadDFF('cars/'..FromName..'.dff'),id)
	if not txd then
		outputConsole("ERROR at txd reemplased:" .. FromName .." to ".. id)
	end
	if not txd then
		outputConsole("ERROR at dff reemplased:" .. FromName .." to ".. id)
	end
end
addEventHandler("onClientResourceStart",resourceRoot,
	function()
		car('elegy',562)
		car('turismo',451)
		car('copcarsf',596)
		car('copcarsf',597)
		car('copcarsf',598)
		car('pony',413)
		--car('bus',431)
	end
)