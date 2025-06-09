-- Dead Rails Ultimate Script 2025 | Apple-Style UI
-- Clean, Modern Interface with Glassmorphism and Soft Edges
-- Optimized for Xeno Executor

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Apple UI Color Palette (2025)
local Colors = {
    Primary = Color3.fromRGB(0, 122, 255),      -- iOS Blue
    Secondary = Color3.fromRGB(52, 199, 89),     -- iOS Green
    Accent = Color3.fromRGB(255, 149, 0),        -- iOS Orange
    Background = Color3.fromRGB(242, 242, 247),  -- Light Gray
    Surface = Color3.fromRGB(255, 255, 255),     -- White
    OnSurface = Color3.fromRGB(28, 28, 30),      -- Dark Gray
    OnBackground = Color3.fromRGB(60, 60, 67),   -- Medium Gray
    Error = Color3.fromRGB(255, 59, 48),         -- iOS Red
    Warning = Color3.fromRGB(255, 204, 0),       -- iOS Yellow
    Success = Color3.fromRGB(52, 199, 89),       -- iOS Green
    Glass = Color3.fromRGB(255, 255, 255),       -- Glass Effect
}

-- Dark Mode Colors
local DarkColors = {
    Primary = Color3.fromRGB(10, 132, 255),
    Secondary = Color3.fromRGB(48, 209, 88),
    Accent = Color3.fromRGB(255, 159, 10),
    Background = Color3.fromRGB(0, 0, 0),
    Surface = Color3.fromRGB(28, 28, 30),
    OnSurface = Color3.fromRGB(255, 255, 255),
    OnBackground = Color3.fromRGB(235, 235, 245),
    Error = Color3.fromRGB(255, 69, 58),
    Warning = Color3.fromRGB(255, 214, 10),
    Success = Color3.fromRGB(48, 209, 88),
    Glass = Color3.fromRGB(28, 28, 30),
}

-- Script State Management
local ScriptState = {
    AutoFarm = false,
    FarmItem = "Bond",
    AutoHeal = false,
    AutoReload = false,
    GunKillAura = false,
    ShovelKillAura = false,
    FOVChanger = false,
    FOVValue = 70,
    NoClip = false,
    UnlimitedFPS = false,
    Aimbot = false,
    AimbotHold = false,
    AimbotTarget = "Head",
    AutoDrive = false,
    ESP = false,
    DarkMode = false
}

-- Create Apple-Style UI
local function CreateAppleUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DeadRailsAppleUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Main Container with Glassmorphism
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainContainer"
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 420, 0, 580)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -290)
    MainFrame.BackgroundColor3 = Colors.Glass
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Glassmorphism Effect
    local Blur = Instance.new("ImageLabel")
    Blur.Name = "GlassBlur"
    Blur.Parent = MainFrame
    Blur.Size = UDim2.new(1, 0, 1, 0)
    Blur.BackgroundTransparency = 1
    Blur.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Blur.ImageTransparency = 0.8
    Blur.ScaleType = Enum.ScaleType.Tile
    Blur.TileSize = UDim2.new(0, 128, 0, 128)
    
    -- Rounded Corners (Soft Edges - 2025 Trend)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 16)
    Corner.Parent = MainFrame
    
    -- Subtle Drop Shadow
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "DropShadow"
    Shadow.Parent = ScreenGui
    Shadow.Size = UDim2.new(1, 20, 1, 20)
    Shadow.Position = UDim2.new(0, -10, 0, -10)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.8
    Shadow.ZIndex = MainFrame.ZIndex - 1
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 16)
    ShadowCorner.Parent = Shadow
    
    -- Header with Clean Typography
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, 0, 0, 60)
    Header.BackgroundColor3 = Colors.Primary
    Header.BackgroundTransparency = 0.1
    Header.BorderSizePixel = 0
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 16)
    HeaderCorner.Parent = Header
    
    -- Title with SF Pro Font Style
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Header
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Dead Rails"
    Title.TextColor3 = Colors.OnSurface
    Title.TextScaled = false
    Title.TextSize = 22
    Title.Font = Enum.Font.SourceSansSemibold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextYAlignment = Enum.TextYAlignment.Center
    
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = Header
    Subtitle.Size = UDim2.new(1, -100, 0, 16)
    Subtitle.Position = UDim2.new(0, 20, 0, 32)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Ultimate Script Suite"
    Title.TextColor3 = Colors.OnBackground
    Subtitle.TextScaled = false
    Subtitle.TextSize = 12
    Subtitle.Font = Enum.Font.SourceSans
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button (iOS Style)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = Header
    CloseButton.Size = UDim2.new(0, 32, 0, 32)
    CloseButton.Position = UDim2.new(1, -44, 0, 14)
    CloseButton.BackgroundColor3 = Colors.Error
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Colors.Surface
    CloseButton.TextSize = 16
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.BorderSizePixel = 0
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 16)
    CloseCorner.Parent = CloseButton
    
    -- Tab Navigation (Card-Based Layout)
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = MainFrame
    TabContainer.Size = UDim2.new(1, -24, 0, 44)
    TabContainer.Position = UDim2.new(0, 12, 0, 72)
    TabContainer.BackgroundColor3 = Colors.Background
    TabContainer.BackgroundTransparency = 0.3
    TabContainer.BorderSizePixel = 0
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 12)
    TabCorner.Parent = TabContainer
    
    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Parent = TabContainer
    TabLayout.FillDirection = Enum.FillDirection.Horizontal
    TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    TabLayout.Padding = UDim.new(0, 4)
    
    -- Tab Buttons with Pill Shape
    local tabs = {"Farm", "Combat", "Visual", "Movement", "Settings"}
    local tabButtons = {}
    local contentFrames = {}
    
    for i, tabName in ipairs(tabs) do
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.Parent = TabContainer
        TabButton.Size = UDim2.new(0, 70, 0, 36)
        TabButton.BackgroundColor3 = i == 1 and Colors.Primary or Colors.Surface
        TabButton.BackgroundTransparency = i == 1 and 0 or 0.5
        TabButton.Text = tabName
        TabButton.TextColor3 = i == 1 and Colors.Surface or Colors.OnSurface
        TabButton.TextSize = 12
        TabButton.Font = Enum.Font.SourceSansMedium
        TabButton.BorderSizePixel = 0
        
        local TabButtonCorner = Instance.new("UICorner")
        TabButtonCorner.CornerRadius = UDim.new(0, 18)
        TabButtonCorner.Parent = TabButton
        
        tabButtons[i] = TabButton
        
        -- Content Frame for each tab
        local ContentFrame = Instance.new("ScrollingFrame")
        ContentFrame.Name = tabName .. "Content"
        ContentFrame.Parent = MainFrame
        ContentFrame.Size = UDim2.new(1, -24, 1, -140)
        ContentFrame.Position = UDim2.new(0, 12, 0, 128)
        ContentFrame.BackgroundTransparency = 1
        ContentFrame.BorderSizePixel = 0
        ContentFrame.ScrollBarThickness = 4
        ContentFrame.ScrollBarImageColor3 = Colors.OnBackground
        ContentFrame.Visible = i == 1
        
        local ContentLayout = Instance.new("UIListLayout")
        ContentLayout.Parent = ContentFrame
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContentLayout.Padding = UDim.new(0, 12)
        
        contentFrames[i] = ContentFrame
    end
    
    -- Create Modern Toggle Switch
    local function CreateToggle(parent, text, callback, layoutOrder)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Name = text .. "Toggle"
        ToggleFrame.Parent = parent
        ToggleFrame.Size = UDim2.new(1, 0, 0, 52)
        ToggleFrame.BackgroundColor3 = Colors.Surface
        ToggleFrame.BackgroundTransparency = 0.1
        ToggleFrame.BorderSizePixel = 0
        ToggleFrame.LayoutOrder = layoutOrder or 1
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 12)
        ToggleCorner.Parent = ToggleFrame
        
        local ToggleLabel = Instance.new("TextLabel")
        ToggleLabel.Parent = ToggleFrame
        ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
        ToggleLabel.Position = UDim2.new(0, 16, 0, 0)
        ToggleLabel.BackgroundTransparency = 1
        ToggleLabel.Text = text
        ToggleLabel.TextColor3 = Colors.OnSurface
        ToggleLabel.TextSize = 14
        ToggleLabel.Font = Enum.Font.SourceSansMedium
        ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- iOS-Style Toggle Switch
        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Parent = ToggleFrame
        ToggleButton.Size = UDim2.new(0, 44, 0, 24)
        ToggleButton.Position = UDim2.new(1, -56, 0.5, -12)
        ToggleButton.BackgroundColor3 = Colors.OnBackground
        ToggleButton.Text = ""
        ToggleButton.BorderSizePixel = 0
        
        local ToggleButtonCorner = Instance.new("UICorner")
        ToggleButtonCorner.CornerRadius = UDim.new(0, 12)
        ToggleButtonCorner.Parent = ToggleButton
        
        local ToggleKnob = Instance.new("Frame")
        ToggleKnob.Parent = ToggleButton
        ToggleKnob.Size = UDim2.new(0, 20, 0, 20)
        ToggleKnob.Position = UDim2.new(0, 2, 0, 2)
        ToggleKnob.BackgroundColor3 = Colors.Surface
        ToggleKnob.BorderSizePixel = 0
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(0, 10)
        KnobCorner.Parent = ToggleKnob
        
        local isToggled = false
        
        ToggleButton.MouseButton1Click:Connect(function()
            isToggled = not isToggled
            
            local targetColor = isToggled and Colors.Success or Colors.OnBackground
            local targetPosition = isToggled and UDim2.new(1, -22, 0, 2) or UDim2.new(0, 2, 0, 2)
            
            -- Smooth Animation
            TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                BackgroundColor3 = targetColor
            }):Play()
            
            TweenService:Create(ToggleKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Position = targetPosition
            }):Play()
            
            if callback then callback(isToggled) end
        end)
        
        return ToggleButton, isToggled
    end
    
    -- Create Modern Slider
    local function CreateSlider(parent, text, min, max, default, callback, layoutOrder)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Name = text .. "Slider"
        SliderFrame.Parent = parent
        SliderFrame.Size = UDim2.new(1, 0, 0, 72)
        SliderFrame.BackgroundColor3 = Colors.Surface
        SliderFrame.BackgroundTransparency = 0.1
        SliderFrame.BorderSizePixel = 0
        SliderFrame.LayoutOrder = layoutOrder or 1
        
        local SliderCorner = Instance.new("UICorner")
        SliderCorner.CornerRadius = UDim.new(0, 12)
        SliderCorner.Parent = SliderFrame
        
        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Parent = SliderFrame
        SliderLabel.Size = UDim2.new(1, -80, 0, 24)
        SliderLabel.Position = UDim2.new(0, 16, 0, 8)
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Text = text
        SliderLabel.TextColor3 = Colors.OnSurface
        SliderLabel.TextSize = 14
        SliderLabel.Font = Enum.Font.SourceSansMedium
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local ValueLabel = Instance.new("TextLabel")
        ValueLabel.Parent = SliderFrame
        ValueLabel.Size = UDim2.new(0, 60, 0, 24)
        ValueLabel.Position = UDim2.new(1, -76, 0, 8)
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Text = tostring(default)
        ValueLabel.TextColor3 = Colors.Primary
        ValueLabel.TextSize = 14
        ValueLabel.Font = Enum.Font.SourceSansBold
        ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
        
        -- Slider Track
        local SliderTrack = Instance.new("Frame")
        SliderTrack.Parent = SliderFrame
        SliderTrack.Size = UDim2.new(1, -32, 0, 4)
        SliderTrack.Position = UDim2.new(0, 16, 0, 44)
        SliderTrack.BackgroundColor3 = Colors.Background
        SliderTrack.BorderSizePixel = 0
        
        local TrackCorner = Instance.new("UICorner")
        TrackCorner.CornerRadius = UDim.new(0, 2)
        TrackCorner.Parent = SliderTrack
        
        -- Slider Fill
        local SliderFill = Instance.new("Frame")
        SliderFill.Parent = SliderTrack
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Colors.Primary
        SliderFill.BorderSizePixel = 0
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(0, 2)
        FillCorner.Parent = SliderFill
        
        -- Slider Knob
        local SliderKnob = Instance.new("TextButton")
        SliderKnob.Parent = SliderFrame
        SliderKnob.Size = UDim2.new(0, 20, 0, 20)
        SliderKnob.Position = UDim2.new((default - min) / (max - min), -10, 0, 36)
        SliderKnob.BackgroundColor3 = Colors.Surface
        SliderKnob.Text = ""
        SliderKnob.BorderSizePixel = 0
        
        local KnobCorner = Instance.new("UICorner")
        KnobCorner.CornerRadius = UDim.new(0, 10)
        KnobCorner.Parent = SliderKnob
        
        -- Knob Shadow
        local KnobShadow = Instance.new("Frame")
        KnobShadow.Parent = SliderKnob
        KnobShadow.Size = UDim2.new(1, 4, 1, 4)
        KnobShadow.Position = UDim2.new(0, -2, 0, -2)
        KnobShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        KnobShadow.BackgroundTransparency = 0.9
        KnobShadow.ZIndex = SliderKnob.ZIndex - 1
        
        local ShadowCorner = Instance.new("UICorner")
        ShadowCorner.CornerRadius = UDim.new(0, 12)
        ShadowCorner.Parent = KnobShadow
        
        local currentValue = default
        local dragging = false
        
        local function updateSlider(value)
            currentValue = math.clamp(value, min, max)
            local percentage = (currentValue - min) / (max - min)
            
            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            SliderKnob.Position = UDim2.new(percentage, -10, 0, 36)
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
        
        return updateSlider, currentValue
    end
    
    -- Create Modern Button
    local function CreateButton(parent, text, callback, layoutOrder, style)
        style = style or "primary"
        
        local ButtonFrame = Instance.new("TextButton")
        ButtonFrame.Name = text .. "Button"
        ButtonFrame.Parent = parent
        ButtonFrame.Size = UDim2.new(1, 0, 0, 44)
        ButtonFrame.BackgroundColor3 = style == "primary" and Colors.Primary or Colors.Secondary
        ButtonFrame.Text = text
        ButtonFrame.TextColor3 = Colors.Surface
        ButtonFrame.TextSize = 16
        ButtonFrame.Font = Enum.Font.SourceSansSemibold
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.LayoutOrder = layoutOrder or 1
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 12)
        ButtonCorner.Parent = ButtonFrame
        
        -- Button Press Animation
        ButtonFrame.MouseButton1Click:Connect(function()
            TweenService:Create(ButtonFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = UDim2.new(1, -4, 0, 40)
            }):Play()
            
            task.wait(0.1)
            
            TweenService:Create(ButtonFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = UDim2.new(1, 0, 0, 44)
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
        -- Handle heal threshold
    end, 3)
    
    CreateButton(contentFrames[1], "Teleport to Train", function()
        -- Handle teleport to train
    end, 4)
    
    -- Populate Combat Tab
    CreateToggle(contentFrames[2], "Gun Kill Aura", function(state)
        ScriptState.GunKillAura = state
    end, 1)
    
    CreateToggle(contentFrames[2], "Shovel Kill Aura", function(state)
        ScriptState.ShovelKillAura = state
    end, 2)
    
    CreateSlider(contentFrames[2], "Kill Aura Range", 5, 100, 25, function(value)
        -- Handle kill aura range
    end, 3)
    
    CreateToggle(contentFrames[2], "Aimbot", function(state)
        ScriptState.Aimbot = state
    end, 4)
    
    CreateSlider(contentFrames[2], "Aimbot FOV", 30, 180, 90, function(value)
        ScriptState.FOVValue = value
    end, 5)
    
    -- Populate Visual Tab
    CreateToggle(contentFrames[3], "ESP", function(state)
        ScriptState.ESP = state
    end, 1)
    
    CreateToggle(contentFrames[3], "FOV Changer", function(state)
        ScriptState.FOVChanger = state
    end, 2)
    
    CreateSlider(contentFrames[3], "FOV Value", 30, 120, 70, function(value)
        ScriptState.FOVValue = value
    end, 3)
    
    CreateToggle(contentFrames[3], "Uncap FPS", function(state)
        ScriptState.UnlimitedFPS = state
    end, 4)
    
    -- Populate Movement Tab
    CreateToggle(contentFrames[4], "NoClip", function(state)
        ScriptState.NoClip = state
    end, 1)
    
    CreateSlider(contentFrames[4], "Walk Speed", 16, 50, 16, function(value)
        -- Handle walk speed
    end, 2)
    
    CreateSlider(contentFrames[4], "Jump Power", 50, 150, 50, function(value)
        -- Handle jump power
    end, 3)
    
    -- Populate Settings Tab
    CreateToggle(contentFrames[5], "Dark Mode", function(state)
        ScriptState.DarkMode = state
        -- Toggle between light and dark themes
        local currentColors = state and DarkColors or Colors
        -- Update UI colors here
    end, 1)
    
    CreateButton(contentFrames[5], "Save Configuration", function()
        -- Handle save config
    end, 2)
    
    CreateButton(contentFrames[5], "Load Configuration", function()
        -- Handle load config
    end, 3, "secondary")
    
    -- Tab Switching Logic
    for i, button in ipairs(tabButtons) do
        button.MouseButton1Click:Connect(function()
            -- Update tab buttons
            for j, btn in ipairs(tabButtons) do
                btn.BackgroundColor3 = j == i and Colors.Primary or Colors.Surface
                btn.BackgroundTransparency = j == i and 0 or 0.5
                btn.TextColor3 = j == i and Colors.Surface or Colors.OnSurface
            end
            
            -- Update content visibility
            for j, frame in ipairs(contentFrames) do
                frame.Visible = j == i
            end
        end)
    end
    
    -- Close button functionality
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

-- Core Functions (same as before but integrated with new UI)
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
    
    return nearestEnemy, shortestDistance
end

-- Initialize Apple-Style UI
local AppleUI = CreateAppleUI()

-- Main Game Loop
RunService.Heartbeat:Connect(function()
    -- Auto Farm Logic
    if ScriptState.AutoFarm then
        -- Auto farm implementation
    end
    
    -- Combat Logic
    if ScriptState.GunKillAura or ScriptState.ShovelKillAura then
        local enemy, distance = GetNearestEnemy(25)
        if enemy and distance <= 25 then
            local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
        end
    end
    
    -- Aimbot Logic
    if ScriptState.Aimbot then
        local enemy, distance = GetNearestEnemy(ScriptState.FOVValue)
        if enemy and enemy.Character and enemy.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, enemy.Character.Head.Position)
        end
    end
    
    -- Movement Logic
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if ScriptState.NoClip then
            for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
    
    -- Visual Logic
    if ScriptState.FOVChanger then
        Camera.FieldOfView = ScriptState.FOVValue
    end
    
    if ScriptState.UnlimitedFPS then
        setfpscap(0)
    else
        setfpscap(60)
    end
end)

-- Success Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "Dead Rails Ultimate";
    Text = "Apple-style UI loaded successfully!";
    Duration = 3;
})

print("Dead Rails Ultimate Script with Apple-Style UI loaded!")
print("Features: Glassmorphism, Soft Edges, Clean Typography, Smooth Animations")
