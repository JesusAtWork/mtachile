function obj(FromName,id)
	local txd = engineImportTXD(engineLoadTXD('objects/'..FromName..'.txd'),id)
	local dff = engineReplaceModel(engineLoadDFF('objects/'..FromName..'.dff'),id)
	if not txd then
		outputConsole("ERROR at txd reemplased:" .. FromName .." to ".. id)
	end
	if not dff then
		outputConsole("ERROR at dff reemplased:" .. FromName .." to ".. id)

	end
end
function txd(FromName,id)
	local txd = engineImportTXD(engineLoadTXD('objects/'..FromName..'.txd'),id)
	if not txd then
		outputConsole("ERROR at txd reemplased:" .. FromName .." to ".. id)
	end
end
function dff(FromName,id)
	local dff = engineReplaceModel(engineLoadDFF('objects/'..FromName..'.dff'),id)
	if not dff then
		outputConsole("ERROR at dff reemplased:" .. FromName .." to ".. id)
	end
end
addEventHandler("onClientResourceStart",resourceRoot,
	function()		
		txd('cj_ext_vend',955)
		txd('cj_ext_vend',956)
		txd('cs_mountaintop',18368)
	end
)