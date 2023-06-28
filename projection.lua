-- projection.lua

-- Function to project 3D world coordinates to 2D screen coordinates
function project(x, y, z)
    -- Apply perspective projection
    local screenX = screenWidth / 2 + x / (z / 64 + 1) * screenWidth
    local screenY = screenHeight / 2 + y / (z / 64 + 1) * screenHeight

    -- Print out the projected coordinates for debugging
    print("Screen Coordinates: (" .. screenX .. ", " .. screenY .. ")")

    return screenX, screenY
end