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
text.Text = "By Davidgames3d"
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