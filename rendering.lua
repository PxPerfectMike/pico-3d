-- rendering.lua

-- Function to render a 3D object
function render(object)
    -- Iterate over the vertices of the object
    for i, vertex in pairs(object.vertices) do
        -- Project the 3D vertex to 2D screen coordinates
        local screenX, screenY = project(vertex.x, vertex.y, vertex.z)

        -- Apply color and render the projected vertex on the screen
        color(15) -- changed color to white
        pset(screenX, screenY)
    end
end