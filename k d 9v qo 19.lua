local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/Lazarios-ui-library/main/CoreLib.lua"))()

local Win = NexusUI:MakeWindow({
    Title = "David Hub",
    SubTitle = "v1.0 by davidgames3d", 
    Theme = "Neon",
    RGBBorder = true,
    LogoId    = "rbxassetid://132152602986684", 
}) 

Win:SetSize(600) 
Win:SetOpacity(0.4)

-- tabs
local Home = Win:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://123456",
})

local Local = Win:MakeTab({
    Name = "Player",
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

Home:MakeLabel("David Hub V1.0

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
		print("Nome:", text)
	end,
})

Home:MakeInput({
	Name = "Discord do criador",
	Placeholder = "https://discord.gg/nMGZGk5Tj",
	Callback = function(text, enter)
		print("Nome:", text)
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

-- Section Configuração
Config:MakeSection("Configurações") 