-- mtx7.tsz1 hub
-- Interface בלבד: abas, minimizar, fechar e arrastar

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "mtx7_tsz1_hub"
gui.ResetOnSpawn = false

pcall(function()
    gui.Parent = game:GetService("CoreGui")
end)

if not gui.Parent then
    gui.Parent = player:WaitForChild("PlayerGui")
end

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(650, 420)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 0, 50)
title.Position = UDim2.fromOffset(15, 0)
title.BackgroundTransparency = 1
title.Text = "mtx7.tsz1 hub"
title.TextColor3 = Color3.fromRGB(190, 120, 255)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -45, 0, 8)
close.BackgroundColor3 = Color3.fromRGB(45, 25, 50)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 15
close.Font = Enum.Font.GothamBold
close.BorderSizePixel = 0
close.Parent = main

Instance.new("UICorner", close).CornerRadius = UDim.new(0, 7)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(35, 35)
minimize.Position = UDim2.new(1, -85, 0, 8)
minimize.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
minimize.Text = "-"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.TextSize = 20
minimize.Font = Enum.Font.GothamBold
minimize.BorderSizePixel = 0
minimize.Parent = main

Instance.new("UICorner", minimize).CornerRadius = UDim.new(0, 7)

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, -65)
sidebar.Position = UDim2.fromOffset(10, 55)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 8)

local sideLayout = Instance.new("UIListLayout")
sideLayout.Padding = UDim.new(0, 5)
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideLayout.Parent = sidebar

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -180, 1, -65)
content.Position = UDim2.fromOffset(170, 55)
content.BackgroundTransparency = 1
content.Parent = main

local pages = {}

local function makeButton(parent, text)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(29, 29, 36)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.fromRGB(235, 235, 235)
    b.TextSize = 14
    b.Font = Enum.Font.Gotham
    b.Parent = parent

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)

    return b
end

local function makePage(name)
    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.Visible = false
    page.Parent = content

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.Parent = page

    pages[name] = page
    return page
end

local tabs = {
    "Home",
    "Main",
    "Automatically",
    "Sea Event",
    "Teleport",
    "Shop",
    "Misc",
    "Settings"
}

for _, name in ipairs(tabs) do
    local page = makePage(name)
    local button = makeButton(sidebar, name)

    button.MouseButton1Click:Connect(function()
        for pageName, otherPage in pairs(pages) do
            otherPage.Visible = pageName == name
        end
    end)
end

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -20, 0, 100)
welcome.BackgroundTransparency = 1
welcome.Text = "Bem-vindo ao mtx7.tsz1 hub"
welcome.TextColor3 = Color3.fromRGB(230, 230, 230)
welcome.TextSize = 23
welcome.Font = Enum.Font.GothamBold
welcome.TextXAlignment = Enum.TextXAlignment.Left
welcome.Parent = pages.Home

local description = Instance.new("TextLabel")
description.Size = UDim2.new(1, -20, 0, 70)
description.BackgroundTransparency = 1
description.Text = "Interface principal do hub."
description.TextColor3 = Color3.fromRGB(160, 160, 160)
description.TextSize = 14
description.Font = Enum.Font.Gotham
description.TextXAlignment = Enum.TextXAlignment.Left
description.Parent = pages.Home

for _, name in ipairs({
    "Main",
    "Automatically",
    "Sea Event",
    "Teleport",
    "Shop",
    "Misc",
    "Settings"
}) do
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 55)
    label.BackgroundTransparency = 1
    label.Text = name .. " — pronto para adicionar funções"
    label.TextColor3 = Color3.fromRGB(160, 160, 160)
    label.TextSize = 15
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = pages[name]
end

pages.Home.Visible = true

local minimized = false

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    sidebar.Visible = not minimized
    content.Visible = not minimized

    if minimized then
        main.Size = UDim2.fromOffset(250, 55)
    else
        main.Size = UDim2.fromOffset(650, 420)
    end
end)

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not dragging then return end

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false
    end
end)
