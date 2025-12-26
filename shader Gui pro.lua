local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "ShaderGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.28, 0.48)
frame.Position = UDim2.fromScale(0.35, 0.25)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 16)

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.12)
title.Position = UDim2.fromScale(0, 0)
title.BackgroundTransparency = 1
title.Text = "Shader Presets Pro 🌙⛈️🔥"
title.TextColor3 = Color3.fromRGB(200, 200, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.fromScale(0.07, 0.4)
closeBtn.Position = UDim2.fromScale(0.90, 0.05)
closeBtn.Text = "✕"
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextScaled = true
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 8)
closeBtn.MouseButton1Click:Connect(function() gui.Visible = false end)

-- Layout principal (VerticalList)
local mainLayout = Instance.new("UIListLayout", frame)
mainLayout.Padding = UDim.new(0, 6)
mainLayout.SortOrder = Enum.SortOrder.LayoutOrder
mainLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
mainLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Botões Layout (Grid pra ficar bonito)
local buttonsFrame = Instance.new("Frame")
buttonsFrame.Size = UDim2.fromScale(0.95, 0.45)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.LayoutOrder = 1
buttonsFrame.Parent = frame

local gridLayout = Instance.new("UIGridLayout", buttonsFrame)
gridLayout.CellSize = UDim2.fromScale(0.48, 0.22)
gridLayout.CellPadding = UDim2.fromScale(0.02, 0.02)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Sliders Frame
local slidersFrame = Instance.new("Frame")
slidersFrame.Size = UDim2.fromScale(0.95, 0.30)
slidersFrame.BackgroundTransparency = 1
slidersFrame.LayoutOrder = 2
slidersFrame.Parent = frame

local slidersLayout = Instance.new("UIListLayout", slidersFrame)
slidersLayout.Padding = UDim.new(0, 4)
slidersLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Variáveis globais
local rainEmitter = nil
local stormCoroutine = nil
local intensity = 1
local brightness = 2
local fogDensity = 0.3
local visible = true

-- GetOrCreate Effects
local function getOrCreate(name, class)
    local obj = Lighting:FindFirstChild(name)
    if not obj then
        obj = Instance.new(class, Lighting)
        obj.Name = name
    end
    return obj
end

local sky = getOrCreate("Sky", "Sky")
local bloom = getOrCreate("BloomEffect", "BloomEffect")
local atmosphere = getOrCreate("Atmosphere", "Atmosphere")
local colorCorrection = getOrCreate("ColorCorrection", "ColorCorrectionEffect")
local sunRays = getOrCreate("SunRaysEffect", "SunRaysEffect")

-- Função pra aplicar Intensity
local function applyIntensity()
    bloom.Intensity = (1.5 * intensity)
    bloom.Size = (24 * intensity)
    atmosphere.Density = (fogDensity * intensity)
end

-- Botão genérico com animação
local function createButton(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.TextColor3 = Color3.fromRGB(230, 230, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.LayoutOrder = order
    btn.Parent = buttonsFrame

    local c = Instance.new("UICorner", btn)
    c.CornerRadius = UDim.new(0, 12)

    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad)
    btn.MouseButton1Click:Connect(function()
        local tweenIn = TweenService:Create(btn, tweenInfo, {Size = gridLayout.CellSize + UDim2.fromScale(-0.03, -0.02)})
        local tweenOut = TweenService:Create(btn, tweenInfo, {Size = gridLayout.CellSize})
        tweenIn:Play()
        tweenIn.Completed:Connect(function() tweenOut:Play() end)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        task.wait(0.1)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        callback()
    end)
    return btn
end

-- PRESETS
createButton("🌙 Night", 1, function()
    sky.MoonTextureId = "rbxassetid://6441992599"
    sky.MoonAngularSize = 20
    Lighting.ClockTime = 0
    brightness = 2
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(50, 50, 100)
    Lighting.GlobalShadows = true
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
    sunRays.Intensity = 0.2
    fogDensity = 0.4
    applyIntensity()
end)

createButton("☀️ Day", 2, function()
    Lighting.ClockTime = 14
    brightness = 3
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(180, 180, 180)
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
    sunRays.Intensity = 0.1
    fogDensity = 0.1
    applyIntensity()
end)

createButton("🌫️ Horror", 3, function()
    Lighting.ClockTime = 1
    brightness = 1.2
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(20, 10, 10)
    colorCorrection.TintColor = Color3.fromRGB(150, 100, 100)
    sunRays.Intensity = 0.3
    fogDensity = 0.6
    applyIntensity()
end)

createButton("🌑 Blood Moon", 4, function()
    sky.MoonTextureId = "rbxassetid://6441992599"
    sky.MoonAngularSize = 25
    Lighting.ClockTime = 0
    brightness = 1.5
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(80, 20, 20)
    Lighting.GlobalShadows = true
    colorCorrection.TintColor = Color3.fromRGB(255, 150, 150)  -- Vermelho sangue!
    colorCorrection.Saturation = -0.3
    sunRays.Intensity = 0.4
    fogDensity = 0.5
    applyIntensity()
end)

createButton("🌧️ Rain", 5, function()
    Lighting.ClockTime = 18
    brightness = 1.8
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(100, 120, 150)
    colorCorrection.TintColor = Color3.fromRGB(200, 220, 255)  -- Azul chuva
    sunRays.Intensity = 0
    fogDensity = 0.7
    applyIntensity()
    toggleRain(true)
end)

createButton("⛈️ Storm", 6, function()
    Lighting.ClockTime = 20
    brightness = 1.0
    Lighting.Brightness = brightness
    Lighting.Ambient = Color3.fromRGB(50, 60, 100)
    colorCorrection.TintColor = Color3.fromRGB(180, 200, 255)
    sunRays.Intensity = 0.5
    fogDensity = 0.8
    applyIntensity()
    toggleRain(true)
    startStorm()
end)

createButton("🔄 Default", 7, function()
    Lighting.ClockTime = 14
    Lighting.Brightness = 1
    Lighting.Ambient = Color3.fromRGB(128, 128, 128)
    intensity = 1
    brightness = 1
    fogDensity = 0
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
    colorCorrection.Saturation = 0
    bloom.Intensity = 0
    atmosphere.Density = 0
    sunRays.Intensity = 0
    toggleRain(false)
    stopStorm()
end)

-- SISTEMA DE CHUVA
function toggleRain(enabled)
    if rainEmitter then rainEmitter:Destroy() end
    if not enabled then return end

    local attachment = Instance.new("Attachment", camera)
    rainEmitter = Instance.new("ParticleEmitter", attachment)
    rainEmitter.Texture = "rbxassetid://419625073"  -- Rain streaks top
    rainEmitter.Lifetime = NumberRange.new(0.6, 1.2)
    rainEmitter.Rate = 300
    rainEmitter.SpreadAngle = Vector2.new(5, 5)
    rainEmitter.Speed = NumberRange.new(25, 35)
    rainEmitter.VelocityInheritance = 0.5
    rainEmitter.Acceleration = Vector3.new(0, -50, 0)
    rainEmitter.Color = ColorSequence.new(Color3.fromRGB(200, 200, 255))
    rainEmitter.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.3),
        NumberSequenceKeypoint.new(0.5, 0.7),
        NumberSequenceKeypoint.new(1, 1)
    }
    rainEmitter.Size = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.1),
        NumberSequenceKeypoint.new(1, 0.3)
    }
end

-- STORM LIGHTNING
function startStorm()
    if stormCoroutine then coroutine.close(stormCoroutine) end
    stormCoroutine = coroutine.create(function()
        while true do
            task.wait(math.random(2, 8))
            local flashTween = TweenService:Create(Lighting, TweenInfo.new(0.1), {Brightness = brightness * 3, Ambient = Color3.fromRGB(255, 255, 255)})
            flashTween:Play()
            flashTween.Completed:Connect(function()
                TweenService:Create(Lighting, TweenInfo.new(0.3), {Brightness = brightness, Ambient = Color3.fromRGB(50, 60, 100)}):Play()
            end)
        end
    end)
    coroutine.resume(stormCoroutine)
end

function stopStorm()
    if stormCoroutine then coroutine.close(stormCoroutine) end
    stormCoroutine = nil
end

-- SLIDERS (Draggable knob)
local function createSlider(labelText, min, max, default, updateFunc)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.fromScale(1, 0.22)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    sliderFrame.Parent = slidersFrame

    local sCorner = Instance.new("UICorner", sliderFrame)
    sCorner.CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel", sliderFrame)
    label.Size = UDim2.fromScale(1, 0.3)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(180, 180, 220)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true

    local bar = Instance.new("Frame", sliderFrame)
    bar.Size = UDim2.fromScale(0.9, 0.15)
    bar.Position = UDim2.fromScale(0.05, 0.55)
    bar.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    local barCorner = Instance.new("UICorner", bar)
    barCorner.CornerRadius = UDim.new(0, 8)

    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.fromScale(0.08, 1)
    knob.Position = UDim2.fromScale((default - min) / (max - min), 0)
    knob.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    knob.BorderSizePixel = 0
    local knobCorner = Instance.new("UICorner", knob)
    knobCorner.CornerRadius = UDim.new(1, 0)

    local dragging = false
    local value = default

    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relPos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            knob.Position = UDim2.fromScale(relPos, 0)
            value = min + (max - min) * relPos
            updateFunc(value)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return sliderFrame
end

-- Criar Sliders
createSlider("Intensity", 0, 3, 1, function(val)
    intensity = val
    applyIntensity()
end)

createSlider("Brightness", 0, 5, 2, function(val)
    brightness = val
    Lighting.Brightness = val
end)

createSlider("Fog Density", 0, 1, 0.3, function(val)
    fogDensity = val
    applyIntensity()
end)

-- Keybind P pra toggle
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.P then
        visible = not visible
        gui.Visible = visible
    end
end)

-- Inicial Night pra demo
task.wait(1)
sky.MoonTextureId = "rbxassetid://6441992599"
sky.MoonAngularSize = 20

print("Shader Pro GUI carregada! Pressione 'P' pra toggle 🌟⛈️")