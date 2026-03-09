local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/Lazarios-ui-library/main/CoreLib.lua"))()

-- Serviços necessários
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local noclipConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- criação da Window
local Win = NexusUI:MakeWindow({
    Title = "David Hub",
    SubTitle = "v1.0 | by davidgames3d", 
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

local Info = Win:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://123456",
})

local Config = Win:MakeTab({
    Name = "Config",
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

Home:MakeLabel("David Hub V1.0") 

Home:MakeLabel("Lazarus/Lazarios UI Lib V1.0.0 Beta") 

Home:MakeSection("Créditos") 

Home:MakeImage({
    Image  = "rbxassetid://5597737428",
    Height = 90,
    Desc   = "Youtube",
})

Home:MakeInput({
	Name = "Youtube do criador",
	Placeholder = "https://youtube.com/@davidgames3d?si=sIBVlOB3inq3sCHb",
	Callback = function(text, enter)
		setclipboard("https://youtube.com/@davidgames3d?si=sIBVlOB3inq3sCHb")
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

-- Section Info
Info:MakeSection("Version") 

Info:MakeLabel("Lazarus UI Lib v1.0.0 beta")

Info:MakeLabel("David Hub V1.0") 

Info:MakeSection("curiosidades e fatos") 

Info:MakeLabel("Esse script usa uma Lib chamada Lazarus UI Lib ou lazarios feita por mim") 

Info:MakeLabel("Eu faço scripts só pelo celular sei programar pouco mas tô aprendendo") 

Info:MakeLabel("Eu fiz o site da key com o mimo gratuitamente sem saber scriptar css, js nem html") 

-- Section LocalPlayer
Local:MakeSection("scripts") 

Local:MakeButton({
	Name = "Lazarus hub universal Script",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/sJjppszH/raw"))()
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
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/UiLibExample/main/FGS.lua"))() 
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

end

-- Section Configuração
Config:MakeSection("Configurações do hub") 

Config:MakeSlider({
	Name = "Size",
	Min = 9,
	Max = 600,
	Default = 520,
	Suffix = "Tmn",
	Callback = function(value)
		Win:SetSize(value) 
	end,
})
