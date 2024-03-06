lib.locale()
local ui = false

RegisterNetEvent("dawsmo_report:openMenu")
AddEventHandler("dawsmo_report:openMenu", function ()
    ui = true
    SendNUIMessage({
        showUI = true,
        hideUI = false,
    })

    SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
    ui = false
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback('sendReport', function(data, cb)
    ui = false
    SetNuiFocus(false, false)
    local success = lib.callback.await("dawsmo_report:sendLog", false, data)
    if success then
        lib.notify({
            title = locale("success_notify_title"),
            description = locale("success_notify_desc"),
            type = 'success',
            duration = 5000,
            position = "top"
        })
    else
        lib.notify({
            title = locale("error_notify_title"),
            type = 'error',
            duration = 5000,
            position = "top"
        })
    end
    cb("ok")
end)

