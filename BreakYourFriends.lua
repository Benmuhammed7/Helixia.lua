--script is made by wreston.jr 
-- discord HelixiaHub

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local args = {
    9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
}

local Remote = ReplicatedStorage
    :WaitForChild("Remotes")
    :WaitForChild("FinishedRagdoll")

local gui = Instance.new("ScreenGui")
gui.Name = "infmoneygui"
gui.Parent = player.PlayerGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromOffset(220, 120)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "by wreston.jr"
title.TextColor3 = Color3.fromRGB(200,200,200)
title.Font = Enum.Font.GothamBold
title.TextSize = 14

local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.fromOffset(160, 45)
toggle.Position = UDim2.fromOffset(30, 55)
toggle.Text = "OFF"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 18
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
toggle.BorderSizePixel = 0

Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 12)

local enabled = false
local firing = false

task.spawn(function()
    while true do
        if firing then
            pcall(function()
                Remote:FireServer(unpack(args))
            end)
        end
        task.wait(0.15)
    end
end)

local function setState(state)
    enabled = state
    firing = state

    local goal = {}
    if state then
        toggle.Text = "ON"
        goal.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    else
        toggle.Text = "OFF"
        goal.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    end

    TweenService:Create(
        toggle,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        goal
    ):Play()
end

toggle.MouseButton1Click:Connect(function()
    setState(not enabled)
end)
