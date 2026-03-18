local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/Lazarios-ui-library/main/CoreLib.lua"))()

-- Serviços necessários
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local noclipConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")

-- criação da Window
local Win = NexusUI:MakeWindow({
    Title = "David Hub",
    SubTitle = "v4.0 | by davidgames3d", 
    Theme = "Dark",
    RGBBorder = true,
    LogoId    = "rbxassetid://132152602986684", 
}) 

Win:SetSize(520) 
Win:SetOpacity(0.1)

-- tabs
local Home = Win:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://123456",
})

local Local = Win:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://123456",
})

local Teleport = Win:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://123456",
})

local Info = Win:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://123456",
})

-- icon/image Label

Home:MakeImage({
    Image  = "rbxassetid://132152602986684",
    Height = 150,
    Desc   = "Logo do hub",
})

-- Sections home
Home:MakeSection("Version")

Home:MakeLabel("David Hub V4.0") 

Home:MakeLabel("Lazarus/Lazarios UI Lib V1.0.4") 

Home:MakeSection("Créditos") 

Home:MakeLabel("Redes sociais") 

Home:MakeImage({
    Image  = "rbxassetid://5597737428",
    Height = 90,
    Desc   = "Youtube",
})

Home:MakeInput({
        Name = "Youtube do criador",
        Placeholder = "https://youtube.com/@davidgames3d?si=sIBVlOB3inq3sCHb",
        Callback = function(text, enter)

        end,
})

Home:MakeImage({
    Image  = "rbxassetid://10367063073",
    Height = 90,
    Desc   = "Discord",
})

Home:MakeInput({
        Name = "Discord do criador",
        Placeholder = "https://discord.gg/nMGZGk5Tj",
        Callback = function(text, enter)
                setclipboard("https://discord.gg/nMGZGk5Tj")
        end,
})

Home:MakeImage({
    Image  = "rbxassetid://106465383791027",
    Height = 90,
    Desc   = "Github do criador",
})

Home:MakeInput({
        Name = "Github do criador",
        Placeholder = "https://github.com/Anonimo-666777",
        Callback = function(text, enter)
                setclipboard("https://github.com/Anonimo-666777")
        end,
})

-- Section Info
Info:MakeSection("Version") 

Info:MakeLabel("Lazarus UI Lib v1.0.0 beta")

Info:MakeLabel("David Hub V2.0") 

Info:MakeSection("curiosidades e fatos") 

Info:MakeLabel("Esse script usa uma Lib chamada Lazarus UI Lib ou lazarios feita por mim") 

Info:MakeLabel("Eu faço scripts só pelo celular sei programar pouco mas tô aprendendo") 

Info:MakeLabel("Eu fiz o site da key com o mimo gratuitamente sem saber scriptar css, js nem html") 

Info:MakeSection("INFO ADICIONAL") 

Info:MakeLabel("O Hub é Universal mas dependendo do jogo terá funções novas e tabs novas em cada jogo tipo dandy world e brookhaven")

-- Section LocalPlayer
Local:MakeSection("scripts") 

Local:MakeButton({
        Name = "Lazarus hub universal Script",
        Callback = function()
                loadstring(game:HttpGet("https://pastefy.app/sJjppszH/raw"))()
        end,
})

Local:MakeButton({
        Name = "Lalol hub backdoor scanner universal",
        Callback = function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Lalol-backdoor-83783"))()
        end,
})

Local:MakeSection("LocalPlayer") 

local imageID = ""

Local:MakeInput({
        Name = "Decal/Texture All",
        Placeholder = "Digite o seu ID de Imagem",
        Callback = function(text, enter)
                imageID = text
        end,
})

Local:MakeButton({
        Name = "Executar Decal/Texture All",
        Callback = function()
                if imageID == "" then
                        return
                end

                local formattedID = imageID
                if not string.match(formattedID, "^rbxassetid://") then
                        formattedID = "rbxassetid://" .. formattedID
                end

                local function applyToInstance(instance)
                        if instance:IsA("BasePart") or instance:IsA("MeshPart") or instance:IsA("SpecialMesh") or instance:IsA("UnionOperation") then
                                for _, child in ipairs(instance:GetChildren()) do
                                        if child:IsA("Texture") then
                                                child.Texture = formattedID
                                        elseif child:IsA("Decal") then
                                                child.Texture = formattedID
                                        end
                                end

                                local hasTexture = false
                                for _, child in ipairs(instance:GetChildren()) do
                                        if child:IsA("Texture") or child:IsA("Decal") then
                                                hasTexture = true
                                                break
                                        end
                                end

                                if not hasTexture then
                                        local decal = Instance.new("Decal")
                                        decal.Texture = formattedID
                                        decal.Face = Enum.NormalId.Front
                                        decal.Parent = instance

                                        local decalBack = Instance.new("Decal")
                                        decalBack.Texture = formattedID
                                        decalBack.Face = Enum.NormalId.Back
                                        decalBack.Parent = instance

                                        local decalTop = Instance.new("Decal")
                                        decalTop.Texture = formattedID
                                        decalTop.Face = Enum.NormalId.Top
                                        decalTop.Parent = instance

                                        local decalBottom = Instance.new("Decal")
                                        decalBottom.Texture = formattedID
                                        decalBottom.Face = Enum.NormalId.Bottom
                                        decalBottom.Parent = instance

                                        local decalLeft = Instance.new("Decal")
                                        decalLeft.Texture = formattedID
                                        decalLeft.Face = Enum.NormalId.Left
                                        decalLeft.Parent = instance

                                        local decalRight = Instance.new("Decal")
                                        decalRight.Texture = formattedID
                                        decalRight.Face = Enum.NormalId.Right
                                        decalRight.Parent = instance
                                end
                        end

                        if instance:IsA("SpecialMesh") then
                                instance.TextureId = formattedID
                        end

                        if instance:IsA("Sky") then
                                instance.SkyboxBk = formattedID
                                instance.SkyboxDn = formattedID
                                instance.SkyboxFt = formattedID
                                instance.SkyboxLf = formattedID
                                instance.SkyboxRt = formattedID
                                instance.SkyboxUp = formattedID
                        end
                end

                local function recurse(parent)
                        for _, instance in ipairs(parent:GetDescendants()) do
                                applyToInstance(instance)
                        end
                end

                recurse(workspace)

                for _, player in ipairs(game.Players:GetPlayers()) do
                        if player.Character then
                                recurse(player.Character)
                                for _, part in ipairs(player.Character:GetDescendants()) do
                                        if part:IsA("SpecialMesh") then
                                                part.TextureId = formattedID
                                        end
                                        if part:IsA("Shirt") then
                                                part.ShirtTemplate = formattedID
                                        end
                                        if part:IsA("Pants") then
                                                part.PantsTemplate = formattedID
                                        end
                                        if part:IsA("ShirtGraphic") then
                                                part.Graphic = formattedID
                                        end
                                end
                        end
                end

                print("Decal/Texture All aplicado com ID: " .. formattedID)
        end,
})

Local:MakeButton({
        Name = "Fly Gui",
        Callback = function()
                loadstring(game:HttpGet("https://pastefy.app/h8KwvbDk/raw"))()
        end,
})

Local:MakeButton({
        Name = "ShiftLocker",
        Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/disaster-CREW/Shift-lock-for-mobile/refs/heads/main/shiftlock.lua"))()
        end,
})

Local:MakeButton({
        Name = "WalkFling Universal",
        Callback = function()
                loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
        end,
})

Local:MakeSlider({
        Name = "Velocidade",
        Min = 0,
        Max = 500,
        Default = 16,
        Suffix = " sp",
        Callback = function(value)
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.WalkSpeed = value
                end
        end,
})

Local:MakeSlider({
        Name = "Altura do Pulo",
        Min = 0,
        Max = 500,
        Default = 50,
        Suffix = " jp",
        Callback = function(value)
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.UseJumpPower = true
                        player.Character.Humanoid.JumpPower = value
                end
        end,
})

Local:MakeButton({
        Name = "Resetar Atributos",
        Callback = function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid.WalkSpeed = 16
                        player.Character.Humanoid.JumpPower = 50
                        print("Atributos resetados!")
                end
        end
})

Local:MakeToggle({
        Name = "Noclip",
        Default = false,
        Callback = function(state)
                if state then
                        -- Ativa o Noclip
                        noclipConnection = RunService.Stepped:Connect(function()
                                if player.Character then
                                        for _, part in pairs(player.Character:GetDescendants()) do
                                                if part:IsA("BasePart") then
                                                        part.CanCollide = false
                                                end
                                        end
                                end
                        end)
                else
                        -- Desativa o Noclip
                        if noclipConnection then
                                noclipConnection:Disconnect()
                                noclipConnection = nil
                        end
                        -- Opcional: Forçar a colisão de volta imediatamente (ou esperar o reset do motor físico)
                end
        end,
})

Local:MakeToggle({
    Name = "God Mode",
    Default = false,
    Callback = function(state)
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then
            hum.MaxHealth = state and math.huge or 100
            hum.Health = hum.MaxHealth
            NexusUI:Notify({ Title = "God Mode", Message = state and "Ativado!" or "Desativado!", Duration = 2 })
        end
    end,
})

Local:MakeToggle({
    Name = "Invisível",
    Default = false,
    Callback = function(state)
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = state and 1 or 0
                end
                if part:IsA("Decal") then
                    part.Transparency = state and 1 or 0
                end
            end
            NexusUI:Notify({ Title = "Visual", Message = state and "Invisível ativado!" or "Visível novamente!", Duration = 2 })
        end
    end,
})

Local:MakeToggle({
    Name = "Rainbow Character",
    Default = false,
    Callback = function(state)
        if state then
            _G.RainbowActive = true
            task.spawn(function()
                local hue = 0
                while _G.RainbowActive do
                    hue = (hue + 1) % 360
                    local color = Color3.fromHSV(hue / 360, 1, 1)
                    local char = LocalPlayer.Character
                    if char then
                        for _, part in pairs(char:GetDescendants()) do
                            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                                part.Color = color
                            end
                        end
                    end
                    task.wait(0.05)
                end
            end)
        else
            _G.RainbowActive = false
            NexusUI:Notify({ Title = "Visual", Message = "Rainbow desativado!", Duration = 2 })
        end
    end,
})

Local:MakeSection("Ambiente")

Local:MakeToggle({
    Name = "Fullbright",
    Default = false,
    Callback = function(state)
        Lighting.Brightness = state and 10 or 1
        Lighting.FogEnd = state and 100000 or 100000
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(70, 70, 70)
        Lighting.OutdoorAmbient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 140)
        NexusUI:Notify({ Title = "Visual", Message = state and "Fullbright ativado!" or "Fullbright desativado!", Duration = 2 })
    end,
})

Local:MakeSlider({
    Name = "Hora do Dia",
    Min = 0,
    Max = 24,
    Default = 14,
    Suffix = "h",
    Callback = function(value)
        Lighting.ClockTime = value
    end,
})

Local:MakeToggle({
    Name = "Remover Névoa",
    Default = false,
    Callback = function(state)
        Lighting.FogEnd = state and 100000 or 1000
        Lighting.FogStart = state and 99999 or 0
        NexusUI:Notify({ Title = "Visual", Message = state and "Névoa removida!" or "Névoa restaurada!", Duration = 2 })
    end,
})

Local:MakeDropdown({
    Name = "Tema do Céu",
    Options = { "Normal", "Noite", "Amanhecer", "Pôr do Sol", "Tempestade" },
    Default = "Normal",
    Callback = function(selected)
        if selected == "Normal" then
            Lighting.ClockTime = 14
            Lighting.Brightness = 1
            Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        elseif selected == "Noite" then
            Lighting.ClockTime = 0
            Lighting.Brightness = 0
            Lighting.Ambient = Color3.fromRGB(10, 10, 30)
        elseif selected == "Amanhecer" then
            Lighting.ClockTime = 6
            Lighting.Brightness = 0.5
            Lighting.Ambient = Color3.fromRGB(255, 160, 80)
        elseif selected == "Pôr do Sol" then
            Lighting.ClockTime = 18
            Lighting.Brightness = 0.5
            Lighting.Ambient = Color3.fromRGB(255, 100, 50)
        elseif selected == "Tempestade" then
            Lighting.ClockTime = 12
            Lighting.Brightness = 0.1
            Lighting.Ambient = Color3.fromRGB(40, 40, 60)
            Lighting.FogEnd = 200
            Lighting.FogColor = Color3.fromRGB(80, 80, 100)
        end
        NexusUI:Notify({ Title = "Visual", Message = "Tema: " .. selected, Duration = 2 })
    end,
})

Local:MakeSection("outros players") 

local selectedPlayer = nil

-- Função para pegar nicks (exceto o seu)
local function getPlayerNames()
    local names = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            table.insert(names, v.Name)
        end
    end
    return names
end

-- Dropdown de Jogadores
local PlayerDropdown = Local:MakeDropdown({
    Name = "Selecionar Alvo",
    Options = getPlayerNames(),
    Default = "Nenhum",
    Callback = function(selected)
        selectedPlayer = Players:FindFirstChild(selected)
        print("Alvo selecionado:", selected)
    end,
})

-- Botão de Teleport / Fling
Local:MakeButton({
    Name = "Teleport",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = selectedPlayer.Character.HumanoidRootPart.Position
            -- Lógica simplificada de Teleport (para Fling você precisaria rodar seu script de Velocity aqui)
            LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
            print("Indo até: " .. selectedPlayer.Name)
        else
            print("Selecione um jogador vivo primeiro!")
        end
    end,
})

-- Botão de Spy (Spectate)
Local:MakeButton({
    Name = "Spy (Assistir)",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character then
            workspace.CurrentCamera.CameraSubject = selectedPlayer.Character.Humanoid
        else
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        end
    end,
})

-- Opcional: Atualizar a lista quando alguém entra/sai
Players.PlayerAdded:Connect(function() PlayerDropdown:Refresh(getPlayerNames(), true) end)
Players.PlayerRemoving:Connect(function() PlayerDropdown:Refresh(getPlayerNames(), true) end)

local selectedPlayer = nil
local espEnabled = false
local espObjects = {}

-- função que cria o ESP
local function createESP(player)

        if player == LocalPlayer then return end

        local char = player.Character
        if not char then return end

        if espObjects[player] then
                espObjects[player]:Destroy()
        end

        local highlight = Instance.new("Highlight")
        highlight.FillColor = Color3.fromRGB(255,0,0)
        highlight.OutlineColor = Color3.fromRGB(255,255,255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Adornee = char
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = char

        -- nome acima da cabeça
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0,200,0,50)
        billboard.StudsOffset = Vector3.new(0,3,0)
        billboard.AlwaysOnTop = true

        local text = Instance.new("TextLabel")
        text.Size = UDim2.new(1,0,1,0)
        text.BackgroundTransparency = 1
        text.TextColor3 = Color3.fromRGB(255,0,0)
        text.TextStrokeTransparency = 0
        text.TextScaled = true
        text.Font = Enum.Font.SourceSansBold
        text.Text = player.Name.." | @"..player.DisplayName
        text.Parent = billboard

        billboard.Parent = char:WaitForChild("Head")

        espObjects[player] = highlight
end

-- remover esp
local function removeESP(player)
        if espObjects[player] then
                espObjects[player]:Destroy()
                espObjects[player] = nil
        end
end

-- INPUT (escolher player)
Local:MakeInput({
        Name = "Nick/nome do player",
        Placeholder = "Digite o nome desejado...",
        Callback = function(text, enter)

                for _,player in pairs(Players:GetPlayers()) do
                        if string.lower(player.Name):find(string.lower(text)) 
                        or string.lower(player.DisplayName):find(string.lower(text)) then

                                selectedPlayer = player
                                print("Player selecionado:", player.Name)
                                break
                        end
                end

        end,
})

-- TOGGLE (ativar esp no player selecionado)
Local:MakeToggle({
        Name = "Ativar/desativar",
        Default = false,
        Callback = function(state)

                espEnabled = state

                if selectedPlayer then

                        if state then
                                createESP(selectedPlayer)
                        else
                                removeESP(selectedPlayer)
                        end

                end

        end,
})

-- ESP ALL
Local:MakeButton({
        Name = "Esp All",
        Callback = function()

                for _,player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer then
                                createESP(player)
                        end
                end

        end,
})

Local:MakeButton({
    Name = "Remover ESP All",
    Callback = function()
        for p, _ in pairs(espObjects) do removeESP(p) end
        NexusUI:Notify({ Title = "ESP", Message = "ESP removido de todos!", Duration = 2 })
    end,
})

-- teleporte tab/section
Teleport:MakeSection("Coordenadas Manuais")

local tpX, tpY, tpZ = 0, 0, 0

Teleport:MakeInput({
    Name = "X",
    Placeholder = "Ex: 100",
    Callback = function(text) tpX = tonumber(text) or 0 end,
})

Teleport:MakeInput({
    Name = "Y",
    Placeholder = "Ex: 10",
    Callback = function(text) tpY = tonumber(text) or 0 end,
})

Teleport:MakeInput({
    Name = "Z",
    Placeholder = "Ex: -50",
    Callback = function(text) tpZ = tonumber(text) or 0 end,
})

Teleport:MakeButton({
    Name = "Ir para Coordenadas",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(tpX, tpY, tpZ)
            NexusUI:Notify({ Title = "Teleport", Message = string.format("Tp para: %.0f, %.0f, %.0f", tpX, tpY, tpZ), Duration = 3 })
        end
    end,
})

Teleport:MakeSection("Posição Atual")

Teleport:MakeButton({
    Name = "Copiar Posição Atual",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            local posStr = string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
            setclipboard(posStr)
            NexusUI:Notify({ Title = "Teleport", Message = "Copiado: " .. posStr, Duration = 3 })
        end
    end,
})

Teleport:MakeSection("Waypoints")

local waypoints = {}
local waypointNames = {}

Teleport:MakeInput({
    Name = "Nome do Waypoint",
    Placeholder = "Ex: Minha Casa",
    Callback = function(text)
        _G.waypointName = text
    end,
})

Teleport:MakeButton({
    Name = "Salvar Posição Atual",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local name = _G.waypointName or ""
        if hrp and name ~= "" then
            waypoints[name] = hrp.CFrame
            table.insert(waypointNames, name)
            WaypointDropdown:Refresh(waypointNames, false)
            NexusUI:Notify({ Title = "Waypoint", Message = "Salvo: " .. name, Duration = 2 })
        else
            NexusUI:Notify({ Title = "Erro", Message = "Digite um nome primeiro!", Duration = 3 })
        end
    end,
})

WaypointDropdown = Teleport:MakeDropdown({
    Name = "Ir para Waypoint",
    Options = waypointNames,
    Default = "Nenhum",
    Callback = function(selected)
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and waypoints[selected] then
            hrp.CFrame = waypoints[selected]
            NexusUI:Notify({ Title = "Teleport", Message = "Indo para: " .. selected, Duration = 2 })
        end
    end,
})

Teleport:MakeButton({
    Name = "Deletar Waypoint Selecionado",
    Callback = function()
        local name = _G.waypointName or ""
        if waypoints[name] then
            waypoints[name] = nil
            for i, v in ipairs(waypointNames) do
                if v == name then table.remove(waypointNames, i) break end
            end
            WaypointDropdown:Refresh(waypointNames, false)
            NexusUI:Notify({ Title = "Waypoint", Message = "Deletado: " .. name, Duration = 2 })
        else
            NexusUI:Notify({ Title = "Erro", Message = "Waypoint não encontrado!", Duration = 3 })
        end
    end,
})

-- Brookhaven Rp
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

if game.PlaceId == 4924922222 or string.find(string.lower(gameName), "Brookhaven RP") then
    local Brookhaven = Win:MakeTab({
        Name = "Brookhaven",
        Icon = "rbxassetid://123456789", -- Exemplo de ícone de casa
    })

    Brookhaven:MakeSection("Scripts")

Brookhaven:MakeButton({
        Name = "Cartola Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
        end,
})

Brookhaven:MakeButton({
        Name = "Antares Hub Original",
        Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/refs/heads/main/AntaresHubWorking.lua"))()
        end,
})

Brookhaven:MakeButton({
        Name = "Sp Hub",
        Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven"))()
        end,
})

Brookhaven:MakeButton({
        Name = "Sander XY",
        Callback = function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
        end,
})

Brookhaven:MakeSection("Teleport Para locais")

local locais = {
        ["🏠 Spawn / Lobby"] = Vector3.new(0, 0, 0),
        ["🏪 Shopping"] = Vector3.new(185, 18, -62),
        ["🚔 Centro Policial"] = Vector3.new(-295, 18, 112),
        ["🏦 Banco"] = Vector3.new(130, 18, 95),
        ["🏥 Hospital"] = Vector3.new(-180, 18, -210),
        ["⛽ Posto de Gasolina"] = Vector3.new(310, 18, 180),
        ["🍔 Restaurante"] = Vector3.new(60, 18, -150),
        ["🏫 Escola"] = Vector3.new(-90, 18, 270),
        ["✈️ Aeroporto"] = Vector3.new(450, 18, -300),
        ["🚒 Bombeiros"] = Vector3.new(-220, 18, 50),
        ["⚓ Porto"] = Vector3.new(380, 18, 350),
        ["🌲 Floresta"] = Vector3.new(-400, 18, -350),
        ["🏖️ Praia"] = Vector3.new(500, 5, 500),
        ["🏠 Bairro Residencial"] = Vector3.new(-150, 18, -80),
        ["🎭 Teatro"] = Vector3.new(20, 18, 200),
}

local localSelecionado = "🏠 Spawn / Lobby"

local opcoes = {}
for nome, _ in pairs(locais) do
        table.insert(opcoes, nome)
end
table.sort(opcoes)

Brookhaven:MakeDropdown({
        Name = "Locais do Mapa",
        Options = opcoes,
        Default = "🏠 Spawn / Lobby",
        Callback = function(selected)
                localSelecionado = selected
        end,
})

Brookhaven:MakeButton({
        Name = "Teleportar",
        Callback = function()
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

                if humanoidRootPart and locais[localSelecionado] then
                        humanoidRootPart.CFrame = CFrame.new(locais[localSelecionado])
                end
        end,
})

end

if game.PlaceId == 16116270224 or string.find(string.lower(gameName), "Dandy world") then
    local Dw = Win:MakeTab({
        Name = "Dandy world",
        Icon = "rbxassetid://123456789", -- Exemplo de ícone de casa
    })

    Dw:MakeSection("Scripts")

Dw:MakeButton({
        Name = "Boxten Gui / Nexus",
        Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/box-01/refs/heads/main/box%23%5Bboxten%20sex%20gui%5D/box%23%5Bmain%5D.lua"))()
        end,
})

Dw:MakeButton({
        Name = "G0bbyD0llan",
        Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/G0bbyD0llan/Ez-hub/refs/heads/main/Dandys_World_HUB_GHV"))()
        end,
})

Dw:MakeButton({
        Name = "Yoxi Hub script",
        Callback = function()
                loadstring(game:HttpGet("https://yoxi-hub.ru/api/loader"))()
        end,
})

end

if game.PlaceId == 109983668079237

local Brainrot = Win:MakeTab({
    Name = "Roube um Brainrot",
    Icon = "rbxassetid://123456",
})

Brainrot:MakeButton({
	Name = "Ajjans Duels",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e8c2b7bdfd494b913839f58581a203f9.lua"))()
	end,
})

Brainrot:MakeButton({
	Name = "Kurd Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/dontasklol/Stealingurbrainrots/refs/heads/main/Kurd%20hub"))()
	end,
})

Brainrot:MakeButton({
	Name = "Lemon Hub",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6d08fbf253529a4fefa32ff404bd5448.lua"))()
	end,
})

Brainrot:MakeButton({
	Name = "Express Hub",
	Callback = function()
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))()
	end,
})

Brainrot:MakeButton({
	Name = "Cartola Hub | Roube um Brainrot",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/StealABrainrot.lua",true))()
	end,
})

end

if game.PlaceId == 79546208627805

local 99Nights = Win:MakeTab({
    Name = "99 noites na floresta",
    Icon = "rbxassetid://123456",
})

99Nights:MakeButton({
	Name = "OverFlow Hub",
	Callback = function()
		loadstring(game:HttpGet("https://overflow.cx/loader.html"))()
	end,
})

99Nights:MakeButton({
	Name = "VoidWare",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-VOIDWARE-122596"))()
	end,
})

99Nights:MakeButton({
	Name = "IndraHub",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/wJKRvL4W"))()
	end,
})

end

-- Tab de Configuração
local Config = Win:MakeTab({
    Name = "Config",
    Icon = "rbxassetid://123456",
})

Config:MakeSection("Tamanho da Janela")

Config:MakeSlider({
    Name = "Tamanho",
    Min = 300,
    Max = 900,
    Default = 520,
    Suffix = " px",
    Callback = function(value)
        Win:SetSize(value)
    end,
})

Config:MakeButton({
    Name = "Resetar Tamanho",
    Callback = function()
        Win:SetSize(520)
        NexusUI:Notify({
            Title = "Config",
            Message = "Tamanho resetado para 520!",
            Duration = 3,
        })
    end,
})

Config:MakeSection("Opacidade da Janela")

Config:MakeDropdown({
    Name = "Opacidade",
    Options = {"0", "0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1"},
    Default = "0.1",
    Callback = function(value)
        Win:SetOpacity(tonumber(value))
        NexusUI:Notify({
            Title = "Config",
            Message = "Opacidade: " .. value,
            Duration = 2,
        })
    end,
})

Config:MakeButton({
    Name = "Resetar Opacidade",
    Callback = function()
        Win:SetOpacity(0.1)
        NexusUI:Notify({
            Title = "Config",
            Message = "Opacidade resetada para 0.1!",
            Duration = 3,
        })
    end,
})

Config:MakeSection("Info Adicional")

Config:MakeLabel("O Hub é Universal mas dependendo do jogo terá funções novas e tabs novas em cada jogo tipo Dandy World e Brookhaven")