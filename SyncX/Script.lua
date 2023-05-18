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
local T3 = Window:AddTab("Buy")

T3:AddLabel("WARNING! \n please turn off auto buy all hammer if you want to use auto equip hammer otherwise this will be a problem.")

T3:AddSwitch("Auto Buy All Hammer", function(bool)
   _G.Hammer = bool
   while wait() do
    if _G.Hammer then
    Castnumber = not Castnumber + 1
    BuyProp(Castnumber)
      else
    Castnumber = 0
      break
     end
   end
end)

T3:AddSwitch("Auto Equip All Hammer", function(bool)
   _G.Hammer_2 = bool
   while wait() do
    if _G.Hammer_2 then
    Castnumber = not Castnumber + 1
    EquipProp(Castnumber)
      else
    Castnumber = 0
      break
     end
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
