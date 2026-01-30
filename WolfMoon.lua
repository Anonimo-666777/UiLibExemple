local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "Welcome",
	Content = "script by davidgames3d,menkato e outros",
	Image = "rbxassetid://4483345998",
	Time = 14
})

local Window = OrionLib:MakeWindow({Name = "Wolf Moon🐺🌜 HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
        Name = "HOME",
        Icon = "rbxassetid://7733960981",
        PremiumOnly = false
})

Tab:AddButton({
        Name = "CRÉDITOS",
        Callback = function()                    
          -- SERVIÇOS
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- SCREEN GUI
local gui = Instance.new("ScreenGui")
gui.Name = "IntroFade"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- FUNDO PRETO
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 1
background.Parent = gui

-- GRADIENTE VERMELHO/PRETO (VINDO DE BAIXO)
local gradientFrame = Instance.new("Frame")
gradientFrame.Size = UDim2.new(1, 0, 0.4, 0)
gradientFrame.Position = UDim2.new(0, 0, 0.6, 0)
gradientFrame.BackgroundTransparency = 1
gradientFrame.Parent = background

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
uiGradient.Rotation = 90
uiGradient.Parent = gradientFrame

-- TEXTO
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 0.2, 0)
text.Position = UDim2.new(0, 0, 0.4, 0)
text.BackgroundTransparency = 1
text.Text = "By Davidgames3d e Outros"
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.Parent = background

-- TWEENS
local fadeIn = TweenService:Create(
        background,
        TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0}
)

local gradientFadeIn = TweenService:Create(
        gradientFrame,
        TweenInfo.new(1),
        {BackgroundTransparency = 0}
)

local textFadeIn = TweenService:Create(
        text,
        TweenInfo.new(1),
        {TextTransparency = 0}
)

local fadeOut = TweenService:Create(
        background,
        TweenInfo.new(1),
        {BackgroundTransparency = 1}
)

local gradientFadeOut = TweenService:Create(
        gradientFrame,
        TweenInfo.new(1),
        {BackgroundTransparency = 1}
)

local textFadeOut = TweenService:Create(
        text,
        TweenInfo.new(1),
        {TextTransparency = 1}
)

-- EXECUÇÃO
task.wait(0.5)
fadeIn:Play()
gradientFadeIn:Play()
textFadeIn:Play()

task.wait(2.5)

textFadeOut:Play()
gradientFadeOut:Play()
fadeOut:Play()

task.wait(1.2)
gui:Destroy()
end    
})

Tab:AddButton({
        Name = "matar interface💀",
        Callback = function()
                      OrionLib:Destroy()
          end    
})

local Tab = Window:MakeTab({
        Name = "UNIVERSAL",
        Icon = "rbxassetid://92875681906793",
        PremiumOnly = false
})

Tab:AddButton({
        Name = "Dark hub 2.0",
        Callback = function()      loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/UiLibExemple/main/UiMain.lua"))()
          end    
})

Tab:AddButton({
        Name = "DESPlock Hub by plockScripts",
        Callback = function()     loadstring(game:HttpGet("https://raw.githubusercontent.com/PlockScripts/Scripts/refs/heads/main/Plock.lua", true))()
          end    
})

Tab:AddButton({
        Name = "R15 to R6 all games",
        Callback = function()     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
          end    
})

Tab:AddButton({
        Name = "Private Gui by hanif leak",
        Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-hanif-leak-40943"))()
          end    
})

Tab:AddButton({
        Name = "universal invisibility script works in every game",
        Callback = function()     loadstring(game:HttpGet("https://raw.githubusercontent.com/hackrad3-collab/Addis/refs/heads/main/Addis"))()
          end    
})

Tab:AddButton({
        Name = "Epilog universal aimbot esp",
        Callback = function()    loadstring(game:HttpGet("https://raw.githubusercontent.com/rtiarg476-blip/Kamhack1337/refs/heads/main/Kamhack301.lua"))()
          end    
})

local noclip = false

Tab:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(Value)
		noclip = Value
	end
})

game:GetService("RunService").Stepped:Connect(function()
	if noclip then
		local char = game.Players.LocalPlayer.Character
		if char then
			for _,v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end
end)

local Tab = Window:MakeTab({
	Name = "BROOKHAVEN",
	Icon = "rbxassetid://101737622279179",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "DANDY WORLD",
	Icon = "rbxassetid://127011045071255",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
        Name = "CONFIGURAÇÕES",
        Icon = "rbxassetid://18801194936",
        PremiumOnly = false
})