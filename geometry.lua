-- geometry.lua

-- Function to create a point
function create_point(x, y, z)
    return { x = x, y = y, z = z }
end

-- Function to create a line
function create_line(point1, point2)
    return { p1 = point1, p2 = point2 }
end

-- Function to create a polygon
function create_polygon(points)
    return points
end

-- function to rotate an object around the Z-axis
function rotate_object(object, angle)
    local rotated_object = { vertices = {} }

    for i, vertex in ipairs(object.vertices) do
        -- rotation around x-axis
        local ry = vertex.y * cos(angle) - vertex.z * sin(angle)
        local rz = vertex.y * sin(angle) + vertex.z * cos(angle)

        -- rotation around y-axis
        local rx = vertex.x * cos(angle) - rz * sin(angle)
        rz = vertex.x * sin(angle) + rz * cos(angle)

        add(rotated_object.vertices, { x = rx, y = ry, z = rz })
    end

    return rotated_object
end