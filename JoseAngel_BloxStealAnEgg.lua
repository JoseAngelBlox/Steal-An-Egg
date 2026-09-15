-- ==========================================
--  JoseAngel_Blox Steal An Egg Script v1.3
--  Sin Godmode | Burbuja Flotante + Auto Place/Sell + Speed
-- ==========================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Eliminar ejecuciones previas
if CoreGui:FindFirstChild("JoseAngel_StealAnEgg") then
    CoreGui.JoseAngel_StealAnEgg:Destroy()
end

-- ScreenGui Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JoseAngel_StealAnEgg"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local isKeyVerified = false

-- Función para animar texto azul
local function AnimarTextoAzul(textLabel)
    task.spawn(function()
        local t = 0
        while textLabel and textLabel.Parent do
            t = t + 0.05
            local blueShade = math.sin(t) * 0.3 + 0.7
            textLabel.TextColor3 = Color3.fromRGB(0, math.floor(150 * blueShade), 255)
            task.wait(0.03)
        end
    end)
end

-- ==========================================
--  BURBUJA FLOTANTE (Para Minimizar/Ocultar Gui)
-- ==========================================
local ToggleBubble = Instance.new("TextButton")
ToggleBubble.Name = "ToggleBubble"
ToggleBubble.Size = UDim2.new(0, 50, 0, 50)
ToggleBubble.Position = UDim2.new(0.02, 0, 0.3, 0)
ToggleBubble.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
ToggleBubble.Text = "JA"
ToggleBubble.TextColor3 = Color3.fromRGB(0, 170, 255)
ToggleBubble.Font = Enum.Font.SourceSansBold
ToggleBubble.TextSize = 20
ToggleBubble.Active = true
ToggleBubble.Draggable = true
ToggleBubble.Parent = ScreenGui

local BubbleCorner = Instance.new("UICorner")
BubbleCorner.CornerRadius = UDim.new(1, 0)
BubbleCorner.Parent = ToggleBubble

local BubbleStroke = Instance.new("UIStroke")
BubbleStroke.Color = Color3.fromRGB(0, 120, 215)
BubbleStroke.Thickness = 2
BubbleStroke.Parent = ToggleBubble

local KeyFrame
local MainFrame

ToggleBubble.MouseButton1Click:Connect(function()
    if not isKeyVerified then
        if KeyFrame then
            KeyFrame.Visible = not KeyFrame.Visible
        end
    else
        if MainFrame then
            MainFrame.Visible = not MainFrame.Visible
        end
    end
end)

-- ==========================================
--  SISTEMA DE KEY
-- ==========================================
KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 360, 0, 270)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -135)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 14)
KeyCorner.Parent = KeyFrame

-- Título Key
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Position = UDim2.new(0, 0, 0, 15)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "JoseAngel_Blox Steal An Egg"
KeyTitle.TextSize = 18
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame
AnimarTextoAzul(KeyTitle)

-- Subtítulo Key
local KeySubTitle = Instance.new("TextLabel")
KeySubTitle.Size = UDim2.new(1, 0, 0, 20)
KeySubTitle.Position = UDim2.new(0, 0, 0, 48)
KeySubTitle.BackgroundTransparency = 1
KeySubTitle.Text = "Creado por JoseAngel_Blox"
KeySubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeySubTitle.TextTransparency = 0.5
KeySubTitle.TextSize = 13
KeySubTitle.Font = Enum.Font.SourceSansItalic
KeySubTitle.Parent = KeyFrame

-- Campo de entrada Key
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
KeyInput.PlaceholderText = "Ingresa la Key..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 15
KeyInput.Font = Enum.Font.SourceSans
KeyInput.Parent = KeyFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = KeyInput

-- Botón de verificación
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 38)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.6, 10)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
VerifyBtn.Text = "Verificar Key"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 15
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.Parent = KeyFrame

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 8)
VerifyCorner.Parent = VerifyBtn

-- Estado de la Key
local KeyStatus = Instance.new("TextLabel")
KeyStatus.Size = UDim2.new(1, 0, 0, 25)
KeyStatus.Position = UDim2.new(0, 0, 0.82, 0)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = ""
KeyStatus.TextSize = 14
KeyStatus.Font = Enum.Font.SourceSans
KeyStatus.Parent = KeyFrame

-- ==========================================
--  MENÚ PRINCIPAL
-- ==========================================
MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 390)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -195)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

-- Encabezado del Menú
local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Size = UDim2.new(1, -20, 0, 25)
HeaderTitle.Position = UDim2.new(0, 15, 0, 10)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "JoseAngel_Blox Steal An Egg"
HeaderTitle.TextSize = 18
HeaderTitle.Font = Enum.Font.SourceSansBold
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = MainFrame
AnimarTextoAzul(HeaderTitle)

local HeaderSub = Instance.new("TextLabel")
HeaderSub.Size = UDim2.new(1, -20, 0, 18)
HeaderSub.Position = UDim2.new(0, 15, 0, 32)
HeaderSub.BackgroundTransparency = 1
HeaderSub.Text = "Creado por JoseAngel_Blox"
HeaderSub.TextColor3 = Color3.fromRGB(255, 255, 255)
HeaderSub.TextTransparency = 0.5
HeaderSub.TextSize = 12
HeaderSub.Font = Enum.Font.SourceSansItalic
HeaderSub.TextXAlignment = Enum.TextXAlignment.Left
HeaderSub.Parent = MainFrame

-- Panel Izquierdo
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 150, 0, 320)
LeftPanel.Position = UDim2.new(0, 10, 0, 58)
LeftPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
LeftPanel.Parent = MainFrame

local LeftCorner = Instance.new("UICorner")
LeftCorner.CornerRadius = UDim.new(0, 10)
LeftCorner.Parent = LeftPanel

-- Perfil de Usuario
local UserBox = Instance.new("Frame")
UserBox.Size = UDim2.new(1, -10, 0, 50)
UserBox.Position = UDim2.new(0, 5, 1, -55)
UserBox.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
UserBox.Parent = LeftPanel

local UserBoxCorner = Instance.new("UICorner")
UserBoxCorner.CornerRadius = UDim.new(0, 8)
UserBoxCorner.Parent = UserBox

local UserAvatar = Instance.new("ImageLabel")
UserAvatar.Size = UDim2.new(0, 40, 0, 40)
UserAvatar.Position = UDim2.new(0, 5, 0.5, -20)
UserAvatar.BackgroundTransparency = 1
UserAvatar.Parent = UserBox

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = UserAvatar

pcall(function()
    UserAvatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
end)

local UserNameLabel = Instance.new("TextLabel")
UserNameLabel.Size = UDim2.new(1, -52, 1, 0)
UserNameLabel.Position = UDim2.new(0, 48, 0, 0)
UserNameLabel.BackgroundTransparency = 1
UserNameLabel.Text = LocalPlayer.Name
UserNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UserNameLabel.TextSize = 12
UserNameLabel.Font = Enum.Font.SourceSansBold
UserNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
UserNameLabel.TextXAlignment = Enum.TextXAlignment.Left
UserNameLabel.Parent = UserBox

-- Contenedor Derecho
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 340, 0, 320)
RightPanel.Position = UDim2.new(0, 170, 0, 58)
RightPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
RightPanel.Parent = MainFrame

local RightCorner = Instance.new("UICorner")
RightCorner.CornerRadius = UDim.new(0, 10)
RightCorner.Parent = RightPanel

-- Gestión de Pestañas
local TabFrames = {}
local TabButtons = {}

local function CrearPestana(nombre, posOffset)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(0.9, 0, 0, 35)
    TabBtn.Position = UDim2.new(0.05, 0, 0, posOffset)
    TabBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
    TabBtn.Text = nombre
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.SourceSansSemibold
    TabBtn.TextSize = 14
    TabBtn.Parent = LeftPanel

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = TabBtn

    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Size = UDim2.new(1, -16, 1, -16)
    TabContent.Position = UDim2.new(0, 8, 0, 8)
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 4
    TabContent.Visible = false
    TabContent.Parent = RightPanel

    local UIList = Instance.new("UIListLayout")
    UIList.SortOrder = Enum.SortOrder.LayoutOrder
    UIList.Padding = UDim.new(0, 8)
    UIList.Parent = TabContent

    TabButtons[nombre] = TabBtn
    TabFrames[nombre] = TabContent

    TabBtn.MouseButton1Click:Connect(function()
        for _, frame in pairs(TabFrames) do frame.Visible = false end
        for _, btn in pairs(TabButtons) do 
            btn.BackgroundColor3 = Color3.fromRGB(32, 32, 44)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        TabContent.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    return TabContent
end

local InfoTab = CrearPestana("Info", 10)
local MainTab = CrearPestana("Main", 50)
local UtilTab = CrearPestana("Utilidad", 90)

TabFrames["Info"].Visible = true
TabButtons["Info"].BackgroundColor3 = Color3.fromRGB(0, 120, 215)

-- ==========================================
--  CONTENIDO DE LAS PESTAÑAS
-- ==========================================

-- 1) INFO
local function AgregarLabelInfo(titulo, valor)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 28)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    Frame.Parent = InfoTab
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Text = Instance.new("TextLabel")
    Text.Size = UDim2.new(1, -10, 1, 0)
    Text.Position = UDim2.new(0, 5, 0, 0)
    Text.BackgroundTransparency = 1
    Text.Text = titulo .. ": " .. valor
    Text.TextColor3 = Color3.fromRGB(220, 220, 240)
    Text.TextSize = 13
    Text.Font = Enum.Font.SourceSans
    Text.TextXAlignment = Enum.TextXAlignment.Left
    Text.Parent = Frame
end

AgregarLabelInfo("Nombre del creador", "JoseAngel_Blox")
AgregarLabelInfo("Fecha de creación", "16/09/2026")
AgregarLabelInfo("Versión", "1.3")

local UpdateFrame = Instance.new("Frame")
UpdateFrame.Size = UDim2.new(1, 0, 0, 110)
UpdateFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
UpdateFrame.Parent = InfoTab

local UpCorner = Instance.new("UICorner")
UpCorner.CornerRadius = UDim.new(0, 6)
UpCorner.Parent = UpdateFrame

local UpdateText = Instance.new("TextLabel")
UpdateText.Size = UDim2.new(1, -16, 1, -16)
UpdateText.Position = UDim2.new(0, 8, 0, 8)
UpdateText.BackgroundTransparency = 1
UpdateText.Text = "Update v1.3: Godmode eliminado. Conserva la burbuja flotante para ocultar/mostrar menú, Auto Place, Auto Sell y Velocidad ajustable."
UpdateText.TextColor3 = Color3.fromRGB(200, 200, 220)
UpdateText.TextSize = 13
UpdateText.Font = Enum.Font.SourceSans
UpdateText.TextWrapped = true
UpdateText.TextXAlignment = Enum.TextXAlignment.Left
UpdateText.TextYAlignment = Enum.TextYAlignment.Top
UpdateText.Parent = UpdateFrame

-- 2) MAIN
local function CrearToggleFuncional(nombre, desc, variableGlobal)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    Frame.Parent = MainTab

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0.7, 0, 0, 22)
    TitleLabel.Position = UDim2.new(0, 8, 0, 4)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = nombre
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Frame

    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(0.7, 0, 0, 20)
    DescLabel.Position = UDim2.new(0, 8, 0, 24)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(160, 160, 180)
    DescLabel.Font = Enum.Font.SourceSans
    DescLabel.TextSize = 11
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = Frame

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0.24, 0, 0, 30)
    Btn.Position = UDim2.new(0.73, 0, 0.5, -15)
    Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 12
    Btn.Parent = Frame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn

    local estado = false
    Btn.MouseButton1Click:Connect(function()
        estado = not estado
        _G[variableGlobal] = estado
        if estado then
            Btn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
            Btn.Text = "ON"
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            Btn.Text = "OFF"
            Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end

CrearToggleFuncional("Auto Place Eggs", "Va corriendo a StartArea", "isAutoPlacing")
CrearToggleFuncional("Auto Sell Mascotas", "Teletransporta a SellAll", "isAutoSelling")

-- 3) UTILIDAD
local SpeedState = false

local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(1, 0, 0, 55)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
SpeedFrame.Parent = UtilTab

local SpCorner = Instance.new("UICorner")
SpCorner.CornerRadius = UDim.new(0, 6)
SpCorner.Parent = SpeedFrame

local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Size = UDim2.new(1, -10, 0, 20)
SpeedTitle.Position = UDim2.new(0, 8, 0, 4)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "Velocidad de Movimiento"
SpeedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedTitle.Font = Enum.Font.SourceSansBold
SpeedTitle.TextSize = 14
SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
SpeedTitle.Parent = SpeedFrame

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0.95, 0, 0, 24)
SpeedBtn.Position = UDim2.new(0.025, 0, 0, 26)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
SpeedBtn.Text = "Activar Velocidad Rápida (50 WalkSpeed)"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Font = Enum.Font.SourceSans
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SpeedFrame

local SpBtnCorner = Instance.new("UICorner")
SpBtnCorner.CornerRadius = UDim.new(0, 4)
SpBtnCorner.Parent = SpeedBtn

SpeedBtn.MouseButton1Click:Connect(function()
    SpeedState = not SpeedState
    if SpeedState then
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
    else
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- ==========================================
--  LÓGICA DE KEY
-- ==========================================
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "JoseAngelBlox" then
        KeyStatus.TextColor3 = Color3.fromRGB(0, 220, 130)
        KeyStatus.Text = "Script cargado correctamente"
        isKeyVerified = true
        task.wait(0.5)
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        KeyStatus.TextColor3 = Color3.fromRGB(255, 70, 70)
        KeyStatus.Text = "Key inválida"
    end
end)

-- ==========================================
--  LÓGICA DEL JUEGO
-- ==========================================

local deliveryZoneName = "StartArea"
local sellZoneName = "SellAll"

local function findSpecificZone(zoneName)
    for _, child in pairs(Workspace:GetDescendants()) do
        if string.find(child.Name, zoneName) then
            return child
        end
    end
    return nil
end

-- Bucle Auto Place y Auto Sell
task.spawn(function()
    while true do
        task.wait(0.5)
        
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then continue end
        local humanoid = char.Humanoid
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then continue end

        -- Auto Place
        if _G.isAutoPlacing then
            local startArea = findSpecificZone(deliveryZoneName)
            if startArea then
                local distToBase = (root.Position - startArea.Position).magnitude
                if distToBase > 5 then
                    humanoid:MoveTo(startArea.Position)
                end
            end
        end

        -- Auto Sell
        if _G.isAutoSelling then
            local sellZone = findSpecificZone(sellZoneName)
            if sellZone then
                local distToSell = (root.Position - sellZone.Position).magnitude
                if distToSell > 10 then
                    root.CFrame = sellZone.CFrame + Vector3.new(0, 5, 0)
                    task.wait(1)
                else
                    task.wait(3)
                end
            end
        end
    end
end)

-- Bucle físico (WalkSpeed)
RunService.Stepped:Connect(function()
    if SpeedState and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
end)

print(">>> Script JoseAngel_Blox v1.3 Cargado Correctamente.")
