if config.updatesCheck then
    local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

    PerformHttpRequest('https://updates.blossomcripts.com/bsm-earthquake', function(statusCode, responseBody, headers)
        if statusCode == 200 then
            local data = json.decode(responseBody)

            if data then
                if data.version ~= currentVersion then
                    print('[blossomcripts.in] Resource "bsm-earthquake" is outdated. Please download the latest version from our GitHub: https://github.com/blossomcripts-in/bsm-earthquake.')
                else
                    print('[blossomcripts.in] Resource "bsm-earthquake" is up to date.')
                end

                if data.message then
                    print('[blossomcripts.in] ' .. data.message)
                end
            else
                print('[blossomcripts.in] Failed to check for updates for resource "bsm-earthquake".')
            end
        else
            print('[blossomcripts.in] Failed to perform update check for resource "bsm-earthquake".')
        end
    end, 'GET', '', {})
end

RegisterCommand('eq', function()
    TriggerClientEvent('bsm-earthquake:perform', -1)
end, true)
