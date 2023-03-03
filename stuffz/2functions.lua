function angle_triangle(x1, y1, z1, x2, y2, z2, x3, y3, z3)
    local dot_product = (x2 - x1) * (x3 - x1) + (y2 - y1) * (y3 - y1) + (z2 - z1) * (z3 - z1)
    local magnitude_ab = math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
    local magnitude_ac = math.sqrt((x3 - x1)^2 + (y3 - y1)^2 + (z3 - z1)^2)
    local cosine = dot_product / (magnitude_ab * magnitude_ac)
    local angle_a = math.deg(math.acos(cosine))
    
    dot_product = (x1 - x2) * (x3 - x2) + (y1 - y2) * (y3 - y2) + (z1 - z2) * (z3 - z2)
    magnitude_ab = math.sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2)
    local magnitude_bc = math.sqrt((x3 - x2)^2 + (y3 - y2)^2 + (z3 - z2)^2)
    cosine = dot_product / (magnitude_ab * magnitude_bc)
    local angle_b = math.deg(math.acos(cosine))
    
    dot_product = (x1 - x3) * (x2 - x3) + (y1 - y3) * (y2 - y3) + (z1 - z3) * (z2 - z3)
    magnitude_ac = math.sqrt((x1 - x3)^2 + (y1 - y3)^2 + (z1 - z3)^2)
    magnitude_bc = math.sqrt((x2 - x3)^2 + (y2 - y3)^2 + (z2 - z3)^2)
    cosine = dot_product / (magnitude_ac * magnitude_bc)
    local angle_c = math.deg(math.acos(cosine))
    
    return angle_a, angle_b, angle_c
end

function calculateAngleToGoal(playerPosition, ballPosition, ballVelocity, goalPosition, goalWidth)
    -- Calculate the intersection point of the ball with the goal
    local intersectionPoint = aimAssist(ballPosition, ballVelocity, goalPosition, goalWidth)

    -- Calculate the angle between the intersection point and the player's position
    local dx = intersectionPoint.x - playerPosition.x
    local dy = intersectionPoint.y - playerPosition.y
    local dz = intersectionPoint.z - playerPosition.z
    local distance = math.sqrt(dx * dx + dy * dy + dz * dz)
    local pitch = math.deg(math.asin(dy / distance))
    local yaw = math.deg(math.atan2(dz, dx))

    return pitch, yaw
end

function aimAssist(ballPos, goalPos)
    local pitch = math.atan2(goalPos.y - ballPos.y, 
                             math.sqrt((goalPos.x - ballPos.x) ^ 2 + (goalPos.z - ballPos.z) ^ 2))
    local yaw = math.atan2(goalPos.x - ballPos.x, goalPos.z - ballPos.z)
    return math.deg(pitch), math.deg(yaw)
end