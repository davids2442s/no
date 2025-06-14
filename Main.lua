local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Gui",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Davids2442",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "Enum.KeyCode.RightControl", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
        --[[--
    KEY_A = 0x04,       // 'A' key
    KEY_B = 0x05,       // 'B' key
    KEY_C = 0x06,       // 'C' key
    // ... other alphanumeric keys
    KEY_ENTER = 0x28,   // Enter key
    KEY_ESC = 0x29,     // Escape key
    KEY_SPACE = 0x2C,   // Spacebar
    KEY_LEFT_CTRL = 0xE0,  // Left Control
    KEY_LEFT_SHIFT = 0xE1, // Left Shift
    KEY_LEFT_ALT = 0xE2,   // Left Alt
    KEY_LEFT_GUI = 0xE3,   // Left GUI (Windows/Command key)
    KEY_RIGHT_CTRL = 0xE4, // Right Control
    KEY_RIGHT_SHIFT = 0xE5, // Right Shift
    KEY_RIGHT_ALT = 0xE6,   // Right Alt (AltGr)
    KEY_RIGHT_GUI = 0xE7    // Right GUI (Windows/Command key)
    --]]--

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GuiMain11", -- Create a custom folder for your hub/game
      FileName = "Main"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://raw.githubusercontent.com/davids2442s/no/refs/heads/main/Key?token=GHSAT0AAAAAADFVFCIYF45XVRQPZFUOLW522CNV4WQ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
