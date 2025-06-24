local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/davids2442s/no/refs/heads/main/Rayfield-source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Davids2442",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = rayfieldMain, -- Create a custom folder for your hub/game
      FileName = "configMain"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = True, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"keys"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local Tab = Window:CreateTab("Other", 4483362458) -- Title, Image

    local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Button worked...")
   Rayfield:Notify({
       Title = "Notification Title",
       Content = "Notification Content",
       Duration = 6.5,
       Image = "rewind",
       
   })
   end,
})
    local Button = Tab:CreateButton({
   Name = "Destory Script",
   Callback = function()
   -- The function that takes place when the button is pressed
   Rayfield:Notify({
       Title = "Script is destoried",
       Content = "Warning, you have to execute script again.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   wait("4")
   print("Script Destroied")
   wait("0.2")
   Rayfield:Destroy()
   end,
})
    local Button = Tab:CreateButton({
   Name = "Grab Player Position",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Player Position activated.")
   Rayfield:Notify({
       Title = "Copied in Clipboard",
       Content = "Notification Content",
       Duration = 6.5,
       Image = "rewind",
       
   })
   -- Get player position on script start
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local pos = hrp.Position
    local posStr = string.format("Vector3.new(%.2f, %.2f, %.2f)", pos.X, pos.Y, pos.Z)
    
    print("Player Position:", posStr)
    
    -- KRNL clipboard
    if setclipboard then
    	setclipboard(posStr)
    	print("📋 Copied to clipboard using setclipboard")
    else
    	-- Fallback to file
    	writefile("player_position.txt", posStr)
    	print("💾 Saved to player_position.txt (clipboard not available)")
    end
    
      end,
    })
    --// 📝 Input for teleport position
local Input = Tab:CreateInput({
    Name = "Teleport To Vector3",
    CurrentValue = "",
    PlaceholderText = "Paste Vector3.new(x, y, z)",
    RemoveTextAfterFocusLost = false,
    -- Flag = "TeleportInput",
    Callback = function(Text)
        -- Try to extract numbers from input
        local x, y, z = Text:match("Vector3%.new%(([-%d%.]+),%s*([-%d%.]+),%s*([-%d%.]+)%)")
        
        if x and y and z then
            local targetPosition = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            
            -- Smooth teleport using TweenService
            local TweenService = game:GetService("TweenService")
            local goal = {CFrame = CFrame.new(targetPosition)}
            local tweenInfo = TweenInfo.new(
                1.5, -- Time in seconds (adjust as needed)
                Enum.EasingStyle.Quad, -- Smooth easing style
                Enum.EasingDirection.Out -- Ease out at the end
            )
            
            local tween = TweenService:Create(hrp, tweenInfo, goal)
            tween:Play()
            
            Rayfield:Notify({
                Title = "Teleport Started",
                Content = "Smoothly teleporting to: " .. tostring(targetPosition),
                Duration = 4,
                Image = "check-circle",
            })
        else
            Rayfield:Notify({
                Title = "Invalid Input",
                Content = "Format must be Vector3.new(x, y, z)",
                Duration = 4,
                Image = "x-circle",
            })
        end
    end,
})

local TabTp = Window:CreateTab("Teleports", 4483362458) -- Title, Image

local StoryParagraph = TabTp:CreateParagraph({
    Title = "Checkpoint Teleport",
    Content = "It also works when you are in vehicle! 🤓, make sure your vehicle is strong, anytime by bug your car can be destory."
}) -- text for tapTp here
    local Button = TabTp:CreateButton({
   Name = "Spawn",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-15.84, 431.20, -150.43)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
local StoryParagraph = TabTp:CreateParagraph({
    Title = "Chapter 1",
    Content = "Main map..."
})
    
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #1",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-9.21, 438.85, -1199.79)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #2",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-1017.61, 434.13, -1193.66)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #3",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-2116.63, 425.27, -2098.83)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #4",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-530.02, 433.92, -3321.92)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #5",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-308.59, 436.28, -5746.14)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #6",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-312.01, 433.27, -7302.47)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
local StoryParagraph = TabTp:CreateParagraph({
    Title = "Chapter 2",
    Content = "New update map"
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #1",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-1745.89, 546.70, -9107.78)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
    local Button = TabTp:CreateButton({
   Name = "Checkpoint #2",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Teleport Executed.")
   Rayfield:Notify({
       Title = "Telepored",
       Content = "Teleport sucesfully worked.",
       Duration = 6.5,
       Image = "rewind",
       
   })
   local TweenService = game:GetService("TweenService")
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    
    -- Target Position (your example)
    local targetPos = Vector3.new(-988.24, 643.05, -9888.91)
    
    -- Tween to CFrame instead of Position
    local goal = {CFrame = CFrame.new(targetPos)}
    local tweenInfo = TweenInfo.new(
      2, -- time (seconds)
      Enum.EasingStyle.Sine,
      Enum.EasingDirection.Out
    )
    
    local tween = TweenService:Create(hrp, tweenInfo, goal)
    tween:Play()
    
   end,
})
local TabGame = Window:CreateTab("Game", 4483362458) -- Title, Image
local StoryParagraph = TabGame:CreateParagraph({
    Title = "Send game signals",
    Content = "Virtual signals, trick game. Buggy."
})
    local Button = TabGame:CreateButton({
   Name = "Deploy Vehicle",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Deploued vehicle")
   Rayfield:Notify({
       Title = "Deployed",
       Content = "Vehicle has have been Deployed",
       Duration = 6.5,
       Image = "rewind",
   })
   game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("AssembleCar"):InvokeServer()
    wait("1")
    local args = {
	1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("DeployCar"):FireServer(unpack(args))

   end,
})
    local Button = TabGame:CreateButton({
   Name = "Return home",
   Callback = function()
   -- The function that takes place when the button is pressed
   print("Returned")
   Rayfield:Notify({
       Title = "Returned home",
       Content = "Returned back",
       Duration = 6.5,
       Image = "rewind",
       
   })
   game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("ReturnHome"):FireServer()

   end,
})
local TabFarm = Window:CreateTab("Auto Farm", 4483362458) -- Title, Image

local Toggle = TabFarm:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            -- Toggle ON - Start the loops
            RunLoop = true
            
            -- [1] BACKGROUND: Delete InvisibleWalls every 5 sec (NEW)
            task.spawn(function()
                while RunLoop do
                    if workspace:FindFirstChild("InvisibleWalls") then
                        workspace.InvisibleWalls:Destroy()
                    end
                    task.wait(5)
                end
            end)
            
            -- [2] YOUR ORIGINAL DELIVERY SCRIPT (UNTOUCHED)
            task.spawn(function()
                while RunLoop do
                    local player = game:GetService("Players").LocalPlayer
                    local char = player.Character or player.CharacterAdded:Wait()

                    -- Your original safety check
                    if not char:FindFirstChild("IsAutoDelivering") then
                        local boolValue = Instance.new("BoolValue")
                        boolValue.Name = "IsAutoDelivering"
                        boolValue.Value = false
                        boolValue.Parent = char
                    end

                    if char.IsAutoDelivering.Value then
                        Rayfield:Notify({
                            Title = "Multiple execution detect",
                            Content = "You are saved from bugs. Auto-delivery already in progress!",
                            Duration = 6.5,
                            Image = "rewind" -- YOUR ORIGINAL ICON
                        })
                        task.wait(5)
                        continue
                    end

                    char.IsAutoDelivering.Value = true

                    -- Your original vehicle spawn/delivery logic
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("AssembleCar"):InvokeServer()
                    task.wait(0.5)
                    
                    local args = {1}
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("DeployCar"):FireServer(unpack(args))
                    task.wait(1)

                    -- Your original movements
                    local TweenService = game:GetService("TweenService")
                    local hrp = char:WaitForChild("HumanoidRootPart")

                    local movements = {
                        {pos = Vector3.new(-21.76, 1050.81, -93.71), duration = 2},
                        {pos = Vector3.new(-351.97, 1166.81, -7135.21), duration = 8},
                        {pos = Vector3.new(-351.19, 528.52, -7241.11), duration = 4},
                        {pos = Vector3.new(-313.67, 422.05, -7352.44), duration = 8}
                    }

                    for _, move in ipairs(movements) do
                        local tween = TweenService:Create(hrp, TweenInfo.new(move.duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(move.pos)})
                        tween:Play()
                        task.wait(move.duration - 0.1)
                    end

                    -- Your original deliveries
                    for i = 1, 3 do
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("DeliveryHandlerRemotes"):WaitForChild("DeliverItems"):InvokeServer("6")
                        task.wait(i == 1 and 1 or 0.5)
                    end

                    -- Your original return home
                    game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("DeployHandler"):WaitForChild("ReturnHome"):FireServer()
                    task.wait(1)
                    
                    Rayfield:Notify({
                        Title = "Auto-delivery, success",
                        Content = "Runing loop, if its enable.",
                        Duration = 6.5,
                        Image = "rewind" -- YOUR ORIGINAL ICON
                    })
                    
                    task.wait(5)
                    char.IsAutoDelivering.Value = false
                end
            end)
        else
            -- Toggle OFF - Stop all loops
            RunLoop = false
        end
    end
})
    


Rayfield:LoadConfiguration()
