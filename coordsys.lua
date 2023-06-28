-- coordsys.lua

-- Constants for the screen dimensions
screenWidth = 128
screenHeight = 128

-- Constants for the world dimensions
worldWidth = 64
worldHeight = 64
worldDepth = 64

-- Function to convert world coordinates to screen coordinates
function worldToScreen(x, y, z)
    local screenX = x / worldWidth * screenWidth
    local screenY = y / worldHeight * screenHeight

    return screenX, screenY
end