lib.locale()

RegisterCommand("report", function(source)
	TriggerClientEvent("dawsmo_report:openMenu", source)
end, false)

lib.callback.register("dawsmo_report:sendLog", function (source, data)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if data and data.message and data.type and xPlayer then
		SendLog(data, xPlayer, src)
		return true
	else
		return false
	end
end)

function SendLog(data, xPlayer, sourceReport)
    local logValue = (locale("DiscordLog")):format(xPlayer.getName(), sourceReport, data.message)
    local embedData = { {
        ['title'] = data.type,
        ['color'] = SVConfig.Log.logColor,
        ['footer'] = {
            ['text'] = "Dawsmo report " .. os.date(),
        },
        ['description'] = logValue,
    } }
    PerformHttpRequest(SVConfig.Log.webhook, nil, 'POST', json.encode({
        username = SVConfig.Log.botName,
        content = ("||%s||"):format(SVConfig.Log.tagRole),
        embeds = embedData
    }), {
        ['Content-Type'] = 'application/json'
    })
end