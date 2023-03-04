-- aimbot (lazy and messy code, very unefficient)

if dx9User.Team == "Blue" then -- if blue team
    for i, v in pairs(dx9.GetChildren(redGoalNet)) do
        if dx9.GetType(v) == "MeshPart" then
            local redGoal3DPos = dx9.GetPosition(v)
            local player3DPos = dx9.get_localplayer().Position
            local redGoal2DPos = dx9.WorldToScreen({redGoal3DPos.x, redGoal3DPos.y, redGoal3DPos.z})

            local angle_a, angle_b, angle_c = angle_triangle(player3DPos.x, player3DPos.y, player3DPos.z, redPost.right.x, redPost.right.y, redPost.right.z, redPost.left.x, redPost.left.y, redPost.left.z)
            local pitch, yaw = aimAssist(dx9.GetPosition(ballIntents), redGoal3DPos) -- pitch/yaw offset

            if angle_c > 0.5 and angle_c < 3.2 and player3DPos.z > GoalMiddlePost and player3DPos.z < pitchEnd1 then
                dx9.FirstPersonAim({redGoal2DPos.x + 130, redGoal2DPos.y - 20}, 5, 10) -- if on left side of goal, aim at right side
            elseif angle_c > 0.5 and angle_c < 3.2 and player3DPos.z < GoalMiddlePost and player3DPos.z > pitchEnd2 then
                dx9.FirstPersonAim({redGoal2DPos.x - 130, redGoal2DPos.y - 20}, 5, 10) -- vice versa
            end
        end
    end
elseif dx9User.Team == "Red" then -- if red team
    for i, v in pairs(dx9.GetChildren(blueGoalNet)) do
        if dx9.GetType(v) == "MeshPart" then
            local blueGoal3DPos = dx9.GetPosition(v)
            local player3DPos = dx9.get_localplayer().Position
            local blueGoal2DPos = dx9.WorldToScreen({blueGoal3DPos.x, blueGoal3DPos.y, blueGoal3DPos.z})

            local angle_a, angle_b, angle_c = angle_triangle(player3DPos.x, player3DPos.y, player3DPos.z, bluePost.right.x, bluePost.right.y, bluePost.right.z, bluePost.left.x, bluePost.left.y, bluePost.left.z)
            local pitch, yaw = aimAssist(dx9.GetPosition(ballIntents), blueGoal3DPos) -- pitch/yaw offset
            
            if angle_c > 0.5 and angle_c < 3.2 and player3DPos.z < GoalMiddlePost and player3DPos.z > pitchEnd2 then
                dx9.FirstPersonAim({blueGoal2DPos.x + yaw, blueGoal2DPos.y + pitch}, 5, 10) -- if on left side of goal, aim at right side
            elseif angle_c > 0.5 and angle_c < 3.2 and player3DPos.z > GoalMiddlePost and player3DPos.z < pitchEnd1 then
                dx9.FirstPersonAim({blueGoal2DPos.x  - yaw, blueGoal2DPos.y - pitch}, 5, 10) -- vice versa
            end
        end
    end
end