```lua
-- SonicHub | New Loader
-- UI: Glass / Pink / Rounded

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "SonicHubMenu"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(360, 220)
main.Position = UDim2.new(0.5, -180, 0.5, -110)
main.BackgroundColor3 = Color3.fromRGB(22, 20, 29)
main.BackgroundTransparency = 0.08
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 105, 180)
stroke.Transparency = 0.25
stroke.Thickness = 1.2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 42)
title.Position = UDim2.fromOffset(16, 5)
title.BackgroundTransparency = 1
title.Text = "SonicHub"
title.TextColor3 = Color3.fromRGB(255, 145, 205)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -32, 0, 22)
subtitle.Position = UDim2.fromOffset(16, 44)
subtitle.BackgroundTransparency = 1
subtitle.Text = "NEW LOADER"
subtitle.TextColor3 = Color3.fromRGB(175, 165, 190)
subtitle.TextSize = 11
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

local function createButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -32, 0, 42)
    button.Position = UDim2.fromOffset(16, y)
    button.BackgroundColor3 = Color3.fromRGB(43, 34, 50)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 240, 250)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = button

    local s = Instance.new("UIStroke")
    s.Color = Color3.fromRGB(255, 105, 180)
    s.Transparency = 0.7
    s.Parent = button

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(75, 43, 69)
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(43, 34, 50)
        }):Play()
    end)

    return button
end

local copyButton = createButton("Bro Copy", 78)
local loaderButton = createButton("New Loader", 128)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -32, 0, 22)
status.Position = UDim2.fromOffset(16, 178)
status.BackgroundTransparency = 1
status.Text = "SonicHub • Ready"
status.TextColor3 = Color3.fromRGB(180, 170, 190)
status.TextSize = 11
status.Font = Enum.Font.Gotham
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = main

-- Drag window
local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

copyButton.Activated:Connect(function()
    status.Text = "Copy the loader from the source"
    if setclipboard then
        setclipboard(
            'loadstring(game:HttpGet("https://cdn.luaprotect.dev/u/2fd17e/SonicHubLoader"))()'
        )
        status.Text = "Loader copied!"
    end
end)

loaderButton.Activated:Connect(function()
    status.Text = "Loader URL ready"
    -- Add your authorized loader launch action here.
end)
```
