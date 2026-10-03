-- mtx7.tsz1 hub
-- Interface própria • sem sistema de key

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "mtx7tsz1Hub"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(650, 420)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 45)
title.Position = UDim2.fromOffset(15, 8)
title.BackgroundTransparency = 1
title.Text = "mtx7.tsz1 hub"
title.TextColor3 = Color3.fromRGB(190, 120, 255)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 155, 1, -65)
sidebar.Position = UDim2.fromOffset(10, 55)
sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local sideCorner = Instance.new("UICorner")
sideCorner.CornerRadius = UDim.new(0, 8)
sideCorner.Parent = sidebar

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -180, 1, -65)
content.Position = UDim2.fromOffset(170, 55)
content.BackgroundTransparency = 1
content.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = sidebar

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

local pages = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.fromScale(1, 1)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 4
    page.Visible = false
    page.Parent = content

    local pageLayout = Instance.new("UIListLayout")
    pageLayout.Padding = UDim.new(0, 8)
    pageLayout.Parent = page

    pages[name] = page
    return page
end

local function createButton(parent, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 38)
    button.BackgroundColor3 = Color3.fromRGB(28, 28, 34)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.fromRGB(235, 235, 235)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = parent

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = button

    return button
end

for _, name in ipairs(tabs) do
    createPage(name)

    local tab = createButton(sidebar, name)

    tab.MouseButton1Click:Connect(function()
        for pageName, page in pairs(pages) do
            page.Visible = pageName == name
        end
    end)
end

-- Página inicial
local home = pages.Home

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -20, 0, 60)
welcome.BackgroundTransparency = 1
welcome.Text = "Bem-vindo ao mtx7.tsz1 hub"
welcome.TextColor3 = Color3.fromRGB(220, 220, 220)
welcome.TextSize = 20
welcome.Font = Enum.Font.GothamBold
welcome.Parent = home

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 50)
info.BackgroundTransparency = 1
info.Text = "Interface própria • sem key"
info.TextColor3 = Color3.fromRGB(150, 150, 150)
info.TextSize = 14
info.Font = Enum.Font.Gotham
info.Parent = home

-- Exemplos de controles visuais
for _, name in ipairs({
    "Example Toggle",
    "Example Option",
    "Example Setting"
}) do
    createButton(pages.Main, name)
end

pages.Home.Visible = true
