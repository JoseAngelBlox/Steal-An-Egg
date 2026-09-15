-- ==========================================
--  JOSEANGEL_BLOX STEAL AN EGG SCRIPT v1.4 (FINAL)
--  Nombres confirmados: Eggs, Hitbox, StartArea, SellAll
-- ==========================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Limpiar UI anterior si existe
if CoreGui:FindFirstChild("JoseAngel_StealAnEgg") then
    CoreGui.JoseAngel_StealAnEgg:Destroy()
end

-- ScreenGui Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JoseAngel_StealAnEgg"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Función visual (Texto Azul)
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
--  CREACIÓN DE LA INTERFAZ (UI)
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 360, 0, 270)
KeyFrame.Position = UDim2.new(0.5, -180, 0.5, -135)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 14)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 35)
KeyTitle.Position = UDim2.new(0, 0, 0, 15)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "JoseAngel_Blox Steal An Egg"
KeyTitle.TextSize = 18
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame
AnimarTextoAzul(KeyTitle)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
KeyInput.PlaceholderText = "Ingresa la Key..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 38)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.6, 10)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
VerifyBtn.Text = "Verificar Key"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.Parent = KeyFrame
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 8)

local KeyStatus = Instance.new("TextLabel")
KeyStatus.Size = UDim2.new(1, 0, 0, 25)
KeyStatus.Position = UDim2.new(0, 0, 0.82, 0)
KeyStatus.BackgroundTransparency = 1
KeyStatus.Text = ""
KeyStatus.TextSize = 14
KeyStatus.Font = Enum.Font.SourceSans
KeyStatus.Parent = KeyFrame

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 390)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -195)
MainFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

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

local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 150, 0, 320)
LeftPanel.Position = UDim2.new(0, 10, 0, 58)
LeftPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
LeftPanel.Parent = MainFrame
Instance.new("UICorner", LeftPanel).CornerRadius = UDim.new(0, 10)

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 340, 0, 320)
RightPanel.Position = UDim2.new(0, 170, 0, 58)
RightPanel.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
RightPanel.Parent = MainFrame
Instance.new("UICorner", RightPanel).CornerRadius = UDim.new(0, 10)

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
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 8)

    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Size = UDim2.new(1, -16, 1, -16)
    TabContent.Position = UDim2.new(0, 8, 0, 8)
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 4
    TabContent.Visible = false
    TabContent.Parent = RightPanel
    Instance.new("UIListLayout", TabContent).Padding = UDim.new(0, 8)

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

local function CrearToggle(nombre, desc, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    Frame.Parent = MainTab
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 6)

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
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

    local estado = false
    Btn.MouseButton1Click:Connect(function()
        estado = not estado
        if estado then
            Btn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
            Btn.Text = "ON"
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            Btn.Text = "OFF"
            Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        if callback then callback(estado) end
    end)
end

CrearToggle("Auto Collect Eggs", "Va a huevos (Eggs/Hitbox)", function(state) end)
CrearToggle("Auto Place Eggs", "Va corriendo a StartArea", function(state) end)
CrearToggle("Auto Hatch", "Usa ProximityPrompt Eclosión", function(state) end)
CrearToggle("Auto Sell Mascotas", "Teletransporta a SellAll", function(state) end)

-- Utilidades
local SpeedState = false
local GodState = false

local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(1, 0, 0, 55)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
SpeedFrame.Parent = UtilTab
Instance.new("UICorner", SpeedFrame).CornerRadius = UDim.new(0, 6)

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0.95, 0, 0, 24)
SpeedBtn.Position = UDim2.new(0.025, 0, 0, 26)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
SpeedBtn.Text = "Activar Velocidad Rápida (50 WalkSpeed)"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Font = Enum.Font.SourceSans
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SpeedFrame
Instance.new("UICorner", SpeedBtn).CornerRadius = UDim.new(0, 4)

SpeedBtn.MouseButton1Click:Connect(function()
    SpeedState = not SpeedState
    SpeedBtn.BackgroundColor3 = SpeedState and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(45, 45, 60)
end)

-- Lógica Key
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "JoseAngelBlox" then
        KeyStatus.TextColor3 = Color3.fromRGB(0, 220, 130)
        KeyStatus.Text = "Script cargado correctamente"
        task.wait(0.5)
        KeyFrame.Visible = false
        MainFrame.Visible = true
    else
        KeyStatus.TextColor3 = Color3.fromRGB(255, 70, 70)
        KeyStatus.Text = "Key inválida"
    end
end)

-- ==========================================
--  LÓGICA DEL JUEGO (CEREBRO ACTUALIZADO)
-- ==========================================

-- CONFIGURACIÓN DE NOMBRES CONFIRMADOS
local eggKeywords = {"Eggs", "Hitbox"}
local deliveryZoneName = "StartArea"      -- <--- ZONA DE ENTREGA CONFIRMADA
local sellZoneName = "SellAll"            -- <--- ZONA DE VENTA CONFIRMADA
local hatchPromptKeyword = "Eclosión"     -- <--- TEXTO DEL PROMPT

-- Variables de Estado
local isAutoCollecting = false
local isAutoPlacing = false
local isAutoHatching = false
local isAutoSelling = false

-- Funciones de Búsqueda
local function findNearestByList(keywordsList)
    local nearest = nil
    local minDist = math.huge
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPos = char.HumanoidRootPart.Position

    for _, child in pairs(Workspace:GetDescendants()) do
        if child:IsA("BasePart") then
            for _, keyword in pairs(keywordsList) do
                if string.find(child.Name, keyword) and child.CanCollide then
                    local dist = (child.Position - rootPos).magnitude
                    if dist < minDist and dist < 300 then
                        minDist = dist
                        nearest = child
                        break
                    end
                end
            end
        end
    end
    return nearest, minDist
end

local function findSpecificZone(zoneName)
    for _, child in pairs(Workspace:GetDescendants()) do
        if string.find(child.Name, zoneName) then
            return child
        end
    end
    return nil
end

local function findHatchPrompt()
    for _, child in pairs(Workspace:GetDescendants()) do
        if child:IsA("ProximityPrompt") then
            if child.HoldToInteract == false and string.find(child.ObjectText, hatchPromptKeyword) then
                return child
            end
            if child.Parent and string.find(child.Parent.Name, hatchPromptKeyword) then
                return child
            end
        end
    end
    return nil
end

-- Bucle Principal
task.spawn(function()
    while true do
        task.wait(0.5)
        
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then continue end
        local humanoid = char.Humanoid
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then continue end

        -- 1. AUTO COLLECT (Huevos)
        if isAutoCollecting then
            local egg, dist = findNearestByList(eggKeywords)
            if egg and dist > 4 then
                humanoid:MoveTo(egg.Position)
            end
        end

        -- 2. AUTO PLACE (Entrega en StartArea)
        if isAutoPlacing then
            local startArea = findSpecificZone(deliveryZoneName)
            if startArea then
                local distToBase = (root.Position - startArea.Position).magnitude
                if distToBase > 5 then
                    -- IR CORRIENDO A STARTAREA
                    humanoid:MoveTo(startArea.Position)
                else
                    -- Ya estamos en la zona de entrega
                    -- El juego debería detectar la entrega automáticamente al estar dentro
                end
            else
                -- Si no encuentra StartArea, intenta buscar algo similar por seguridad
                local fallback = findNearestByList({"Base", "Drop"})
                if fallback then humanoid:MoveTo(fallback.Position) end
            end
        end

        -- 3. AUTO HATCH (ProximityPrompt)
        if isAutoHatching then
            local prompt = findHatchPrompt()
            if prompt then
                local promptPos = prompt.Parent and prompt.Parent:IsA("BasePart") and prompt.Parent.Position or prompt.CFrame.Position
                local dist = (root.Position - promptPos).magnitude
                
                if dist > 6 then
                    humanoid:MoveTo(promptPos)
                else
                    prompt:FirePromptButtonPressed(LocalPlayer)
                    task.wait(1.5)
                end
            end
        end

        -- 4. AUTO SELL (Teletransporte a SellAll)
        if isAutoSelling then
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

-- Conexión de Botones
local function conectarFunciones()
    if not MainTab then return end
    for _, child in pairs(MainTab:GetChildren()) do
        if child:IsA("Frame") then
            local titleLabel = child:FindFirstChildWhichIsA("TextLabel")
            if not titleLabel then continue end
            for _, subChild in pairs(child:GetChildren()) do
                if subChild:IsA("TextButton") and subChild.Text == "OFF" then
                    if string.find(titleLabel.Text, "Auto Collect Eggs") then
                        subChild.MouseButton1Click:Connect(function()
                            isAutoCollecting = not isAutoCollecting
                            subChild.Text = isAutoCollecting and "ON" or "OFF"
                            subChild.BackgroundColor3 = isAutoCollecting and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(45, 45, 60)
                        end)
                    elseif string.find(titleLabel.Text, "Auto Place Eggs") then
                        subChild.MouseButton1Click:Connect(function()
                            isAutoPlacing = not isAutoPlacing
                            subChild.Text = isAutoPlacing and "ON" or "OFF"
                            subChild.BackgroundColor3 = isAutoPlacing and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(45, 45, 60)
                            if isAutoPlacing then print("Auto Place: Buscando StartArea...") end
                        end)
                    elseif string.find(titleLabel.Text, "Auto Hatch") then
                        subChild.MouseButton1Click:Connect(function()
                            isAutoHatching = not isAutoHatching
                            subChild.Text = isAutoHatching and "ON" or "OFF"
                            subChild.BackgroundColor3 = isAutoHatching and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(45, 45, 60)
                        end)
                    elseif string.find(titleLabel.Text, "Auto Sell") then
                        subChild.MouseButton1Click:Connect(function()
                            isAutoSelling = not isAutoSelling
                            subChild.Text = isAutoSelling and "ON" or "OFF"
                            subChild.BackgroundColor3 = isAutoSelling and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(45, 45, 60)
                        end)
                    end
                end
            end
        end
    end
end

task.wait(1)
conectarFunciones()

-- Utilidades (Velocidad/Godmode)
RunService.Stepped:Connect(function()
    if SpeedState and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
    if GodState and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanTouch = false end
        end
    end
end)

print(">>> Script JoseAngel_Blox v1.4 Cargado. StartArea configurado para Auto Place.")
