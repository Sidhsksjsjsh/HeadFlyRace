local library = loadstring(game:HttpGet("https://pastebin.com/raw/Uub92rmN"))()


local Window = library:AddWindow("Sync X - Cheating Tool",
    {
        main_color = Color3.fromRGB(170, 0, 0),
        min_size = Vector2.new(373, 433),
        toggle_key = Enum.KeyCode.RightShift,
    })
   
local Rune = {}

for _,RuneID in pairs(game:GetService("Workspace").Rune:GetChildren()) do
    table.insert(Rune, RuneID.Name)
end

local Castnumber = 0

function BuyProp(number)
  if number > 9 then
     game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("hammer0" .. Castnumber)
  end
  if number < 10 then
     game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("hammer00" .. Castnumber)
  end
end

function EquipProp(number)
  if number > 9 then
     game:GetService("ReplicatedStorage").Events.Player.EquipProp:FireServer("hammer0" .. Castnumber)
  end
  if number < 10 then
     game:GetService("ReplicatedStorage").Events.Player.EquipProp:FireServer("hammer00" .. Castnumber)
  end
end

local T1 = Window:AddTab("Farm")
local T2 = Window:AddTab("Egg")
local T3 = Window:AddTab("Invade Mode")

T3:AddLabel("only useful for invade mode.")

T3:AddSwitch("Auto Shoot", function(bool)
   _G.InvadeShoot = bool
   while wait() do
    if _G.InvadeShoot == false then break end
    game:GetService("ReplicatedStorage").Events.Copy.CopyKick:FireServer("Yellow")
   end
end)

T3:AddSwitch("Auto Teleport to Invade Mode", function(bool)
   _G.TpInvade = bool
   while wait() do
    if _G.TpInvade == false then break end
    game:GetService("ReplicatedStorage").Events.Copy.CopyTel:FireServer()
   end
end)

local DrawType = T2:AddDropdown("Select Draw", function(object)
      _G.Draw = object
end)

DrawType:Add("draw001")
DrawType:Add("draw002")
DrawType:Add("draw003")
DrawType:Add("draw004")
DrawType:Add("draw005")
DrawType:Add("draw006")
DrawType:Add("draw007")
DrawType:Add("draw008")
DrawType:Add("draw009")
DrawType:Add("draw010")
DrawType:Add("draw011")
DrawType:Add("draw012")
DrawType:Add("draw013") -- MAX

T2:AddSwitch("Auto Draw", function(bool)
    _G.Egg = bool
    while wait() do
      if _G.Egg == false then break end
      game:GetService("ReplicatedStorage").Events.Player.Draw.DrawRequest:FireServer(_G.Draw,3)
    end
end)

T2:AddSwitch("Auto Equip Best", function(bool)
    _G.Best = bool
    while wait() do
      if _G.Best == false then break end
      game:GetService("ReplicatedStorage").Events.Pet.EquipBest:FireServer()
    end
end)

T1:AddSwitch("Auto Spam head", function(bool)
    _G.Win = bool
    while wait() do
      if _G.Win == false then break end
      game:GetService("ReplicatedStorage").Events.Match.OneKick:FireServer()
    end
end)

T1:AddSwitch("Auto Win (enable spam head first)", function(bool)
    _G.HeadSpam = bool
        while wait() do
            if _G.HeadSpam == false then break end
            game:GetService("ReplicatedStorage").Events.Player.KillMatch:FireServer()
      end
end)
T1:AddSwitch("Auto Rebirth", function(bool)
    _G.Rebirth = bool
    while wait() do
      if _G.Rebirth == false then break end
      game:GetService("ReplicatedStorage").Events.Player.RebirthEvent:FireServer()
    end
end)

T1:AddSwitch("Auto Collect Rune", function(bool)
    _G.Runes = bool
    while wait() do
      if _G.Runes == false then break end
      for _,RuneID in pairs(game:GetService("Workspace").Rune:GetChildren()) do
          table.insert(Rune, RuneID.Name)
      end
      
      game:GetService("ReplicatedStorage").Events.Player.AddStrong:FireServer(Rune[math.random(1, #Rune)])
    end
end)

T1:AddSwitch("Auto Spawn Rune", function(bool)
        _G.SpawnRunes = bool
        while wait() do
            if _G.SpawnRunes == false then break end
            game:GetService("ReplicatedStorage").Events.Match.RuneBorn:FireServer()
    end
end)
