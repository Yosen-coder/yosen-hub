if game:IsLoaded() ~= true then game.Loaded:Wait() end
task.wait(1)

local function execute()
pcall(function()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "frizzks hub", HidePremium = false, SaveConfig = true, ConfigFolder = "frizzks_hub"})

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local FarmTab = Window:MakeTab({Name = "Farming", Icon = "rbxassetid://4483345998", PremiumOnly = false})
    FarmTab:AddToggle({Name = "Auto Farm", Default = false, Callback = function(Value)
        getgenv().frizzks_AutoFarm = Value
        if Value then
            task.spawn(function()
                while getgenv().frizzks_AutoFarm do
                    pcall(function()
                        local c = LocalPlayer.Character
                        local h = c and c:FindFirstChild("HumanoidRootPart")
                        if h then
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name ~= LocalPlayer.Name then
                                    h.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                                    task.wait(0.1)
                                    local tl = c:FindFirstChildOfClass("Tool")
                                    if tl then tl:Activate() end
                                    break
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end
    end})
end)
end

local function checkexecute()
return true 
end

repeat execute(); task.wait(10) until checkexecute() == true
