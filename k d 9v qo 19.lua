local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/Lazarios-ui-library/main/CoreLib.lua"))()

-- Serviços
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local noclipConnection

-- Controle de tabs já carregadas
local tabsCarregadas = {}

-- Serviço de Save
local HttpService = game:GetService("HttpService")
local SAVE_FILE = "DavidHub_Save.json"

local function DefaultSave()
    return {
        opacity = 0.1,
        size = 520,
        waypoints = {}
    }
end

local saveData = DefaultSave()

-- Carregar save
local function LoadSave()
    if isfile(SAVE_FILE) then
        local ok, result = pcall(function()
            return HttpService:JSONDecode(readfile(SAVE_FILE))
        end)
        if ok and result then
            saveData = result
            -- garantir que waypoints existe
            if not saveData.waypoints then saveData.waypoints = {} end
        end
    end
end

-- Salvar
local function SaveData()
    local ok, err = pcall(function()
        writefile(SAVE_FILE, HttpService:JSONEncode(saveData))
    end)
    if not ok then
        Win:Notify({ Title = "Save", Content = "Erro ao salvar: " .. tostring(err), Duration = 4, Type = "Error" })
    end
end

LoadSave() -- carrega ao iniciar

-- Window
local Win = NexusUI:MakeWindow({
    Title = "David Hub",
    SubTitle = "v7.0 | by davidgames3d",
    Theme = "Dark",
    RGBBorder = true,
    LogoId = "rbxassetid://132152602986684",
})

Win:SetSize(saveData.size or 520)
Win:SetOpacity(saveData.opacity or 0.1)

-- notificação/mensagem de boas-vindas
NexusUI:MakeDialog({
    Title = "!Bem-vindo(a) Ao DAVID HUB!",
    Text  = "Espero que goste do meu Hub que fiz sozinho com minha própria lib",
    Buttons = {
        {Text = "Ignorar", Callback = function() Win:Notify({
	Title = "Espero que goste",
	Content = "Hub iniciado com sucesso.",
	Duration = 4,
	Type = "Success",
}) end},
        {Text = "Legal",  Callback = function() Win:Notify({
	Title = "Espero que goste!",
	Content = "Achou Legal meu Hub?!",
	Duration = 4,
	Type = "Success",
}) end},
    }
})

-- Tabs principais
local Home = Win:MakeTab({ Name = "Home", Icon = "rbxassetid://7539983773" })
local Local = Win:MakeTab({ Name = "Scripts", Icon = "rbxassetid://7992557358" })
local Teleport = Win:MakeTab({ Name = "Teleport", Icon = "rbxassetid://12941020168" })
local Info = Win:MakeTab({ Name = "Info", Icon = "rbxassetid://5832745500" })
local Game = Win:MakeTab({ Name = "Games", Icon = "rbxassetid://138342563252941" }) 

-- ========== HOME ==========
Home:MakeImage({ Image = "rbxassetid://132152602986684", Height = 150, Desc = "Logo do hub" })
Home:MakeSection("Version")
Home:MakeLabel("David Hub V7.0")
Home:MakeLabel("Lazarios UI Lib V1.0.4")
Home:MakeSection("Créditos")
Home:MakeLabel("Redes sociais")

Home:MakeImage({ Image = "rbxassetid://5597737428", Height = 90, Desc = "Youtube" })
Home:MakeButton({
    Name = "Copiar Youtube",
    Callback = function()
        setclipboard("https://youtube.com/@davidgames3d?si=sIBVlOB3inq3sCHb")
    end,
})

Home:MakeImage({ Image = "rbxassetid://10367063073", Height = 90, Desc = "Discord" })
Home:MakeButton({
    Name = "Copiar Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/nMGZGk5Tj")
    end,
})

Home:MakeImage({ Image = "rbxassetid://106465383791027", Height = 90, Desc = "Github do criador" })
Home:MakeButton({
    Name = "Copiar Github",
    Callback = function()
        setclipboard("https://github.com/Anonimo-666777")
    end,
})

-- ========== INFO ==========
Info:MakeSection("Version")
Info:MakeLabel("Lazarios UI Lib v1.0.4")
Info:MakeLabel("David Hub V7.0")
Info:MakeSection("Curiosidades e fatos")
Info:MakeLabel("Esse script usa uma Lib chamada Lazarios feita por mim")
Info:MakeLabel("Eu faço scripts só pelo celular sei programar pouco mas tô aprendendo")
Info:MakeLabel("Eu fiz o site da key com o mimo gratuitamente sem saber scriptar css, js nem html")
Info:MakeSection("Info Adicional")
Info:MakeLabel("O Hub é Universal mas dependendo do jogo terá funções novas e tabs novas em cada jogo tipo Dandy World e Brookhaven")

-- ========== SCRIPTS ==========
Local:MakeSection("Scripts")

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

Local:MakeButton({
    Name = "R15 Para R6",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
    end,
})

Local:MakeSection("Player")

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
    Win:Notify({
	Title = "Erro!",
	Content = "Decal/Texture All aplicado com ID: " .. formattedID,
	Duration = 4,
	Type = "Error",
})
    return
end

        local formattedID = imageID
        if not string.match(formattedID, "^rbxassetid://") then
            formattedID = "rbxassetid://" .. formattedID
        end

        local function applyToInstance(instance)
            if instance:IsA("BasePart") or instance:IsA("MeshPart") or instance:IsA("SpecialMesh") or instance:IsA("UnionOperation") then
                for _, child in ipairs(instance:GetChildren()) do
                    if child:IsA("Texture") or child:IsA("Decal") then
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
                    for _, face in ipairs({ Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Top, Enum.NormalId.Bottom, Enum.NormalId.Left, Enum.NormalId.Right }) do
                        local decal = Instance.new("Decal")
                        decal.Texture = formattedID
                        decal.Face = face
                        decal.Parent = instance
                    end
                end
            end

            if instance:IsA("SpecialMesh") then instance.TextureId = formattedID end
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
    local count = 0
    for _, instance in ipairs(parent:GetDescendants()) do
        applyToInstance(instance)
        count += 1

        if count % 100 == 0 then
            task.wait()
        end
    end
end

        recurse(workspace)

        for _, p in ipairs(game.Players:GetPlayers()) do
            if p.Character then
                for _, part in ipairs(p.Character:GetDescendants()) do
                    if part:IsA("SpecialMesh") then part.TextureId = formattedID end
                    if part:IsA("Shirt") then part.ShirtTemplate = formattedID end
                    if part:IsA("Pants") then part.PantsTemplate = formattedID end
                    if part:IsA("ShirtGraphic") then part.Graphic = formattedID end
                end
            end
        end

        Win:Notify({
    Title = "SUCESSO",
    Content = "ID aplicado:\n" .. formattedID,
    Duration = 4,
    Type = "Success",
})
    end,
})

Local:MakeButton({ Name = "Fly Gui", Callback = function() loadstring(game:HttpGet("https://pastefy.app/h8KwvbDk/raw"))() end })
Local:MakeButton({ Name = "ShiftLocker", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/disaster-CREW/Shift-lock-for-mobile/refs/heads/main/shiftlock.lua"))() end })
Local:MakeButton({ Name = "WalkFling Universal", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt", true))() end })

Local:MakeSlider({
    Name = "Velocidade", Min = 0, Max = 500, Default = 16, Suffix = " sp",
    Callback = function(value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end,
})

Local:MakeSlider({
    Name = "Altura do Pulo", Min = 0, Max = 500, Default = 50, Suffix = " jp",
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
        end
    end,
})

Local:MakeToggle({
    Name = "Noclip", Default = false,
    Callback = function(state)
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                if player.Character then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end,
})

Local:MakeToggle({
    Name = "God Mode", Default = false,
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
    Name = "Invisível", Default = false,
    Callback = function(state)
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = state and 1 or 0
                end
                if part:IsA("Decal") then part.Transparency = state and 1 or 0 end
            end
            NexusUI:Notify({ Title = "Visual", Message = state and "Invisível ativado!" or "Visível novamente!", Duration = 2 })
        end
    end,
})

local rainbowThread

Local:MakeToggle({
    Name = "Rainbow Character",
    Default = false,
    Callback = function(state)
        if state then
            if rainbowThread then return end

            _G.RainbowActive = true
            rainbowThread = task.spawn(function()
                local hue = 0
                while _G.RainbowActive do
                    hue = (hue + 1) % 360
                    local color = Color3.fromHSV(hue / 360, 1, 1)

                    local char = player.Character
                    if char then
                        for _, part in ipairs(char:GetChildren()) do
                            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                                part.Color = color
                            end
                        end
                    end

                    task.wait(0.05)
                end
                rainbowThread = nil
            end)
        else
            _G.RainbowActive = false
        end
    end,
})

local infiniteJumpEnabled = false
local infiniteJumpConn

Local:MakeToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(state)
        infiniteJumpEnabled = state
        if state then
            infiniteJumpConn = game:GetService("UserInputService").JumpRequest:Connect(function()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
            Win:Notify({ Title = "Infinite Jump", Content = "Ativado!", Duration = 3, Type = "Success" })
        else
            if infiniteJumpConn then infiniteJumpConn:Disconnect() infiniteJumpConn = nil end
            Win:Notify({ Title = "Infinite Jump", Content = "Desativado!", Duration = 3, Type = "Error" })
        end
    end,
})

-- ANTI-AFK
local antiAfkEnabled = false
local antiAfkConn

Local:MakeToggle({
    Name = "Anti-AFK",
    Default = false,
    Callback = function(state)
        antiAfkEnabled = state
        if state then
            -- Simula movimento virtual pra não kickar
            local VirtualUser = game:GetService("VirtualUser")
            antiAfkConn = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            Win:Notify({ Title = "Anti-AFK", Content = "Ativado! Não vai ser kickado.", Duration = 4, Type = "Success" })
        else
            if antiAfkConn then antiAfkConn:Disconnect() antiAfkConn = nil end
            Win:Notify({ Title = "Anti-AFK", Content = "Desativado!", Duration = 3, Type = "Error" })
        end
    end,
})

-- anti-kick
Local:MakeButton({
	Name = "Anti-kick",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/SUUUUUS00000/MEGGD-Anti-kick/refs/heads/main/MEGGD%20Best%20Anti-kick.lua'))()
	end,
})

-- ServerHop
Local:MakeButton({
	Name = "Server Hop",
	Callback = function()
		local HttpService = game:GetService("HttpService")
		local TeleportService = game:GetService("TeleportService")
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		
		local function Hop()
			local PlaceId = game.PlaceId
			-- URL para buscar servidores públicos do jogo atual
			local url = "https://roblox.com" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
			
			local success, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(url))
			end)
			
			if success and result and result.data then
				for _, server in ipairs(result.data) do
					-- Verifica se o servidor não é o atual e tem espaço disponível
					if server.id ~= game.JobId and server.playing < server.maxPlayers then
						TeleportService:TeleportToPlaceInstance(PlaceId, server.id, LocalPlayer)
						break
					end
				end
			else
				Win:Notify({ Title = "SERVER HOP", Content = "Erro ao tentar encontrar ou ir para outro servidor. Tente novamente.", Duration = 3, Type = "Error" })
			end
		end

		Win:Notify({ Title = "SERVER HOP", Content = "Tentando encontrar um servidor...", Duration = 3, Type = "Warning" })
		Hop()
	end,
})

Local:MakeSection("Ambiente")

Local:MakeToggle({
    Name = "Fullbright", Default = false,
    Callback = function(state)
        Lighting.Brightness = state and 10 or 1
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(70, 70, 70)
        Lighting.OutdoorAmbient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(140, 140, 140)
        Win:Notify({ Title = "Visual", Message = state and "Fullbright ativado!" or "Fullbright desativado!", Duration = 2 })
    end,
})

Local:MakeSlider({
    Name = "Hora do Dia", Min = 0, Max = 24, Default = 14, Suffix = "h",
    Callback = function(value) Lighting.ClockTime = value end,
})

Local:MakeToggle({
    Name = "Remover Névoa", Default = false,
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
            Lighting.ClockTime = 14; Lighting.Brightness = 1; Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        elseif selected == "Noite" then
            Lighting.ClockTime = 0; Lighting.Brightness = 0; Lighting.Ambient = Color3.fromRGB(10, 10, 30)
        elseif selected == "Amanhecer" then
            Lighting.ClockTime = 6; Lighting.Brightness = 0.5; Lighting.Ambient = Color3.fromRGB(255, 160, 80)
        elseif selected == "Pôr do Sol" then
            Lighting.ClockTime = 18; Lighting.Brightness = 0.5; Lighting.Ambient = Color3.fromRGB(255, 100, 50)
        elseif selected == "Tempestade" then
            Lighting.ClockTime = 12; Lighting.Brightness = 0.1; Lighting.Ambient = Color3.fromRGB(40, 40, 60)
            Lighting.FogEnd = 200; Lighting.FogColor = Color3.fromRGB(80, 80, 100)
        end
        NexusUI:Notify({ Title = "Visual", Message = "Tema: " .. selected, Duration = 2 })
    end,
})

Local:MakeSection("Outros Players")

local selectedPlayer = nil

local function getPlayerNames()
    local names = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then table.insert(names, v.Name) end
    end
    return names
end

local PlayerDropdown = Local:MakeDropdown({
    Name = "Selecionar Alvo",
    Options = getPlayerNames(),
    Default = "Nenhum",
    Callback = function(selected)
        selectedPlayer = Players:FindFirstChild(selected)
    end,
})

Local:MakeButton({
    Name = "Teleport até Alvo",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
        else
            NexusUI:Notify({ Title = "Erro", Message = "Selecione um jogador vivo!", Duration = 3 })
        end
    end,
})

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

Local:MakeButton({
    Name = "Parar Spy (assistir)",
    Callback = function()
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
    end,
})

Players.PlayerAdded:Connect(function() PlayerDropdown:Refresh(getPlayerNames(), true) end)
Players.PlayerRemoving:Connect(function() PlayerDropdown:Refresh(getPlayerNames(), true) end)

-- ESP
local espEnabled = false
local espObjects = {}

local function createESP(p)
    if p == LocalPlayer then return end
    local char = p.Character
    if not char then return end
    if espObjects[p] then espObjects[p]:Destroy() end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Adornee = char
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = char

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextStrokeTransparency = 0
    text.TextScaled = true
    text.Font = Enum.Font.SourceSansBold
    text.Text = p.Name .. " | @" .. p.DisplayName
    text.Parent = billboard
    billboard.Parent = char:WaitForChild("Head")
     
    espObjects[p] = highlight
end

local function removeESP(p)
    if espObjects[p] then
        espObjects[p]:Destroy()
        espObjects[p] = nil
    end
end

Local:MakeInput({
    Name = "Nick/nome do player",
    Placeholder = "Digite o nome desejado...",
    Callback = function(text, enter)
        for _, p in pairs(Players:GetPlayers()) do
            if string.lower(p.Name):find(string.lower(text)) or string.lower(p.DisplayName):find(string.lower(text)) then
                selectedPlayer = p
                break
            end
        end
    end,
})

Local:MakeToggle({
    Name = "Ativar/desativar ESP",
    Default = false,
    Callback = function(state)
        espEnabled = state
        if selectedPlayer then
            if state then createESP(selectedPlayer) else removeESP(selectedPlayer) end
        end
    end,
})

Local:MakeButton({
    Name = "ESP All",
    Callback = function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then createESP(p) end
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

-- ========== TELEPORT ==========
Teleport:MakeSection("Coordenadas Manuais")

local tpX, tpY, tpZ = 0, 0, 0

Teleport:MakeInput({ Name = "X", Placeholder = "Ex: 100", Callback = function(text) tpX = tonumber(text) or 0 end })
Teleport:MakeInput({ Name = "Y", Placeholder = "Ex: 10", Callback = function(text) tpY = tonumber(text) or 0 end })
Teleport:MakeInput({ Name = "Z", Placeholder = "Ex: -50", Callback = function(text) tpZ = tonumber(text) or 0 end })

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

-- ========== WAYPOINTS (com save) ==========
local waypoints = {}
local waypointNames = {}

-- Carregar waypoints salvos
for name, pos in pairs(saveData.waypoints) do
    waypoints[name] = CFrame.new(pos.X, pos.Y, pos.Z)
    table.insert(waypointNames, name)
end
table.sort(waypointNames)

Teleport:MakeSection("Waypoints")

Teleport:MakeInput({
    Name = "Nome do Waypoint",
    Placeholder = "Ex: Minha Casa",
    Callback = function(text) _G.waypointName = text end,
})

Teleport:MakeButton({
    Name = "Salvar Posição Atual",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local name = _G.waypointName or ""
        if hrp and name ~= "" then
            waypoints[name] = hrp.CFrame
            -- salva no arquivo
            saveData.waypoints[name] = { X = hrp.Position.X, Y = hrp.Position.Y, Z = hrp.Position.Z }
            SaveData()
            if not table.find(waypointNames, name) then
                table.insert(waypointNames, name)
                WaypointDropdown:Refresh(waypointNames, false)
            end
            Win:Notify({ Title = "Waypoint", Content = "Salvo: " .. name, Duration = 2, Type = "Success" })
        else
            Win:Notify({ Title = "Erro", Content = "Digite um nome primeiro!", Duration = 3, Type = "Error" })
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
            Win:Notify({ Title = "Teleport", Content = "Indo para: " .. selected, Duration = 2, Type = "Success" })
        end
    end,
})

Teleport:MakeButton({
    Name = "Deletar Waypoint Selecionado",
    Callback = function()
        local name = _G.waypointName or ""
        if waypoints[name] then
            waypoints[name] = nil
            saveData.waypoints[name] = nil
            SaveData()
            for i, v in ipairs(waypointNames) do
                if v == name then table.remove(waypointNames, i) break end
            end
            WaypointDropdown:Refresh(waypointNames, false)
            Win:Notify({ Title = "Waypoint", Content = "Deletado: " .. name, Duration = 2, Type = "Success" })
        else
            Win:Notify({ Title = "Erro", Content = "Waypoint não encontrado!", Duration = 3, Type = "Error" })
        end
    end,
})

-- ========== TABS POR JOGO ==========

Game:MakeSection("Carregar Tab de Jogo")

local function CriarTabJogo(nome, callback)
    Game:MakeButton({
        Name = nome,
        Callback = function()
            if tabsCarregadas[nome] then
                Win:Notify({ Title = "Aviso", Content = "Tab '" .. nome .. "' já foi carregada!", Duration = 3, Type = "Error" })
                return
            end
            tabsCarregadas[nome] = true
            callback()
            Win:Notify({ Title = "Jogo", Content = "Tab '" .. nome .. "' carregada!", Duration = 3, Type = "Success" })
        end,
    })
end

-- Dandy World
CriarTabJogo("Dandy World", function()
    local Dw = Win:MakeTab({ Name = "Dandy World", Icon = "rbxassetid://123456" })
    Dw:MakeSection("Scripts")
    Dw:MakeButton({ Name = "Boxten Gui", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/box-01/refs/heads/main/box%23%5Bboxten%20sex%20gui%5D/box%23%5Bmain%5D.lua"))() end })
    Dw:MakeButton({ Name = "G0bbyD0llan", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/G0bbyD0llan/Ez-hub/refs/heads/main/Dandys_World_HUB_GHV"))() end })
    Dw:MakeButton({ Name = "Yoxi Hub", Callback = function() loadstring(game:HttpGet("https://yoxi-hub.ru/api/loader"))() end })
end)

-- Roube um Brainrot
CriarTabJogo("Roube um Brainrot", function()
    local Brainrot = Win:MakeTab({ Name = "Roube um Brainrot", Icon = "rbxassetid://123456" })
    Brainrot:MakeSection("Scripts")
    Brainrot:MakeButton({ Name = "Ajjans Duels", Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e8c2b7bdfd494b913839f58581a203f9.lua"))() end })
    Brainrot:MakeButton({ Name = "Kurd Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dontasklol/Stealingurbrainrots/refs/heads/main/Kurd%20hub"))() end })
    Brainrot:MakeButton({ Name = "Lemon Hub", Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6d08fbf253529a4fefa32ff404bd5448.lua"))() end })
    Brainrot:MakeButton({ Name = "Express Hub", Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8824b23a4d9f2e0d62b4e69397d206b.lua"))() end })
    Brainrot:MakeButton({ Name = "Cartola Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/StealABrainrot.lua", true))() end })
end)

-- Adopt Me!
CriarTabJogo("Adopt Me!", function()
    local AdoptMe = Win:MakeTab({ Name = "Adopt Me!", Icon = "rbxassetid://123456" })
    AdoptMe:MakeSection("Scripts")
    AdoptMe:MakeButton({ Name = "Best Op Gui Keyless", Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))() end })
    AdoptMe:MakeButton({ Name = "Seraphins Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/astdoasdtiadn/Premium/refs/heads/main/main.lua"))() end })
    AdoptMe:MakeButton({ Name = "Veloria Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Wonik99/library-hub/refs/heads/main/main.lua"))() end })
end)

-- 99 Noites na Floresta
CriarTabJogo("99 Noites na Floresta", function()
    local NinetyNineNights = Win:MakeTab({ Name = "99 Noites", Icon = "rbxassetid://123456" })
    NinetyNineNights:MakeSection("Scripts")
    NinetyNineNights:MakeButton({ Name = "OverFlow Hub", Callback = function() loadstring(game:HttpGet("https://overflow.cx/loader.html"))() end })
    NinetyNineNights:MakeButton({ Name = "VoidWare", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/99-Nights-in-the-Forest-VOIDWARE-122596"))() end })
    NinetyNineNights:MakeButton({ Name = "IndraHub", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/wJKRvL4W"))() end })
end)

-- Brookhaven RP
CriarTabJogo("Brookhaven RP", function()
    local Brookhaven = Win:MakeTab({ Name = "Brookhaven", Icon = "rbxassetid://123456" })
    Brookhaven:MakeSection("Scripts")
    Brookhaven:MakeButton({ Name = "Cartola Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven", true))() end })
    Brookhaven:MakeButton({ Name = "Antares Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/refs/heads/main/AntaresHubWorking.lua"))() end })
    Brookhaven:MakeButton({ Name = "Sp Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven"))() end })
    Brookhaven:MakeButton({ Name = "Sander XY", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))() end })

    Brookhaven:MakeSection("Teleport Para Locais")
    local locais = {
        ["🏠 Spawn"] = Vector3.new(0, 5, 0),
        ["🏪 Shopping"] = Vector3.new(185, 18, -62),
        ["🚔 Polícia"] = Vector3.new(-295, 18, 112),
        ["🏦 Banco"] = Vector3.new(130, 18, 95),
        ["🏥 Hospital"] = Vector3.new(-180, 18, -210),
        ["⛽ Posto"] = Vector3.new(310, 18, 180),
        ["🍔 Restaurante"] = Vector3.new(60, 18, -150),
        ["🏫 Escola"] = Vector3.new(-90, 18, 270),
        ["✈️ Aeroporto"] = Vector3.new(450, 18, -300),
        ["🚒 Bombeiros"] = Vector3.new(-220, 18, 50),
    }
    local localSelecionado = "🏠 Spawn"
    local opcoes = {}
    for nome in pairs(locais) do table.insert(opcoes, nome) end
    table.sort(opcoes)
    Brookhaven:MakeDropdown({ Name = "Locais", Options = opcoes, Default = "🏠 Spawn", Callback = function(s) localSelecionado = s end })
    Brookhaven:MakeButton({
        Name = "Teleportar",
        Callback = function()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and locais[localSelecionado] then hrp.CFrame = CFrame.new(locais[localSelecionado]) end
        end,
    })
end)

-- Blox Fruits
CriarTabJogo("Blox Fruits", function()
    local BF = Win:MakeTab({ Name = "Blox Fruits", Icon = "rbxassetid://123456" })
    BF:MakeSection("Scripts")
    BF:MakeButton({ Name = "Hoho Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu1/hoho/main/hohov3"))() end })
    BF:MakeButton({ Name = "Zen Hub", Callback = function() loadstring(game:HttpGet("https://zenscripts.xyz/bloxfruits"))() end })
    BF:MakeButton({ Name = "Mango Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/notmango77/MangoHub/main/loader.lua"))() end })
end)

-- Blade Ball
CriarTabJogo("Blade Ball", function()
    local BB = Win:MakeTab({ Name = "Blade Ball", Icon = "rbxassetid://123456" })
    BB:MakeSection("Scripts")
    BB:MakeButton({ Name = "Sirius Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu1/sirius/main/sirius"))() end })
    BB:MakeButton({ Name = "Violent Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ViolentScripts/BladeBall/main/loader.lua"))() end })
end)

-- Murder Mystery 2
CriarTabJogo("Murder Mystery 2", function()
    local MM2 = Win:MakeTab({ Name = "Murder Mystery 2", Icon = "rbxassetid://123456" })
    MM2:MakeSection("Scripts")
    MM2:MakeButton({ Name = "Psycho Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ltsRune/PsychoHub/main/loader.lua"))() end })
    MM2:MakeButton({ Name = "Omega X", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-OmegaX-34596"))() end })
end)

-- ========== CONFIG ==========
local Config = Win:MakeTab({ Name = "Config", Icon = "rbxassetid://98211971158539" })

Config:MakeSection("Tamanho da Janela")

Config:MakeSlider({
    Name = "Tamanho", Min = 300, Max = 900, Default = saveData.size or 520, Suffix = " px",
    Callback = function(value)
        Win:SetSize(value)
        saveData.size = value
        SaveData()
        Win:Notify({ Title = "Config", Content = "Tamanho: " .. value, Duration = 2, Type = "Info" })
    end,
})

Config:MakeButton({
    Name = "Resetar Tamanho",
    Callback = function()
        Win:SetSize(520)
        saveData.size = 520
        SaveData()
        Win:Notify({ Title = "Config", Content = "Tamanho resetado!", Duration = 3, Type = "Info" })
    end,
})

Config:MakeSection("Opacidade da Janela")

Config:MakeDropdown({
    Name = "Opacidade",
    Options = { "0", "0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1" },
    Default = tostring(saveData.opacity or 0.1),
    Callback = function(value)
        local num = tonumber(value)
        Win:SetOpacity(num)
        saveData.opacity = num
        SaveData()
        Win:Notify({ Title = "Config", Content = "Opacidade: " .. value, Duration = 2, Type = "Info" })
    end,
})

Config:MakeButton({
    Name = "Resetar Opacidade",
    Callback = function()
        Win:SetOpacity(0.1)
        saveData.opacity = 0.1
        SaveData()
        Win:Notify({ Title = "Config", Content = "Opacidade resetada!", Duration = 3, Type = "Info" })
    end,
})

Config:MakeSection("Info Adicional")
Config:MakeLabel("O Hub é Universal mas dependendo do jogo terá funções novas e tabs novas em cada jogo tipo Brookhaven e outros é só selecionar no dropdown acima o jogo que deseja")
Config:MakeSection("!ZONA DE RISCO!") 

Config:MakeButton({
    Name = "Resetar Tudo",
    Callback = function()
        saveData = DefaultSave()
        SaveData()
        Win:Notify({ Title = "Config", Content = "Tudo resetado!", Duration = 3 })
    end
})