pico-8 cartridge // http://www.pico-8.com
version 38
__lua__

#include coordsys.lua
#include projection.lua
#include rendering.lua
#include geometry.lua
#include meshes.lua
#include optimizations.lua

function quicksort(t, compare, a, b)
    a = a or 1
    b = b or #t
    if a >= b then return end
    local pivot = t[b]
    local i = a
    for j = a, b - 1 do
        if compare(t[j], pivot) then
            t[i], t[j] = t[j], t[i]
            i = i + 1
        end
    end
    t[i], t[b] = t[b], t[i]
    quicksort(t, compare, a, i - 1)
    quicksort(t, compare, i + 1, b)
end

-- Initialization function
function _init()
    cube = {
        vertices = {
            create_point(-16, -16, 16),
            create_point(-16, 16, 16),
            create_point(16, 16, 16),
            create_point(16, -16, 16),
            create_point(-16, -16, -16),
            create_point(-16, 16, -16),
            create_point(16, 16, -16),
            create_point(16, -16, -16)
        }
    }

    -- Set up camera position and angle
    camera_position = create_point(0, 0, -50)
    camera_angle = 0
end

-- Update function
function _update()
    -- Rotate the cube
    cube = rotate_object(cube, 0.01)

    -- Change the camera angle
    camera_angle = camera_angle + 0.01

    -- Sort cube vertices by z for proper rendering
    if cube.vertices then
        quicksort(cube.vertices, function(a, b) return a.z < b.z end)
    else
        print("cube.vertices is nil")
    end

    -- Print cube's vertex positions to the console
    for i, vertex in pairs(cube.vertices) do
        print("Vertex " .. i .. ": (" .. vertex.x .. ", " .. vertex.y .. ", " .. vertex.z .. ")")
    end
end

-- Render function
function _draw()
    -- Clear the screen
    cls()

    color(3)

    print("Rendering cube...")

    -- Render the cube
    render(cube)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
