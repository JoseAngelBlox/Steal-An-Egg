-- ==========================================
--  JOSEANGEL_BLOX STEAL AN EGG SCRIPT v1.1
--  Burbuja flotante + Info + Compacto (Sin Auto Hatch)
-- ==========================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local scriptEnabled = false

-- Limpiar UI anterior
if CoreGui:FindFirstChild("JoseAngel_StealAnEgg") then
    CoreGui.JoseAngel_StealAnEgg:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JoseAngel_StealAnEgg"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Burbuja flotante para activar/desactivar todo el script
local BubbleBtn = Instance.new("TextButton")
BubbleBtn.Size = UDim2.new(0, 60, 0, 60)
BubbleBtn.Position = UDim2.new(1, -70, 1, -70)
BubbleBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
BubbleBtn.Text = "ON"
BubbleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BubbleBtn.Font = Enum.Font.SourceSansBold
BubbleBtn.TextSize = 18
BubbleBtn.Parent = ScreenGui
Instance.new("UICorner", BubbleBtn).CornerRadius = UDim.new(1, 0)

BubbleBtn.MouseButton1Click:Connect(function()
    scriptEnabled = not scriptEnabled
    BubbleBtn.Text = scriptEnabled and "ON" or "OFF"
    BubbleBtn.BackgroundColor3 = scriptEnabled and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(200, 50, 50)
    print("Script " .. (scriptEnabled and "ACTIVADO" or "DESACTIVADO"))
end)

-- Menú principal compacto
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Size = UDim2.new(1, -20, 0, 30)
HeaderTitle.Position = UDim2.new(0, 10, 0, 10)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "JoseAngel_Blox Steal An Egg"
HeaderTitle.TextSize = 16
HeaderTitle.Font = Enum.Font.SourceSansBold
HeaderTitle.TextColor3 = Color3.fromRGB(0, 150, 255)
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = MainFrame

local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -10, 0, 30)
TabFrame.Position = UDim2.new(0, 5, 0, 45)
TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TabFrame.Parent = MainFrame
Instance.new("UICorner", TabFrame).CornerRadius = UDim.new(0, 8)

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -10, 1, -90)
ContentFrame.Position = UDim2.new(0, 5, 0, 80)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ScrollBarThickness = 4
ContentFrame.Parent = MainFrame
Instance.new("UIListLayout", ContentFrame).Padding = UDim.new(0, 8)

-- Pestañas
local tabs = {"Info", "Main", "Utilidad"}
local currentTab = "Info"

for i, tabName in ipairs(tabs) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1/3, -2, 1, 0)
    tabBtn.Position = UDim2.new((i-1)/3, 0, 0, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.Font = Enum.Font.SourceSansSemibold
    tabBtn.TextSize = 12
    tabBtn.Parent = TabFrame
    
    tabBtn.MouseButton1Click:Connect(function()
        currentTab = tabName
        for _, btn in pairs(TabFrame:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
                btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
        tabBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        updateContent()
    end)
end

-- Contenido de las pestañas
local function updateContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    if currentTab == "Info" then
        -- AQUÍ ESTÁ LA VERSIÓN 1.1
        local infoItems = {
            {"Creador", "JoseAngel_Blox"},
            {"Versión", "1.1"}, 
            {"Fecha", "16/09/2026"},
            {"Estado", scriptEnabled and "Activo" or "Inactivo"}
        }
        
        for _, item in ipairs(infoItems) do
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 35)
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
            frame.Parent = ContentFrame
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
            
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, -10, 1, 0)
            text.Position = UDim2.new(0, 5, 0, 0)
            text.BackgroundTransparency = 1
            text.Text = item[1] .. ": " .. item[2]
            text.TextColor3 = Color3.fromRGB(220, 220, 240)
            text.TextSize = 13
            text.Font = Enum.Font.SourceSans
            text.TextXAlignment = Enum.TextXAlignment.Left
            text.Parent = frame
        end
        
    elseif currentTab == "Main" then
        -- Funciones (Sin Auto Hatch)
        local functions = {
            {"Auto Collect Eggs", "Va a huevos (Eggs/Hitbox)", "isAutoCollecting"},
            {"Auto Place Eggs", "Va corriendo a StartArea", "isAutoPlacing"},
            {"Auto Sell Mascotas", "Teletransporta a SellAll", "isAutoSelling"}
        }
        
        for _, func in ipairs(functions) do
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 0, 50)
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
            frame.Parent = ContentFrame
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
            
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(0.7, 0, 0, 20)
            title.Position = UDim2.new(0, 8, 0, 4)
            title.BackgroundTransparency = 1
            title.Text = func[1]
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.Font = Enum.Font.SourceSansBold
            title.TextSize = 13
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Parent = frame
            
            local desc = Instance.new("TextLabel")
            desc.Size = UDim2.new(0.7, 0, 0, 18)
            desc.Position = UDim2.new(0, 8, 0, 24)
            desc.BackgroundTransparency = 1
            desc.Text = func[2]
            desc.TextColor3 = Color3.fromRGB(160, 160, 180)
            desc.Font = Enum.Font.SourceSans
            desc.TextSize = 10
            desc.TextXAlignment = Enum.TextXAlignment.Left
            desc.Parent = frame
            
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.25, 0, 0, 28)
            btn.Position = UDim2.new(0.72, 0, 0.5, -14)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            btn.Text = "OFF"
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.Font = Enum.Font.SourceSansBold
            btn.TextSize = 11
            btn.Parent = frame
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
            
            local enabled = false
            btn.MouseButton1Click:Connect(function()
                enabled = not enabled
                _G[func[3]] = enabled
                btn.Text = enabled and "ON" or "OFF"
                btn.BackgroundColor3 = enabled and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(50, 50, 70)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            end)
        end
        
    elseif currentTab == "Utilidad" then
        local speedFrame = Instance.new("Frame")
        speedFrame.Size = UDim2.new(1, 0, 0, 45)
        speedFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        speedFrame.Parent = ContentFrame
        Instance.new("UICorner", speedFrame).CornerRadius = UDim.new(0, 6)
        
        local speedTitle = Instance.new("TextLabel")
        speedTitle.Size = UDim2.new(1, -10, 0, 20)
        speedTitle.Position = UDim2.new(0, 8, 0, 4)
        speedTitle.BackgroundTransparency = 1
        speedTitle.Text = "Velocidad Rápida (50 WalkSpeed)"
        speedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedTitle.Font = Enum.Font.SourceSansBold
        speedTitle.TextSize = 13
        speedTitle.TextXAlignment = Enum.TextXAlignment.Left
        speedTitle.Parent = speedFrame
        
        local speedBtn = Instance.new("TextButton")
        speedBtn.Size = UDim2.new(0.9, 0, 0, 22)
        speedBtn.Position = UDim2.new(0.05, 0, 0, 20)
        speedBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        speedBtn.Text = "Activar"
        speedBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        speedBtn.Font = Enum.Font.SourceSans
        speedBtn.TextSize = 11
        speedBtn.Parent = speedFrame
        Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0, 4)
        
        local speedEnabled = false
        speedBtn.MouseButton1Click:Connect(function()
            speedEnabled = not speedEnabled
            speedBtn.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 170, 127) or Color3.fromRGB(50, 50, 70)
            speedBtn.Text = speedEnabled and "Desactivar" or "Activar"
            speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            _G.SpeedState = speedEnabled
        end)
    end
end

-- Botón para abrir/cerrar menú
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 80, 0, 30)
ToggleBtn.Position = UDim2.new(0.5, -40, 0, 10)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ToggleBtn.Text = "Abrir Menú"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "Cerrar Menú" or "Abrir Menú"
end)

updateContent()

-- ==========================================
--  LÓGICA DEL JUEGO (SIN AUTO HATCH)
-- ==========================================

-- Configuración
local eggKeywords = {"Eggs", "Hitbox"}
local deliveryZoneName = "StartArea"
local sellZoneName = "SellAll"

-- Funciones de búsqueda
local function findNearestByList(keywordsList)
    local nearest, minDist = nil, math.huge
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local rootPos = char.HumanoidRootPart.Position

    for _, child in pairs(Workspace:GetDescendants()) do
        if child:IsA("BasePart") then
            for _, keyword in pairs(keywordsList) do
                if string.find(child.Name, keyword) and child.CanCollide then
                    local dist = (child.Position - rootPos).magnitude
                    if dist < minDist and dist < 300 then
                        minDist, nearest = dist, child
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

-- Bucle principal optimizado
task.spawn(function()
    while true do
        task.wait(0.5)
        if not scriptEnabled then continue end
        
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then continue end
        local humanoid = char.Humanoid
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then continue end

        -- Auto Collect
        if _G.isAutoCollecting then
            local egg, dist = findNearestByList(eggKeywords)
            if egg and dist > 4 then
                humanoid:MoveTo(egg.Position)
            end
        end

        -- Auto Place
        if _G.isAutoPlacing then
            local startArea = findSpecificZone(deliveryZoneName)
            if startArea and (root.Position - startArea.Position).magnitude > 5 then
                humanoid:MoveTo(startArea.Position)
            end
        end

        -- Auto Sell
        if _G.isAutoSelling then
            local sellZone = findSpecificZone(sellZoneName)
            if sellZone then
                if (root.Position - sellZone.Position).magnitude > 10 then
                    root.CFrame = sellZone.CFrame + Vector3.new(0, 5, 0)
                    task.wait(1)
                else
                    task.wait(3)
                end
            end
        end
    end
end)

-- Utilidades
RunService.Stepped:Connect(function()
    if _G.SpeedState and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
end)

print(">>> Script JoseAngel_Blox v1.1 Cargado. Listo para usar.")
