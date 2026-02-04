-- Defina o ID do jogo desejado aqui
local ID_DESEJADO = 4924922222 -- Substitua pelo ID real
local PlaceId = game.PlaceId

-- Verifica se o ID do jogo atual é igual ao ID desejado
if PlaceId == ID_DESEJADO then
    print("ID do jogo verificado. Executando script...")
    
    -- Carregar SP Library
local splib = loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/splibv2"))()

-- =========================
-- CONFIGURAÇÕES MOON THEME
-- =========================
local MoonColors = {
    Primary = Color3.fromRGB(118, 24, 191),     -- Roxo lunar principal
    Secondary = Color3.fromRGB(77, 12, 150),    -- Roxo escuro
    Accent = Color3.fromRGB(188, 121, 255),     -- Lilás claro
    Text = Color3.fromRGB(255, 255, 255),       -- Branco
    Background = Color3.fromRGB(20, 10, 40),    -- Fundo roxo escuro
    Button = Color3.fromRGB(140, 50, 220),      -- Botões roxos
    Hover = Color3.fromRGB(160, 70, 240),       -- Hover roxo claro
    Success = Color3.fromRGB(100, 255, 100),    -- Verde
    Warning = Color3.fromRGB(255, 200, 0),      -- Amarelo
    Error = Color3.fromRGB(255, 50, 50),        -- Vermelho
    Glass = Color3.fromRGB(118, 24, 191, 0.3)   -- Vidro roxo
}

-- =========================
-- CRIAR JANELA COM MOON THEME
-- =========================
local Window = splib:MakeWindow({
    Name = "Wolf Moon HUB | brookhaven RP",
    SubTitle = "by davidgames3d, menkato e outros",
    HidePremium = false,
    SaveConfig = true,
    Toggle = true,
    Setting = true,
    Theme = "Custom",  -- Usaremos tema customizado
    RainbowMainFrame = false,
    RainbowTitle = false,
    RainbowSubTitle = false,
    ToggleIcon = "rbxassetid://113634266246783",
    CloseCallback = false,
    
    -- Configurações customizadas do tema Moon
    MainFrameColor = MoonColors.Background,
    TitleColor = MoonColors.Primary,
    SubTitleColor = MoonColors.Accent,
    TextColor = MoonColors.Text,
    ButtonColor = MoonColors.Button,
    ButtonHoverColor = MoonColors.Hover,
    ToggleColor = MoonColors.Primary,
    SliderColor = MoonColors.Primary,
    DropdownColor = MoonColors.Primary,
    TextboxColor = MoonColors.Primary,
    ColorpickerColor = MoonColors.Primary,
    LabelColor = MoonColors.Text,
    SectionColor = MoonColors.Secondary,
    ImageLabelColor = MoonColors.Primary
})

-- =========================
-- DIALOG INICIAL
-- =========================
Window:Dialog({
    Title = "Bem vindo ao Wolf Moon Hub! ",
    Text = "A maior comunidade de scripts Lua para Roblox. Descubra scripts incríveis!",
    Options = {
        {
            " Iniciar",
            function()
                print("Wolf Moon Hub iniciado!")
                splib:MakeNotification({
                    Name = "Wolf Moon Hub",
                    Content = "Bem-vindo à comunidade lunar! ",
                    Image = "rbxassetid://6026568198",
                    Time = 5
                })
            end
        },
        {
            " Sair",
            function()
                print("Usuário saiu")
            end
        }
    }
})

-- =========================
-- TAB HOME
-- =========================
local HomeTab = Window:MakeTab({
    IsMobile = false,
    Name = "HOME",
    Icon = "home"
})

HomeTab:AddSection(" Wolf Moon Hub")

HomeTab:AddParagraph("PEDIDOS", "Fale com davidgames3d ou menkato para suas idéias no Discord, WhatsApp ou pelos comentários do YouTube")

HomeTab:AddParagraph("VERSÃO:", "0.0.6 beta")

HomeTab:AddParagraph("UPDATES NOTES", "Novas tabs, botões e opções de hubs e jogos e novos créditos e informações e scripts novos")

local HubsTab = Window:MakeTab({
    IsMobile = false,
    Name = "Hubs e scripts",
    Icon = "home"
})

HubsTab:AddSection("HUBS")

HubsTab:AddButton({
    Name = "Cartola Hub",
    Desc = "Davi999z e outros",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    end
})

HubsTab:AddButton({
    Name = "Shadow Hub/Drip cliente Hub",
    Desc = "Shadow ou drip cliente Hub poderoso",
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Shadow-Hub-27866"))()
    end
})

HubsTab:AddButton({
    Name = "Sander X Hub",
    Desc = "Sander X Hub V3",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/sXPiterXs1111/Sanderxv3.30/main/sanderx3.30')))()
    end
})

HubsTab:AddButton({
    Name = "Original Antares Hub",
    Desc = "voltemo em outubro de 2024 VAMOOO",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/refs/heads/main/AntaresHubWorking.lua"))()
    end
})

HubsTab:AddButton({
    Name = "Project: Yoda",
    Desc = "Troll Features, Get Cars, Player Features",
    Callback = function()
    game:HttpGet('https://rbxscript.do.am/loader/main.html')
    end
})

HubsTab:AddButton({
    Name = "Dragon Hub V3.0",
    Desc = "Player Features, Esp, Teleports",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/abramsonhan/RScritps/refs/heads/main/rbxscript"))()	
    end
})

HubsTab:AddButton({
    Name = "Stelarium Hub",
    Desc = "WalkSpeed, JumpPower, Config Tools",
    Callback = function()
    loadstring(game:HttpGet("https://is.gd/Sudkwhdnsjwjdjdjkwjed"))()
    end
})
    
else
    -- Opcional: print("Script não rodou: ID de jogo incompatível.")
end
