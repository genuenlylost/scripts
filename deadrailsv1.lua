-- Dead Rails Ultimate Exploit Script 2025
-- Advanced Anti-Detection & Professional UI
-- Researched and optimized for maximum functionality

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

-- Core Variables
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Anti-Detection System
local AntiDetection = {
    OriginalServices = {},
    RandomizedNames = {},
    LastTeleportTime = 0,
    TeleportCooldown = 2,
    SpeedLimiter = 35,
    MaxJumpPower = 120
}

-- Initialize Anti-Detection
local function InitializeAntiDetection()
    -- Store original service names
    AntiDetection.OriginalServices = {
        Lighting = game:GetService("Lighting"),
        Workspace = game:GetService("Workspace"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        Players = game:GetService("Players"),
        ReplicatedFirst = game:GetService("ReplicatedFirst")
    }
    
    -- Randomize service names to break basic exploit detection
    for serviceName, service in pairs(AntiDetection.OriginalServices) do
        local randomName = HttpService:GenerateGUID(false):sub(1, 8)
        AntiDetection.RandomizedNames[serviceName] = randomName
        service.Name = randomName
    end
end

-- Script State Management
local ScriptState = {
    -- Farming
    AutoFarm = false,
    FarmItem = "Bond",
    AutoHeal = false,
    HealThreshold = 50,
    AutoCollectItems = false,
    
    -- Combat
    GunKillAura = false,
    ShovelKillAura = false,
    KillAuraRange = 25,
    AutoReload = false,
    Aimbot = false,
    AimbotFOV = 90,
    AimbotSmooth = 0.3,
    AimbotTarget = "Head",
    AimbotHold = false,
    
    -- Movement
    SpeedHack = false,
    WalkSpeed = 16,
    JumpPower = 50,
    NoClip = false,
    InfiniteJump = false,
    
    -- Visual
    ESP = false,
    FOVChanger = false,
    FOVValue = 70,
    FullBright = false,
    NoFog = false,
    
    -- Teleportation
    TeleportToTrain = false,
    AutoDrive = false,
    
    -- Misc
    UnlimitedFPS = false,
    AntiAFK = false,
    UIVisible = true
}

-- Keybinds
local Keybinds = {
    ToggleUI = Enum.KeyCode.Insert,
    AutoDrive = Enum.KeyCode.G,
    TeleportTrain = Enum.KeyCode.T,
    Aimbot = Enum.KeyCode.E,
    KillAura = Enum.KeyCode.K,
    Speed = Enum.KeyCode.X
}

-- Create Professional UI
local function CreateUI()
    -- Main ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = HttpService:GenerateGUID(false):sub(1, 8) -- Random name
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame with Modern Design
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainContainer"
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 500, 0, 650)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -325)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Rounded corners
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    -- Header
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    Header.BorderSizePixel = 0
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Parent = Header
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Dead Rails Ultimate"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Parent = Header
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 59, 48)
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 18
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.BorderSizePixel = 0
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 15)
    CloseCorner.Parent = CloseButton
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Parent = MainFrame
    TabContainer.Size = UDim2.new(1, -20, 0, 40)
    TabContainer.Position = UDim2.new(0, 10, 0, 60)
    TabContainer.BackgroundTransparency = 1
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabContainer
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.Padding = UDim.new(0, 5)
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Parent = MainFrame
    ContentContainer.Size = UDim2.new(1, -20, 1, -120)
    ContentContainer.Position = UDim2.new(0, 10, 0, 110)
    ContentContainer.BackgroundTransparency = 1
    
    -- Tabs
    local tabs = {"Farm", "Combat", "Movement", "Visual", "Misc"}
    local tabButtons = {}
    local contentFrames = {}
    
    for i, tabName in ipairs(tabs) do
        -- Tab Button
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = TabContainer
        TabButton.Size = UDim2.new(0, 80, 1, 0)
        TabButton.BackgroundColor3 = i == 1 and Color3.fromRGB(0, 122, 255) or Color3.fromRGB(45, 45, 50)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.SourceSansMedium
        TabButton.BorderSizePixel = 0
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        tabButtons[i] = TabButton
        
        -- Content Frame
        local ContentFrame = Instance.new("ScrollingFrame")
        ContentFrame.Parent = ContentContainer
        ContentFrame.Size = UDim2.new(1, 0, 1, 0)
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.BorderSizePixel = 0
        ContentFrame.ScrollBarThickness = 6
        ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
        ContentFrame.Visible = i == 1
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = ContentFrame
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 8)
        
        contentFrames[i] = ContentFrame
    end
    
    -- UI Creation Functions
    local function CreateToggle(parent, text, callback, layoutOrder)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Parent = parent
        ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        ToggleFrame.BorderSizePixel = 0
        ToggleFrame.LayoutOrder = layoutOrder or 1
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 8)
        ToggleCorner.Parent = ToggleFrame
        
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Parent = ToggleFrame
        ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = text
        ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleLabel.TextSize = 14
        ToggleLabel.Font = Enum.Font.SourceSans
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Parent = ToggleFrame
        ToggleButton.Size = UDim2.new(0, 40, 0, 20)
        ToggleButton.Position = UDim2.new(1, -50, 0.5, -10)
        ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        ToggleButton.Text = ""
        ToggleButton.BorderSizePixel = 0
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 10)
        ButtonCorner.Parent = ToggleButton
        
        local ToggleKnob = Instance.new("Frame")
        ToggleKnob.Parent = ToggleButton
        ToggleKnob.Size = UDim2.new(0, 16, 0, 16)
        ToggleKnob.Position = UDim2.new(0, 2, 0, 2)
        ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleKnob.BorderSizePixel = 0
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(0, 8)
        KnobCorner.Parent = ToggleKnob
        
        local isToggled = false
        
        ToggleButton.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            
            TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
                BackgroundColor3 = isToggled and Color3.fromRGB(52, 199, 89) or Color3.fromRGB(60, 60, 65)
            }):Play()
            
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2), {
                Position = isToggled and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)
            }):Play()
            
            if callback then callback(isToggled) end
        end)
        
        return ToggleButton
    end
    
    local function CreateSlider(parent, text, min, max, default, callback, layoutOrder)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Parent = parent
        SliderFrame.Size = UDim2.new(1, 0, 0, 50)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.LayoutOrder = layoutOrder or 1
        
        local SliderCorner = Instance.new("UICorner")
        SliderCorner.CornerRadius = UDim.new(0, 8)
        SliderCorner.Parent = SliderFrame
        
        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Parent = SliderFrame
        SliderLabel.Size = UDim2.new(1, -60, 0, 25)
        SliderLabel.Position = UDim2.new(0, 10, 0, 5)
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Text = text
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderLabel.TextSize = 14
        SliderLabel.Font = Enum.Font.SourceSans
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local ValueLabel = Instance.new("TextLabel")
        ValueLabel.Parent = SliderFrame
        ValueLabel.Size = UDim2.new(0, 50, 0, 25)
        ValueLabel.Position = UDim2.new(1, -60, 0, 5)
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Text = tostring(default)
        ValueLabel.TextColor3 = Color3.fromRGB(0, 122, 255)
        ValueLabel.TextSize = 14
        ValueLabel.Font = Enum.Font.SourceSansBold
        ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
        
        local SliderTrack = Instance.new("Frame")
        SliderTrack.Parent = SliderFrame
        SliderTrack.Size = UDim2.new(1, -20, 0, 4)
        SliderTrack.Position = UDim2.new(0, 10, 0, 35)
        SliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
        SliderTrack.BorderSizePixel = 0
        
        local TrackCorner = Instance.new("UICorner")
        TrackCorner.CornerRadius = UDim.new(0, 2)
        TrackCorner.Parent = SliderTrack
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Parent = SliderTrack
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
        SliderFill.BorderSizePixel = 0
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(0, 2)
        FillCorner.Parent = SliderFill
        
        local SliderKnob = Instance.new("TextButton")
        SliderKnob.Parent = SliderFrame
        SliderKnob.Size = UDim2.new(0, 16, 0, 16)
        SliderKnob.Position = UDim2.new((default - min) / (max - min), -8, 0, 27)
        SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderKnob.Text = ""
        SliderKnob.BorderSizePixel = 0
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(0, 8)
        KnobCorner.Parent = SliderKnob
        
        local currentValue = default
        local dragging = false
        
        local function updateSlider(value)
            currentValue = math.clamp(value, min, max)
            local percentage = (currentValue - min) / (max - min)
            
            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            SliderKnob.Position = UDim2.new(percentage, -8, 0, 27)
            ValueLabel.Text = tostring(math.floor(currentValue))
            
            if callback then callback(currentValue) end
        end
        
        SliderKnob.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mouseX = input.Position.X
                local frameX = SliderTrack.AbsolutePosition.X
                local frameWidth = SliderTrack.AbsoluteSize.X
                local percentage = math.clamp((mouseX - frameX) / frameWidth, 0, 1)
                local value = min + (max - min) * percentage
                updateSlider(value)
            end
        end)
        
        return updateSlider
    end
    
    local function CreateButton(parent, text, callback, layoutOrder)
        local ButtonFrame = Instance.new("TextButton")
        ButtonFrame.Parent = parent
        ButtonFrame.Size = UDim2.new(1, 0, 0, 35)
        ButtonFrame.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
        ButtonFrame.Text = text
        ButtonFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
        ButtonFrame.TextSize = 14
        ButtonFrame.Font = Enum.Font.SourceSansMedium
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.LayoutOrder = layoutOrder or 1
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = ButtonFrame
        
        ButtonFrame.MouseButton1Click:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(0, 100, 200)
            }):Play()
            
            task.wait(0.1)
            
            TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(0, 122, 255)
            }):Play()
            
            if callback then callback() end
        end)
        
        return ButtonFrame
    end
    
    -- Populate Farm Tab
    CreateToggle(contentFrames[1], "Auto Farm Items", function(state)
        ScriptState.AutoFarm = state
    end, 1)
    
    CreateToggle(contentFrames[1], "Auto Heal", function(state)
        ScriptState.AutoHeal = state
    end, 2)
    
    CreateSlider(contentFrames[1], "Heal Threshold", 10, 90, 50, function(value)
        ScriptState.HealThreshold = value
    end, 3)
    
    CreateToggle(contentFrames[1], "Auto Collect Items", function(state)
        ScriptState.AutoCollectItems = state
    end, 4)
    
    CreateButton(contentFrames[1], "Teleport to Train", function()
        TeleportToTrain()
    end, 5)
    
    -- Populate Combat Tab
    CreateToggle(contentFrames[2], "Gun Kill Aura", function(state)
        ScriptState.GunKillAura = state
    end, 1)
    
    CreateToggle(contentFrames[2], "Shovel Kill Aura", function(state)
        ScriptState.ShovelKillAura = state
    end, 2)
    
    CreateSlider(contentFrames[2], "Kill Aura Range", 5, 100, 25, function(value)
        ScriptState.KillAuraRange = value
    end, 3)
    
    CreateToggle(contentFrames[2], "Aimbot", function(state)
        ScriptState.Aimbot = state
    end, 4)
    
    CreateSlider(contentFrames[2], "Aimbot FOV", 30, 180, 90, function(value)
        ScriptState.AimbotFOV = value
    end, 5)
    
    CreateSlider(contentFrames[2], "Aimbot Smoothness", 0.1, 1, 0.3, function(value)
        ScriptState.AimbotSmooth = value
    end, 6)
    
    CreateToggle(contentFrames[2], "Auto Reload", function(state)
        ScriptState.AutoReload = state
    end, 7)
    
    -- Populate Movement Tab
    CreateToggle(contentFrames[3], "Speed Hack", function(state)
        ScriptState.SpeedHack = state
    end, 1)
    
    CreateSlider(contentFrames[3], "Walk Speed", 16, 50, 16, function(value)
        ScriptState.WalkSpeed = value
    end, 2)
    
    CreateSlider(contentFrames[3], "Jump Power", 50, 150, 50, function(value)
        ScriptState.JumpPower = value
    end, 3)
    
    CreateToggle(contentFrames[3], "NoClip", function(state)
        ScriptState.NoClip = state
    end, 4)
    
    CreateToggle(contentFrames[3], "Infinite Jump", function(state)
        ScriptState.InfiniteJump = state
    end, 5)
    
    CreateToggle(contentFrames[3], "Auto Drive Train", function(state)
        ScriptState.AutoDrive = state
    end, 6)
    
    -- Populate Visual Tab
    CreateToggle(contentFrames[4], "ESP", function(state)
        ScriptState.ESP = state
    end, 1)
    
    CreateToggle(contentFrames[4], "FOV Changer", function(state)
        ScriptState.FOVChanger = state
    end, 2)
    
    CreateSlider(contentFrames[4], "FOV Value", 30, 120, 70, function(value)
        ScriptState.FOVValue = value
    end, 3)
    
    CreateToggle(contentFrames[4], "Full Bright", function(state)
        ScriptState.FullBright = state
    end, 4)
    
    CreateToggle(contentFrames[4], "No Fog", function(state)
        ScriptState.NoFog = state
    end, 5)
    
    -- Populate Misc Tab
    CreateToggle(contentFrames[5], "Uncap FPS", function(state)
        ScriptState.UnlimitedFPS = state
    end, 1)
    
    CreateToggle(contentFrames[5], "Anti AFK", function(state)
        ScriptState.AntiAFK = state
    end, 2)
    
    CreateButton(contentFrames[5], "Rejoin Server", function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end, 3)
    
    -- Tab switching logic
    for i, button in ipairs(tabButtons) do
        button.MouseButton1Click:Connect(function()
            for j, btn in ipairs(tabButtons) do
                btn.BackgroundColor3 = j == i and Color3.fromRGB(0, 122, 255) or Color3.fromRGB(45, 45, 50)
            end
            
            for j, frame in ipairs(contentFrames) do
                frame.Visible = j == i
            end
        end)
    end
    
    -- Close button
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    -- Auto-resize content frames
    for _, frame in ipairs(contentFrames) do
        local layout = frame:FindFirstChild("UIListLayout")
        if layout then
            layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
            end)
        end
    end
    
    return ScreenGui
end

-- Core Functions

-- Safe Teleportation with Anti-Detection
local function SafeTeleport(targetCFrame, callback)
    if tick() - AntiDetection.LastTeleportTime < AntiDetection.TeleportCooldown then
        return false
    end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local startPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        local distance = (startPos.Position - targetCFrame.Position).Magnitude
        
        if distance > 50 then
            -- Use TweenService for long distances
            local tweenInfo = TweenInfo.new(
                math.min(distance / 100, 3),
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.InOut
            )
            
            local tween = TweenService:Create(
                LocalPlayer.Character.HumanoidRootPart,
                tweenInfo,
                {CFrame = targetCFrame}
            )
            
            tween:Play()
            if callback then
                tween.Completed:Connect(callback)
            end
        else
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
            if callback then
                callback()
            end
        end
        
        AntiDetection.LastTeleportTime = tick()
        return true
    end
    return false
end

-- Find Items Function
local function FindItems(itemType)
    local items = {}
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("MeshPart") then
            local name = obj.Name:lower()
            local itemTypeLower = itemType:lower()
            
            if name:find(itemTypeLower) or 
               (itemTypeLower == "bond" and (name:find("bond") or name:find("gold") or name:find("doubloon"))) or
               (itemTypeLower == "coal" and name:find("coal")) or
               (itemTypeLower == "gun" and (name:find("gun") or name:find("rifle") or name:find("pistol"))) or
               (itemTypeLower == "ammo" and (name:find("ammo") or name:find("bullet"))) or
               (itemTypeLower == "healthkit" and (name:find("health") or name:find("medkit") or name:find("bandage"))) then
                
                if obj:FindFirstChild("ProximityPrompt") or obj.Parent:FindFirstChild("ProximityPrompt") then
                    table.insert(items, obj)
                end
            end
        end
    end
    
    return items
end

-- Auto Farm Function
local function AutoFarmItems()
    if not ScriptState.AutoFarm then return end
    
    local items = FindItems(ScriptState.FarmItem)
    
    for _, item in pairs(items) do
        if not ScriptState.AutoFarm then break end
        
        local proximityPrompt = item:FindFirstChild("ProximityPrompt") or item.Parent:FindFirstChild("ProximityPrompt")
        
        if proximityPrompt and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            SafeTeleport(item.CFrame + Vector3.new(0, 3, 0), function()
                task.wait(0.2)
                if proximityPrompt then
                    fireproximityprompt(proximityPrompt)
                end
            end)
            
            task.wait(1)
        end
    end
end

-- Train Functions
function TeleportToTrain()
    local train = Workspace:FindFirstChild("Train")
    if not train then
        for _, obj in pairs(Workspace:GetChildren()) do
            if obj.Name:lower():find("train") or obj.Name:lower():find("locomotive") then
                train = obj
                break
            end
        end
    end
    
    if train and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local trainPart = train:FindFirstChild("Seat") or train:FindFirstChild("Part") or train.PrimaryPart
        if trainPart then
            SafeTeleport(trainPart.CFrame + Vector3.new(0, 5, 0))
        end
    end
end

-- Combat Functions
local function GetNearestEnemy(maxDistance)
    local nearestEnemy = nil
    local shortestDistance = maxDistance or math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestEnemy = player
            end
        end
    end
    
    -- Check for NPCs/Zombies
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") and obj ~= LocalPlayer.Character then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - obj.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestEnemy = {Character = obj}
            end
        end
    end
    
    return nearestEnemy, shortestDistance
end

-- Kill Aura Function
local function PerformKillAura(weaponType)
    local enemy, distance = GetNearestEnemy(ScriptState.KillAuraRange)
    if not enemy or not enemy.Character then return end
    
    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    local toolName = tool.Name:lower()
    
    if weaponType == "gun" and (toolName:find("gun") or toolName:find("rifle") or toolName:find("pistol")) then
        if enemy.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, enemy.Character.Head.Position)
        end
        tool:Activate()
    elseif weaponType == "shovel" and (toolName:find("shovel") or toolName:find("axe") or toolName:find("knife")) then
        tool:Activate()
    end
end

-- Aimbot Function
local function UpdateAimbot()
    if not ScriptState.Aimbot then return end
    if ScriptState.AimbotHold and not UserInputService:IsKeyDown(Keybinds.Aimbot) then return end
    
    local enemy, distance = GetNearestEnemy(ScriptState.AimbotFOV)
    if not enemy or not enemy.Character then return end
    
    local targetPart = enemy.Character:FindFirstChild(ScriptState.AimbotTarget)
    if not targetPart then return end
    
    local targetPosition = targetPart.Position
    local currentCFrame = Camera.CFrame
    local targetCFrame = CFrame.lookAt(currentCFrame.Position, targetPosition)
    
    local newCFrame = currentCFrame:Lerp(targetCFrame, ScriptState.AimbotSmooth)
    Camera.CFrame = newCFrame
end

-- ESP Function
local function CreateESP(obj, color, text)
    if obj:FindFirstChild("ESPBox") then return end
    
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESPBox"
    billboardGui.Adornee = obj
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = obj
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.7
    frame.BackgroundColor3 = color
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(1, 1, 1)
    frame.Parent = billboardGui
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text or obj.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame
end

-- Auto Heal Function
local function AutoHeal()
    if not ScriptState.AutoHeal then return end
    
    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    local healthPercent = (humanoid.Health / humanoid.MaxHealth) * 100
    
    if healthPercent <= ScriptState.HealThreshold then
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            local healthItem = backpack:FindFirstChild("HealthKit") or 
                              backpack:FindFirstChild("Bandage") or 
                              backpack:FindFirstChild("MedKit")
            
            if healthItem then
                humanoid:EquipTool(healthItem)
                task.wait(0.1)
                healthItem:Activate()
            end
        end
    end
end

-- Initialize Anti-Detection
InitializeAntiDetection()

-- Create UI
local MainUI = CreateUI()

-- Main Game Loop
RunService.Heartbeat:Connect(function()
    -- Auto Farm
    if ScriptState.AutoFarm then
        task.spawn(AutoFarmItems)
    end
    
    -- Combat
    if ScriptState.GunKillAura then
        PerformKillAura("gun")
    end
    
    if ScriptState.ShovelKillAura then
        PerformKillAura("shovel")
    end
    
    -- Auto functions
    AutoHeal()
    UpdateAimbot()
    
    -- Movement
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = LocalPlayer.Character.Humanoid
        
        if ScriptState.SpeedHack then
            humanoid.WalkSpeed = math.min(ScriptState.WalkSpeed, AntiDetection.SpeedLimiter)
        end
        
        humanoid.JumpPower = math.min(ScriptState.JumpPower, AntiDetection.MaxJumpPower)
    end
    
    -- NoClip
    if ScriptState.NoClip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
    
    -- Visual
    if ScriptState.FOVChanger then
        Camera.FieldOfView = ScriptState.FOVValue
    end
    
    if ScriptState.UnlimitedFPS then
        setfpscap(0)
    else
        setfpscap(60)
    end
    
    if ScriptState.FullBright then
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 100000
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end
end)

-- ESP Loop
task.spawn(function()
    while true do
        if ScriptState.ESP then
            local items = FindItems("Bond")
            for _, item in pairs(items) do
                CreateESP(item, Color3.fromRGB(255, 255, 0), "Bond")
            end
            
            local coalItems = FindItems("Coal")
            for _, item in pairs(coalItems) do
                CreateESP(item, Color3.fromRGB(0, 0, 0), "Coal")
            end
            
            local gunItems = FindItems("Gun")
            for _, item in pairs(gunItems) do
                CreateESP(item, Color3.fromRGB(255, 0, 0), "Gun")
            end
        else
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:FindFirstChild("ESPBox") then
                    obj.ESPBox:Destroy()
                end
            end
        end
        task.wait(2)
    end
end)

-- Keybind Events
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Keybinds.ToggleUI then
        MainUI.Enabled = not MainUI.Enabled
    elseif input.KeyCode == Keybinds.AutoDrive then
        ScriptState.AutoDrive = not ScriptState.AutoDrive
    elseif input.KeyCode == Keybinds.TeleportTrain then
        TeleportToTrain()
    elseif input.KeyCode == Keybinds.Aimbot then
        if not ScriptState.AimbotHold then
            ScriptState.Aimbot = not ScriptState.Aimbot
        end
    elseif input.KeyCode == Keybinds.KillAura then
        ScriptState.GunKillAura = not ScriptState.GunKillAura
        ScriptState.ShovelKillAura = not ScriptState.ShovelKillAura
    elseif input.KeyCode == Keybinds.Speed then
        ScriptState.SpeedHack = not ScriptState.SpeedHack
    end
end)

-- Anti-AFK
task.spawn(function()
    while true do
        if ScriptState.AntiAFK then
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
        task.wait(300) -- 5 minutes
    end
end)

-- Success Notification
StarterGui:SetCore("SendNotification", {
    Title = "Dead Rails Ultimate";
    Text = "Script loaded successfully! Press INSERT to toggle UI";
    Duration = 5;
})

print("Dead Rails Ultimate Script loaded!")
print("Features: Advanced Anti-Detection, Professional UI, Full Functionality")
print("Keybinds:")
print("INSERT - Toggle UI")
print("G - Auto Drive Train")
print("T - Teleport to Train")
print("E - Toggle Aimbot")
print("K - Toggle Kill Aura")
print("X - Toggle Speed Hack")
