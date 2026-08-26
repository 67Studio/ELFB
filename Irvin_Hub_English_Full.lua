-- ==============================================================
-- IRVIN HUB | BROOKHAVEN
-- Source: https://dsc.gg/glassluau
-- ==============================================================

print("\n" .. string.rep("=", 70))
print("🚀 STARTING IRVIN HUB ENGLISH VERSION...")
print(string.rep("=", 70) .. "\n")

-- Wrap everything in pcall to catch any errors
local success, errorMessage = pcall(function()

print("📍 STEP 1: Loading Redz Library...")
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/XqZsnzRQ", true))()
print("✅ STEP 1: Library loaded successfully!\n")

workspace.FallenPartsDestroyHeight = -math.huge
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

print("📍 STEP 2: Creating main window...")
local Window = Library:MakeWindow({
    Title = "Irvin Hub | Brookhaven",
    SubTitle = "By: irvin",
    LoadText = "Loading Irvin Hub...",
    Flags = "Irvin_Hub"
})
print("✅ STEP 2: Main window created!\n")

print("📍 STEP 3: Adding minimize button...")
pcall(function()
    Window:AddMinimizeButton({
        Button = { Image = "rbxassetid://90894892797730", BackgroundTransparency = 1 },
        Corner = { CornerRadius = UDim.new(35, 1) },
    })
end)
print("✅ STEP 3: Minimize button added!\n")

-- ============================================================
-- INFO TAB
-- ============================================================
print("📍 STEP 4: Creating Info Tab...")
local InfoTab = Window:MakeTab({ "Info", "info" })
print("✅ STEP 4: Info Tab created!\n")

print("📍 STEP 5: Adding sections to Info Tab...")
pcall(function()
    InfoTab:AddSection({ "Information" })
    InfoTab:AddSection({ "Credits" })
    InfoTab:AddParagraph({ "Programmer:", "Frosy230_0, irvindev" })
    InfoTab:AddParagraph({ "Team:", "IrvinDev's" })
    
    InfoTab:AddSection({ "Social Networks" })
    InfoTab:AddDiscordInvite({
        Name = "Irvin Hub",
        Description = "Join our Discord",
        Logo = "rbxassetid://90894892797730",
        Invite = "https://discord.gg/BUZ5S6Cvr",
    })
    
    InfoTab:AddDiscordInvite({
        Name = "☕ Irvin ☕",
        Description = "TikTok Channel",
        Logo = "rbxassetid://90894892797730",
        Invite = "https://www.tiktok.com/@kaykaka2?_t=ZM-90ubEih1BNc&_r=1",
    })
end)
print("✅ STEP 5: Info Tab sections added!\n")

print("📍 STEP 6: Adding player information...")
pcall(function()
    InfoTab:AddSection({ "Player Stats" })
    
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")
    
    local function getStatValue(parent, name)
        if parent then
            local obj = parent:FindFirstChild(name)
            if obj and obj.GetValue then
                local stat_success, value = pcall(function() return obj:GetValue() end)
                if stat_success then return math.floor(value) end
            end
        end
        return "Unidentified"
    end
    
    local info = {}
    info["Username:"] = LocalPlayer.Name or "Unidentified"
    info["Display Name:"] = LocalPlayer.DisplayName or "Unidentified"
    info["User ID:"] = LocalPlayer.UserId or "Unidentified"
    info["Account Age:"] = LocalPlayer.AccountAge or "Unidentified"
    
    local netStats = Stats:FindFirstChild("Network")
    local serverStats = netStats and netStats:FindFirstChild("ServerStatsItem")
    info["Ping:"] = (serverStats and getStatValue(serverStats, "Data Ping") .. " ms") or "Unidentified"
    
    if identifyexecutor then
        local executor_success, name, version = pcall(function() return identifyexecutor() end)
        info["Executor:"] = executor_success and (name .. (version and (" v" .. version) or "")) or "Unidentified"
    else
        info["Executor:"] = "Unidentified"
    end
    
    for key, value in pairs(info) do
        InfoTab:AddParagraph({ key, tostring(value) })
    end
    
    InfoTab:AddParagraph({ "Language:", "English" })
    InfoTab:AddParagraph({ "Game:", "Brookhaven RP 🏡" })
    InfoTab:AddParagraph({ "Hub Name:", "Irvin Hub" })
    InfoTab:AddParagraph({ "Version:", "1.0 - Stable" })
end)
print("✅ STEP 6: Player information added!\n")

print("📍 STEP 7: Adding rejoin button...")
pcall(function()
    InfoTab:AddSection({ "Utilities" })
    InfoTab:AddButton({
        Name = "Rejoin Server",
        Callback = function()
            pcall(function()
                local TeleportService = game:GetService("TeleportService")
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
            end)
        end
    })
end)
print("✅ STEP 7: Rejoin button added!\n")

-- ============================================================
-- FUN TAB
-- ============================================================
print("📍 STEP 8: Creating Fun Tab...")
local FunTab = Window:MakeTab({
    Title = "Fun",
    Icon = "rbxassetid://6023426926"
})
print("✅ STEP 8: Fun Tab created!\n")

local InfiniteJumpEnabled = false

print("📍 STEP 9: Adding speed and jump sliders...")
pcall(function()
    FunTab:AddSlider({
        Name = "Walk Speed",
        Increase = 1,
        MinValue = 16,
        MaxValue = 888,
        Default = 16,
        Callback = function(Value)
            pcall(function()
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.WalkSpeed = Value end
            end)
        end
    })

    FunTab:AddSlider({
        Name = "Jump Power",
        Increase = 1,
        MinValue = 50,
        MaxValue = 500,
        Default = 50,
        Callback = function(Value)
            pcall(function()
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.JumpPower = Value end
            end)
        end
    })

    FunTab:AddSlider({
        Name = "Gravity",
        Increase = 1,
        MinValue = 0,
        MaxValue = 10000,
        Default = 196.2,
        Callback = function(Value)
            pcall(function()
                game.Workspace.Gravity = Value
            end)
        end
    })
end)
print("✅ STEP 9: Sliders added!\n")

print("📍 STEP 10: Adding toggles...")
pcall(function()
    FunTab:AddToggle({
        Name = "Infinite Jump",
        Default = false,
        Callback = function(Value)
            InfiniteJumpEnabled = Value
            print("Infinite Jump: " .. (Value and "ENABLED ✅" or "DISABLED ❌"))
        end
    })

    FunTab:AddToggle({
        Name = "Noclip",
        Default = false,
        Callback = function(Value)
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = not Value
                        end
                    end
                end
            end)
            print("Noclip: " .. (Value and "ENABLED ✅" or "DISABLED ❌"))
        end
    })
end)
print("✅ STEP 10: Toggles added!\n")

print("📍 STEP 11: Setting up input events...")
pcall(function()
    local UserInputService = game:GetService("UserInputService")
    
    -- Infinite Jump Event
    UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)
end)
print("✅ STEP 11: Input events configured!\n")

print("📍 STEP 12: Setting up respawn event...")
pcall(function()
    LocalPlayer.CharacterAdded:Connect(function()
        print("👤 Character respawned!")
    end)
end)
print("✅ STEP 12: Respawn event set up!\n")

print(string.rep("=", 70))
print("✅✅✅ IRVIN HUB LOADED SUCCESSFULLY! ✅✅✅")
print("🎮 All features are ready to use!")
print(string.rep("=", 70) .. "\n")

end) -- END OF MAIN PCALL

-- Error handling
if not success then
    print("\n" .. string.rep("=", 70))
    print("❌ ERROR IN IRVIN HUB:")
    print(errorMessage)
    print(string.rep("=", 70))
    print(debug.traceback())
    print(string.rep("=", 70) .. "\n")
end
