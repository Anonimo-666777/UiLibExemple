game.StarterGui:SetCore("SendNotification", {
    Title = "hackL0rdGui"; -- Título da notificação
    Text = "By davidgames3d Team"; -- Texto da notificação
    Icon = "rbxassetid://134827225876114"; -- Ícone opcional
    Duration = 9; -- Duração em segundos
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/UiLibExemple/main/david.lua"))()

-- Certifique-se de ter o ScreenGui criado primeiro
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenu"
screenGui.Parent = game.CoreGui -- Coloca no CoreGui para não sumir ao morrer

-- Painel Principal
local frame = Instance.new("ScrollingFrame")
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 2
frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
frame.ScrollBarThickness = 4
frame.Active = true
frame.Draggable = true 
frame.Parent = screenGui

-- Layout em Grade
local layout = Instance.new("UIGridLayout")
layout.Parent = frame
layout.CellPadding = UDim2.new(0, 5, 0, 5)
layout.CellSize = UDim2.new(0, 110, 0, 40)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.StartCorner = Enum.StartCorner.TopLeft

-- --- BOTÃO TOGGLE (ABRIR/FECHAR) ---
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Image = "rbxassetid://80454038618945" -- Substitua pelo ID da sua imagem
toggleButton.Active = true
toggleButton.Draggable = true -- Permite arrastar o botão de abrir

-- Função para abrir/fechar
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Arredondar bordas do botão (Opcional)
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = toggleButton

-- Função para criar botões com feedback visual simples
local function criarBotao(texto, callback)
    local button = Instance.new("TextButton")
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BorderColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = texto
    button.Font = Enum.Font.GothamBold
    button.TextSize = 12
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        local success, err = pcall(callback)
        if not success then warn("Erro no botão " .. texto .. ": " .. err) end
    end)
end

-- --- FUNÇÕES DOS BOTÕES ---
criarBotao("Speed 100", function() 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

criarBotao("JumpPower 300", function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.UseJumpPower = true
    hum.JumpPower = 300
end)

criarBotao("Noclip (Loop)", function()
    local char = game.Players.LocalPlayer.Character
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

criarBotao("Fly GUI", function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/UiLibExemple/main/FGS.lua"))()
end)

criarBotao("R15 to R6", function() 
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
end)

criarBotao("ESP Players", function() 
    local function addHighlight(plr)
        if plr == game.Players.LocalPlayer then return end
        local function apply(char)
            local h = Instance.new("Highlight", char)
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        if plr.Character then apply(plr.Character) end
        plr.CharacterAdded:Connect(apply)
    end
    for _, p in pairs(game.Players:GetPlayers()) do addHighlight(p) end
    game.Players.PlayerAdded:Connect(addHighlight)
end)

criarBotao("fling gui", function() 
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Flinger-GUI-WORKS-ANYWHERE-53126"))()
end) 

criarBotao("Lazarus Hub by Menakto", function() 
loadstring(game:HttpGet("https://pastefy.app/djCPVNLm/raw", true))()
end) 

criarBotao("Dark hub ", function() 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/UiLibExemple/main/UiMain.lua"))()
end) 

criarBotao("Decal all", function() 
-- Coloque o ID da nova imagem aqui (apenas os números)
local novoID = "rbxassetid://134827225876114" 

-- Percorre todos os descendentes do Workspace
for _, objeto in pairs(game.Workspace:GetDescendants()) do
	-- Verifica se é uma Textura (padrão)
	if objeto:IsA("Texture") then
		objeto.Texture = novoID
	-- Verifica se é um Decal (adesivo/face)
	elseif objeto:IsA("Decal") then
		objeto.Texture = novoID
	-- Verifica se é uma Mesh com textura (FileMesh)
	elseif objeto:IsA("FileMesh") then
		objeto.TextureId = novoID
	end
end
end) 

criarBotao("Dandy World", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/box-01/refs/heads/main/box%23%5Bboxten%20sex%20gui%5D/box%23%5Bmain%5D.lua"))()
end) 

criarBotao("aimbot ", function() 
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Viper-X-Universal-Aimbot-127608"))()
end) 

criarBotao("F3X Gui", function() 
loadstring(game:HttpGet("https://pastebin.com/raw/4iK4pvHv"))()
end) 

criarBotao("C00lgui", function() 
loadstring(game:GetObjects("rbxassetid://11801763945")[1].Source)()
end) 