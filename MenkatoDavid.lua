-- SERVIÇOS
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- SCREEN GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NeonIntro"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- FUNDO ESCURO
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(5, 0, 10)
background.BackgroundTransparency = 1
background.Parent = gui

-- GRADIENTE NEON ROXO (VINDO DE BAIXO)
local gradientFrame = Instance.new("Frame")
gradientFrame.Size = UDim2.new(1, 0, 0.45, 0)
gradientFrame.Position = UDim2.new(0, 0, 0.55, 0)
gradientFrame.BackgroundTransparency = 1
gradientFrame.Parent = background

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90, 0, 160)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
})
uiGradient.Rotation = 90
uiGradient.Parent = gradientFrame

-- TEXTO NEON
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 0.25, 0)
text.Position = UDim2.new(0, 0, 0.38, 0)
text.BackgroundTransparency = 1
text.Text = "By Davidgames3d e Menkato"
text.TextColor3 = Color3.fromRGB(230, 180, 255)
text.TextTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamBlack
text.Parent = background

-- EFEITO GLOW
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(180, 0, 255)
stroke.Thickness = 2
stroke.Transparency = 1
stroke.Parent = text

-- TWEENS
local fadeInBG = TweenService:Create(
	background,
	TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{BackgroundTransparency = 0}
)

local fadeInGradient = TweenService:Create(
	gradientFrame,
	TweenInfo.new(1),
	{BackgroundTransparency = 0}
)

local fadeInText = TweenService:Create(
	text,
	TweenInfo.new(1),
	{TextTransparency = 0}
)

local glowIn = TweenService:Create(
	stroke,
	TweenInfo.new(1),
	{Transparency = 0}
)

local fadeOutBG = TweenService:Create(
	background,
	TweenInfo.new(1),
	{BackgroundTransparency = 1}
)

local fadeOutGradient = TweenService:Create(
	gradientFrame,
	TweenInfo.new(1),
	{BackgroundTransparency = 1}
)

local fadeOutText = TweenService:Create(
	text,
	TweenInfo.new(1),
	{TextTransparency = 1}
)

local glowOut = TweenService:Create(
	stroke,
	TweenInfo.new(1),
	{Transparency = 1}
)

-- EXECUÇÃO
task.wait(0.5)
fadeInBG:Play()
fadeInGradient:Play()
fadeInText:Play()
glowIn:Play()

task.wait(2.8)

fadeOutText:Play()
glowOut:Play()
fadeOutGradient:Play()
fadeOutBG:Play()

task.wait(1.2)
gui:Destroy()