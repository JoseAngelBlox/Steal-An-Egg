-- ═══════════════════════════════════════════════
--         JoseAngel_Blox Steal An Egg  v1.1
--         Creado por: JoseAngel_Blox
--         Fecha: 15/09/2026
-- ═══════════════════════════════════════════════

-- ██ KEY SISTEMA ██
local Key = "JoseAngelBlox"
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ██ VENTANA DE VERIFICACIÓN DE KEY ██
local KeyScreen = Instance.new("ScreenGui")
KeyScreen.Name = "KeyScreen"
KeyScreen.Parent = PlayerGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromScale(0.35, 0.45)
KeyFrame.Position = UDim2.fromScale(0.325, 0.275)
KeyFrame.BackgroundColor3 = Color3.fromHex("#1a1a2e")
KeyFrame.BorderSizePixel = 0
KeyFrame.CornerRadius = UDim.new(0.04, 0)
KeyFrame.Parent = KeyScreen

local TitleKey = Instance.new("TextLabel")
TitleKey.Size = UDim2.fromScale(1, 0.25)
TitleKey.Position = UDim2.fromScale(0, 0)
TitleKey.BackgroundTransparency = 1
TitleKey.Text = "JoseAngel_Blox Steal An Egg"
TitleKey.Font = Enum.Font.GothamBlack
TitleKey.TextColor3 = Color3.fromRGB(0, 140, 255)
TitleKey.TextScaled = true
TitleKey.Parent = KeyFrame

-- ANIMACIÓN DE TEXTO AZUL MOVIÉNDOSE
spawn(function()
    while task.wait(0.05) do
        TitleKey.TextColor3 = Color3.fromRGB(
            0,
            100 + math.abs(math.sin(os.clock() * 2)) * 155,
            200 + math.abs(math.cos(os.clock() * 2)) * 55
        )
    end
end)

local SubTitleKey = Instance.new("TextLabel")
SubTitleKey.Size = UDim2.fromScale(1, 0.1)
SubTitleKey.Position = UDim2.fromScale(0, 0.22)
SubTitleKey.BackgroundTransparency = 1
SubTitleKey.Text = "Creado por JoseAngel_Blox"
SubTitleKey.Font = Enum.Font.Gotham
SubTitleKey.TextColor3 = Color3.fromRGB(255, 255, 255)
SubTitleKey.TextTransparency = 0.5
SubTitleKey.TextScaled = true
SubTitleKey.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.fromScale(0.8, 0.15)
KeyBox.Position = UDim2.fromScale(0.1, 0.45)
KeyBox.BackgroundColor3 = Color3.fromHex("#16213e")
KeyBox.CornerRadius = UDim.new(0.025, 0)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderText = "Ingresa la Key..."
KeyBox.Text = ""
KeyBox.TextScaled = true
KeyBox.Parent = KeyFrame

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.fromScale(1, 0.1)
StatusText.Position = UDim2.fromScale(0, 0.65)
StatusText.BackgroundTransparency = 1
StatusText.Font = Enum.Font.Gotham
StatusText.TextScaled = true
StatusText.Parent = KeyFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.fromScale(0.6, 0.12)
SubmitBtn.Position = UDim2.fromScale(0.2, 0.8)
SubmitBtn.BackgroundColor3 = Color3.fromHex("#008cff")
SubmitBtn.CornerRadius = UDim.new(0.025, 0)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "Verificar"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextScaled = true
SubmitBtn.Parent = KeyFrame

local MainScreen = nil

-- ██ FUNCIÓN: CARGAR MENÚ PRINCIPAL ██
local function LoadMainMenu()
    KeyScreen:Destroy()

    MainScreen = Instance.new("ScreenGui")
    MainScreen.Name = "JoseAngel_Blox_Menu"
    MainScreen.Parent = PlayerGui

    -- CONTENEDOR PRINCIPAL — ASPECTO 4:3
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.fromScale(0.52, 0.7) -- 4:3 aspect ratio
    MainFrame.Position = UDim2.fromScale(0.02, 0.15)
    MainFrame.BackgroundColor3 = Color3.fromHex("#0f0f23")
    MainFrame.BorderSizePixel = 0
    MainFrame.CornerRadius = UDim.new(0.035, 0)
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = MainScreen

    -- TÍTULO PRINCIPAL
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.fromScale(1, 0.08)
    Title.Position = UDim2.fromScale(0, 0)
    Title.BackgroundColor3 = Color3.fromHex("#1a1a3a")
    Title.BackgroundTransparency = 0.2
    Title.Text = "JoseAngel_Blox Steal An Egg"
    Title.Font = Enum.Font.GothamBlack
    Title.TextColor3 = Color3.fromRGB(0, 140, 255)
    Title.TextScaled = true
    Title.Parent = MainFrame

    -- ANIMACIÓN AZUL MOVIENTE
    spawn(function()
        while task.wait(0.05) do
            Title.TextColor3 = Color3.fromRGB(0, 100 + math.abs(math.sin(os.clock()*2))*155, 255)
        end
    end)

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.fromScale(1, 0.04)
    SubTitle.Position = UDim2.fromScale(0, 0.08)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "Creado por JoseAngel_Blox"
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubTitle.TextTransparency = 0.6
    SubTitle.TextScaled = true
    SubTitle.Parent = MainFrame

    -- ██ PANEL IZQUIERDO — PESTAÑAS ██
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Size = UDim2.fromScale(0.25, 0.82)
    LeftPanel.Position = UDim2.fromScale(0, 0.12)
    LeftPanel.BackgroundColor3 = Color3.fromHex("#151530")
    LeftPanel.Parent = MainFrame

    local TabsContainer = Instance.new("Frame")
    TabsContainer.Size = UDim2.fromScale(1, 0.9)
    TabsContainer.Position = UDim2.fromScale(0, 0)
    TabsContainer.BackgroundTransparency = 1
    TabsContainer.Parent = LeftPanel

    -- ██ PANEL DERECHO — FUNCIONES ██
    local RightPanel = Instance.new("Frame")
    RightPanel.Size = UDim2.fromScale(0.75, 0.82)
    RightPanel.Position = UDim2.fromScale(0.25, 0.12)
    RightPanel.BackgroundColor3 = Color3.fromHex("#1c1c3a")
    RightPanel.Parent = MainFrame

    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.fromScale(1, 1)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.ScrollBarThickness = 6
    ContentFrame.Parent = RightPanel

    -- ██ PANEL INFERIOR — PERFIL DE USUARIO ██
    local ProfilePanel = Instance.new("Frame")
    ProfilePanel.Size = UDim2.fromScale(1, 0.06)
    ProfilePanel.Position = UDim2.fromScale(0, 0.94)
    ProfilePanel.BackgroundColor3 = Color3.fromHex("#121228")
    ProfilePanel.Parent = MainFrame

    local UserThumb = Instance.new("ImageLabel")
    UserThumb.Size = UDim2.fromScale(0.05, 0.8)
    UserThumb.Position = UDim2.fromScale(0.01, 0.1)
    UserThumb.BackgroundTransparency = 1
    UserThumb.CornerRadius = UDim.new(1, 0)
    UserThumb.Image = "rbxthumb://type=AvatarHeadShot&id="..Player.UserId.."&w=150&h=150"
    UserThumb.Parent = ProfilePanel

    local UserNameLabel = Instance.new("TextLabel")
    UserNameLabel.Size = UDim2.fromScale(0.7, 1)
    UserNameLabel.Position = UDim2.fromScale(0.07, 0)
    UserNameLabel.BackgroundTransparency = 1
    UserNameLabel.Text = "👤 "..Player.Name
    UserNameLabel.Font = Enum.Font.GothamBold
    UserNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UserNameLabel.TextScaled = true
    UserNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UserNameLabel.Parent = ProfilePanel

    -- ██ SISTEMA DE PESTAÑAS ██
    local Tabs = {
        {Name = "Info", Content = nil},
        {Name = "Main", Content = nil},
        {Name = "Utilidad", Content = nil}
    }
    local Pages = {}
    local ActiveTab = 1

    local function CreatePage(name)
        local Page = Instance.new("Frame")
        Page.Name = name.."Page"
        Page.Size = UDim2.fromScale(1, 1)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = ContentFrame
        return Page
    end

    -- CREAR PÁGINAS
    for i, tab in ipairs(Tabs) do
        Pages[i] = CreatePage(tab.Name)
    end

    -- ██ PÁGINA INFO ██
    do
        local Page = Pages[1]
        local InfoText = Instance.new("TextLabel")
        InfoText.Size = UDim2.fromScale(0.95, 0.95)
        InfoText.Position = UDim2.fromScale(0.025, 0.025)
        InfoText.BackgroundTransparency = 1
        InfoText.Text = [[
📌 Nombre del creador: JoseAngel_Blox
📅 Fecha de creación: 15/09/2026
🔖 Versión: 1.1

📢 Update:
Bienvenido y bienvenida a mi script!
Este script es uno de lo mas básicos para este juego.
Espero y disfrutes del script.
Atentamente, JoseAngel_Blox
        ]]
        InfoText.Font = Enum.Font.Gotham
        InfoText.TextColor3 = Color3.fromRGB(220, 220, 220)
        InfoText.TextScaled = true
        InfoText.TextXAlignment = Enum.TextXAlignment.Left
        InfoText.TextYAlignment = Enum.TextYAlignment.Top
        InfoText.Parent = Page
    end

    -- ██ PÁGINA MAIN ██
    do
        local Page = Pages[2]
        local yPos = 0.02
        local function AddToggle(name, desc)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.fromScale(0.96, 0.11)
            btn.Position = UDim2.fromScale(0.02, yPos)
            btn.BackgroundColor3 = Color3.fromHex("#2a2a50")
            btn.CornerRadius = UDim.new(0.02, 0)
            btn.Font = Enum.Font.Gotham
            btn.Text = "❌ "..name
            btn.TextColor3 = Color3.fromRGB(255, 100, 100)
            btn.TextScaled = true
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.TextPadding = UDim.new(0.03, 0)
            btn.AutoLocalize = false
            btn.Parent = Page

            local Desc = Instance.new("TextLabel")
            Desc.Size = UDim2.fromScale(0.96, 0.05)
            Desc.Position = UDim2.fromScale(0.02, yPos + 0.105)
            Desc.BackgroundTransparency = 1
            Desc.Text = desc
            Desc.Font = Enum.Font.Gotham
            Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
            Desc.TextScaled = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.TextPadding = UDim.new(0.03, 0)
            Desc.Parent = Page

            local Enabled = false
            btn.MouseButton1Click:Connect(function()
                Enabled = not Enabled
                btn.Text = (Enabled and "✅ " or "❌ ")..name
                btn.TextColor3 = Enabled and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
                btn.BackgroundColor3 = Enabled and Color3.fromHex("#1e3a5f") or Color3.fromHex("#2a2a50")
            end)

            yPos += 0.17
            return btn
        end

        AddToggle("Auto Steal Eggs", "Va automáticamente a los huevos y los roba. Automatiza todo el ciclo.")
        AddToggle("Auto Place Eggs", "Regresa a la base y coloca los huevos solito. Sin volver manualmente.")
        AddToggle("Auto Hatch", "Eclosiona todos los huevos listos automáticamente. Ahorra clics.")
        
        local PetLabel = Instance.new("TextLabel")
        PetLabel.Size = UDim2.fromScale(0.96, 0.06)
        PetLabel.Position = UDim2.fromScale(0.02, yPos)
        PetLabel.BackgroundTransparency = 1
        PetLabel.Text = "🐾 Mascota"
        PetLabel.Font = Enum.Font.GothamBold
        PetLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        PetLabel.TextScaled = true
        PetLabel.TextXAlignment = Enum.TextXAlignment.Left
        PetLabel.TextPadding = UDim.new(0.02, 0)
        PetLabel.Parent = Page
        yPos += 0.07

        AddToggle("Auto Equip Mejor Mascota", "Equipa automáticamente la que da más dinero.")
        AddToggle("Auto Sell Mascotas", "Vende duplicados o comunes, protege las raras.")
        AddToggle("Auto Reclamar Ganancias", "Recoge el dinero de tus mascotas y recompensas.")
        AddToggle("Auto Mejorar Base / Cinta", "Compra mejoras de velocidad y base al tener dinero.")
    end

    -- ██ PÁGINA UTILIDAD ██
    do
        local Page = Pages[3]
        local yPos = 0.02

        local function AddSlider(name, desc, min, max, def)
            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.fromScale(0.96, 0.18)
            Frame.Position = UDim2.fromScale(0.02, yPos)
            Frame.BackgroundColor3 = Color3.fromHex("#2a2a50")
            Frame.CornerRadius = UDim.new(0.02, 0)
            Frame.Parent = Page

            local NameLabel = Instance.new("TextLabel")
            NameLabel.Size = UDim2.fromScale(0.95, 0.25)
            NameLabel.Position = UDim2.fromScale(0.025, 0.05)
            NameLabel.BackgroundTransparency = 1
            NameLabel.Text = name..": "..def
            NameLabel.Font = Enum.Font.GothamBold
            NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            NameLabel.TextScaled = true
            NameLabel.TextXAlignment = Enum.TextXAlignment.Left
            NameLabel.Parent = Frame

            local Desc = Instance.new("TextLabel")
            Desc.Size = UDim2.fromScale(0.95, 0.18)
            Desc.Position = UDim2.fromScale(0.025, 0.3)
            Desc.BackgroundTransparency = 1
            Desc.Text = desc
            Desc.Font = Enum.Font.Gotham
            Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
            Desc.TextScaled = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.Parent = Frame

            local SliderBg = Instance.new("Frame")
            SliderBg.Size = UDim2.fromScale(0.9, 0.2)
            SliderBg.Position = UDim2.fromScale(0.05, 0.6)
            SliderBg.BackgroundColor3 = Color3.fromHex("#1a1a3a")
            SliderBg.CornerRadius = UDim.new(0.01, 0)
            SliderBg.Parent = Frame

            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.fromScale((def - min) / (max - min), 1)
            SliderFill.BackgroundColor3 = Color3.fromHex("#008cff")
            SliderFill.CornerRadius = UDim.new(0.01, 0)
            SliderFill.Parent = SliderBg

            yPos += 0.2

            -- BOTÓN ANTI-TRAMPA
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.fromScale(0.96, 0.11)
            btn.Position = UDim2.fromScale(0.02, yPos)
            btn.BackgroundColor3 = Color3.fromHex("#2a2a50")
            btn.CornerRadius = UDim.new(0.02, 0)
            btn.Font = Enum.Font.Gotham
            btn.Text = "❌ Anti-Trampa / Godmode"
            btn.TextColor3 = Color3.fromRGB(255, 100, 100)
            btn.TextScaled = true
            btn.Parent = Page

            local btnDesc = Instance.new("TextLabel")
            btnDesc.Size = UDim2.fromScale(0.96, 0.05)
            btnDesc.Position = UDim2.fromScale(0.02, yPos + 0.105)
            btnDesc.BackgroundTransparency = 1
            btnDesc.Text = "Protección contra los guardianes y trampas."
            btnDesc.Font = Enum.Font.Gotham
            btnDesc.TextColor3 = Color3.fromRGB(150, 150, 150)
            btnDesc.TextScaled = true
            btnDesc.TextXAlignment = Enum.TextXAlignment.Left
            btnDesc.Parent = Page

            local Enabled = false
            btn.MouseButton1Click:Connect(function()
                Enabled = not Enabled
                btn.Text = Enabled and "✅ Anti-Trampa / Godmode" or "❌ Anti-Trampa / Godmode"
                btn.TextColor3 = Enabled and Color3.fromRGB(100, 255, 150) or Color3.fromRGB(255, 100, 100)
            end)
        end

        AddSlider("Velocidad de Movimiento", "Ajustable, evita que te atrapen los guardianes.", 16, 120, 32)
    end

    -- ██ BOTONES DE PESTAÑAS ██
    local function BuildTabs()
        for i, tab in ipairs(Tabs) do
            local TabBtn = Instance.new("TextButton")
            TabBtn.Size = UDim2.fromScale(0.9, 0.09)
            TabBtn.Position = UDim2.fromScale(0.05, 0.02 + ((i-1)*0.1))
            TabBtn.BackgroundColor3 = i == ActiveTab and Color3.fromHex("#0066cc") or Color3.fromHex("#202040")
            TabBtn.CornerRadius = UDim.new(0.02, 0)
            TabBtn.Font = Enum.Font.GothamBold
            TabBtn.Text = tab.Name
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabBtn.TextScaled = true
            TabBtn.AutoLocalize = false
            TabBtn.Parent = TabsContainer

            TabBtn.MouseButton1Click:Connect(function()
                ActiveTab = i
                for pi, page in ipairs(Pages) do
                    page.Visible = pi == ActiveTab
                end
                for _, b in ipairs(TabsContainer:GetChildren()) do
                    if b:IsA("TextButton") then
                        b.BackgroundColor3 = b.Text == tab.Name and Color3.fromHex("#0066cc") or Color3.fromHex("#202040")
                    end
                end
            end)
        end
        Pages[ActiveTab].Visible = true
    end

    BuildTabs()
end

-- ██ VERIFICACIÓN DE KEY ██
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == Key then
        StatusText.Text = "✅ Script cargado correctamente"
        StatusText.TextColor3 = Color3.fromRGB(0, 255, 120)
        task.wait(1)
        LoadMainMenu()
    else
        StatusText.Text = "❌ Key inválida"
        StatusText.TextColor3 = Color3.fromRGB(255, 60, 60)
    end
end)
