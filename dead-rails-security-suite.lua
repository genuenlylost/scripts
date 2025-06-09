-- Dead Rails Security Testing Suite
-- Professional UI Implementation for Vulnerability Assessment

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

-- Variables
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- State Management
local ScriptState = {
    killAura = false,
    gunKillAura = false,
    aimbot = false,
    esp = false,
    autoCollect = false,
    teleportEnabled = false,
    uiVisible = true
}

-- Configuration
local Config = {
    killAuraRange = 50,
    gunRange = 100,
    aimbotFOV = 90,
    aimbotSmoothness = 0.5,
    espColor = Color3.fromRGB(255, 0, 0),
    keybind = Enum.KeyCode.Insert
}

-- Create Main Window
local Window = Library:CreateWindow({
    Title = 'Dead Rails Security Suite',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- Create Tabs
local MainTab = Window:AddTab('Combat Features')
local VisualsTab = Window:AddTab('Visual Features') 
local MovementTab = Window:AddTab('Movement')
local MiscTab = Window:AddTab('Miscellaneous')
local SettingsTab = Window:AddTab('Settings')

-- Combat Features Implementation
local CombatGroup = MainTab:AddLeftGroupbox('Combat Systems')

-- Kill Aura (Melee)
CombatGroup:AddToggle('KillAura', {
    Text = 'Melee Kill Aura',
    Default = false,
    Tooltip = 'Automatically attacks nearby enemies with melee weapons'
})

CombatGroup:AddSlider('KillAuraRange', {
    Text = 'Kill Aura Range',
    Default = 50,
    Min = 10,
    Max = 200,
    Rounding = 1,
    Compact = false
})

-- Gun Kill Aura
CombatGroup:AddToggle('GunKillAura', {
    Text = 'Gun Kill Aura',
    Default = false,
    Tooltip = 'Automatically shoots nearby enemies'
})

CombatGroup:AddSlider('GunRange', {
    Text = 'Gun Range',
    Default = 100,
    Min = 20,
    Max = 500,
    Rounding = 1,
    Compact = false
})

-- Aimbot System
local AimbotGroup = MainTab:AddRightGroupbox('Aimbot System')

AimbotGroup:AddToggle('Aimbot', {
    Text = 'Enable Aimbot',
    Default = false,
    Tooltip = 'Automatically aims at nearest enemy'
})

AimbotGroup:AddSlider('AimbotFOV', {
    Text = 'Aimbot FOV',
    Default = 90,
    Min = 30,
    Max = 180,
    Rounding = 1,
    Compact = false
})

AimbotGroup:AddSlider('AimbotSmooth', {
    Text = 'Smoothness',
    Default = 0.5,
    Min = 0.1,
    Max = 1,
    Rounding = 2,
    Compact = false
})

-- Visual Features
local ESPGroup = VisualsTab:AddLeftGroupbox('ESP Systems')

ESPGroup:AddToggle('PlayerESP', {
    Text = 'Player ESP',
    Default = false,
    Tooltip = 'Shows player locations through walls'
})

ESPGroup:AddToggle('ItemESP', {
    Text = 'Item ESP', 
    Default = false,
    Tooltip = 'Shows valuable items'
})

ESPGroup:AddToggle('ZombieESP', {
    Text = 'Zombie ESP',
    Default = false,
    Tooltip = 'Shows zombie locations'
})

ESPGroup:AddColorPicker('ESPColor', {
    Default = Color3.fromRGB(255, 0, 0),
    Title = 'ESP Color'
})

-- Visual Enhancements
local VisualGroup = VisualsTab:AddRightGroupbox('Visual Enhancements')

VisualGroup:AddToggle('FullBright', {
    Text = 'Full Bright',
    Default = false,
    Tooltip = 'Removes darkness'
})

VisualGroup:AddToggle('NoFog', {
    Text = 'No Fog',
    Default = false,
    Tooltip = 'Removes fog effects'
})

-- Movement Features
local MovementGroup = MovementTab:AddLeftGroupbox('Movement')

MovementGroup:AddToggle('TrainTeleport', {
    Text = 'Teleport to Train',
    Default = false,
    Tooltip = 'Instantly teleports to the train'
})

MovementGroup:AddSlider('WalkSpeed', {
    Text = 'Walk Speed',
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Compact = false
})

MovementGroup:AddSlider('JumpPower', {
    Text = 'Jump Power', 
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 1,
    Compact = false
})

-- Miscellaneous Features
local AutoGroup = MiscTab:AddLeftGroupbox('Automation')

AutoGroup:AddToggle('AutoCollect', {
    Text = 'Auto Collect Items',
    Default = false,
    Tooltip = 'Automatically collects nearby items'
})

AutoGroup:AddToggle('AutoBond', {
    Text = 'Auto Bond Farm',
    Default = false,
    Tooltip = 'Automatically farms bonds/currency'
})

AutoGroup:AddToggle('InstantInteract', {
    Text = 'Instant Interact',
    Default = false,
    Tooltip = 'Removes interaction delays'
})

-- Settings
local UIGroup = SettingsTab:AddLeftGroupbox('UI Settings')

UIGroup:AddLabel('Keybind to toggle UI')
UIGroup:AddKeyPicker('UIToggle', {
    Default = 'Insert',
    SyncToggleState = false,
    Mode = 'Toggle',
    Text = 'UI Toggle',
    NoUI = false
})

-- Core Functions
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

local function GetZombies()
    local zombies = {}
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj.Name:lower():find("zombie") or obj.Name:lower():find("walker") then
            if obj:FindFirstChild("HumanoidRootPart") then
                table.insert(zombies, obj)
            end
        end
    end
    return zombies
end

local function CreateESP(object, color, text)
    if object:FindFirstChild("ESPBox") then return end
    
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESPBox"
    billboardGui.Adornee = object:FindFirstChild("HumanoidRootPart") or object:FindFirstChild("Head")
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = object
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = color
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(1, 1, 1)
    frame.Parent = billboardGui
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text or object.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame
end

local function PerformMeleeAttack(target)
    if not target or not target.Character then return end
    
    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool and tool.Name:lower():find("shovel") then
        -- Simulate melee attack
        local targetPart = target.Character:FindFirstChild("HumanoidRootPart")
        if targetPart then
            -- Fire remote events or use tool activation
            tool:Activate()
        end
    end
end

local function PerformGunAttack(target)
    if not target or not target.Character then return end
    
    local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool and (tool.Name:lower():find("gun") or tool.Name:lower():find("rifle")) then
        local targetPart = target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
        if targetPart then
            tool:Activate()
        end
    end
end

local function TeleportToTrain()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj.Name:lower():find("train") and obj:FindFirstChild("Seat") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Seat.CFrame + Vector3.new(0, 5, 0)
            break
        end
    end
end

local function CollectNearbyItems()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:FindFirstChild("Handle") and obj:FindFirstChild("ProximityPrompt") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - obj.Handle.Position).Magnitude
            if distance <= 50 then
                obj.Handle.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
end

-- Main Loop
RunService.Heartbeat:Connect(function()
    if ScriptState.killAura then
        local enemy, distance = GetNearestEnemy(Config.killAuraRange)
        if enemy and distance <= Config.killAuraRange then
            PerformMeleeAttack(enemy)
        end
        
        -- Also check zombies
        local zombies = GetZombies()
        for _, zombie in pairs(zombies) do
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - zombie.HumanoidRootPart.Position).Magnitude
            if distance <= Config.killAuraRange then
                PerformMeleeAttack({Character = zombie})
            end
        end
    end
    
    if ScriptState.gunKillAura then
        local enemy, distance = GetNearestEnemy(Config.gunRange)
        if enemy and distance <= Config.gunRange then
            PerformGunAttack(enemy)
        end
    end
    
    if ScriptState.autoCollect then
        CollectNearbyItems()
    end
end)

-- Event Connections
Toggles.KillAura:OnChanged(function()
    ScriptState.killAura = Toggles.KillAura.Value
    Config.killAuraRange = Options.KillAuraRange.Value
end)

Toggles.GunKillAura:OnChanged(function()
    ScriptState.gunKillAura = Toggles.GunKillAura.Value
    Config.gunRange = Options.GunRange.Value
end)

Toggles.PlayerESP:OnChanged(function()
    if Toggles.PlayerESP.Value then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                CreateESP(player.Character, Options.ESPColor.Value, player.Name)
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("ESPBox") then
                player.Character.ESPBox:Destroy()
            end
        end
    end
end)

Toggles.TrainTeleport:OnChanged(function()
    if Toggles.TrainTeleport.Value then
        TeleportToTrain()
        Toggles.TrainTeleport:SetValue(false)
    end
end)

Toggles.AutoCollect:OnChanged(function()
    ScriptState.autoCollect = Toggles.AutoCollect.Value
end)

-- UI Toggle
Options.UIToggle:OnClick(function()
    Library:SetOpen(not Library.Open)
end)

-- Theme and Save Management
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
ThemeManager:SetFolder('DeadRailsSecuritySuite')
SaveManager:SetFolder('DeadRailsSecuritySuite/configs')

SaveManager:BuildConfigSection(SettingsTab)
ThemeManager:ApplyToTab(SettingsTab)

-- Initialize
Library:OnUnload(function()
    print('Dead Rails Security Suite unloaded!')
end)

print("Dead Rails Security Testing Suite loaded successfully!")
print("Press " .. Options.UIToggle.Value .. " to toggle UI")
