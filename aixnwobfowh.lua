local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Limpeza de GUI antiga
pcall(function()
    game.CoreGui.NoclipGui:Destroy()
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "NoclipGui"
gui.ResetOnSpawn = false

-- Frame Principal
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 130) -- Aumentei um pouco o tamanho
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Linha de Detalhe (Estética)
local line = Instance.new("Frame", frame)
line.Size = UDim2.new(1, 0, 0, 2)
line.Position = UDim2.new(0, 0, 0, 30)
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.8
line.BorderSizePixel = 0

-- Título
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "by DavidGames3D | Noclip Gui"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 14

-- Pulsante toggle noclip
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.85, 0, 0, 35)
button.Position = UDim2.new(0.075, 0, 0, 75)
button.Text = "Ativar Noclip"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamSemibold
button.TextSize = 14
button.AutoButtonColor = false -- Desativado para usarmos nosso próprio efeito

local bCorner = Instance.new("UICorner", button)
bCorner.CornerRadius = UDim.new(0, 8)

-- Noclip logic
local noclip = false
local connection
local RunService = game:GetService("RunService")

local function toggleNoclip()
    noclip = not noclip
    
    if noclip then
        button.Text = "Noclip: ON"
        button.BackgroundColor3 = Color3.fromRGB(46, 204, 113) -- Verde
        connection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        button.Text = "Noclip: OFF"
        button.BackgroundColor3 = Color3.fromRGB(231, 76, 60) -- Vermelho
        if connection then connection:Disconnect() end
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

button.MouseButton1Click:Connect(toggleNoclip)

-- Efeitos de Hover no Botão
button.MouseEnter:Connect(function()
    button.BackgroundTransparency = 0.2
end)
button.MouseLeave:Connect(function()
    button.BackgroundTransparency = 0
end)

-- 💡 Mobile/PC Drag System
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
