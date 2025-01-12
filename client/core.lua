local earthquaking = false

RegisterNetEvent('bsm-earthquake:perform', function()
    if earthquaking then
        return
    end

    earthquaking = true

    -- Start sound effect
    SendNUIMessage({
        type = 'play',
        volume = config.soundEffectVolume
    })

    local activeMs = 0
    local intensity = config.intensity.min
    local totalDurationMs = config.buildUpMs + config.wearOffMs

    -- Initial camera shake
    ShakeGameplayCam(config.effect, intensity)

    while activeMs < totalDurationMs do
        if activeMs < config.buildUpMs then
            -- Increase shake intensity during build-up
            SetGameplayCamShakeAmplitude(intensity)

            intensity = intensity + config.intensity.step
            if intensity > config.intensity.max then
                intensity = config.intensity.max
            end
        else
            -- Decrease shake intensity during wear-off
            intensity = intensity - config.intensity.step
            if intensity < config.intensity.min then
                intensity = config.intensity.min
            end

            SetGameplayCamShakeAmplitude(intensity)
        end

        -- Wait for the next tick interval
        Wait(config.tickIntervalMs)

        -- Update the active time
        activeMs = activeMs + config.tickIntervalMs
    end

    -- Stop the shake at the end
    ShakeGameplayCam(config.effect, 0.0)

    earthquaking = false
end)
