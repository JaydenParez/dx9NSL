for i, v in pairs(dx9.GetChildren(ball)) do
    if dx9.GetName(v) == "HITBOX_BALL" then
        local player3DPos = dx9.get_localplayer().Position
        local player2DPos = dx9.WorldToScreen({player3DPos.x, player3DPos.y, player3DPos.z})
        local ball3DPos = dx9.GetPosition(v)
        local ball2DPos = dx9.WorldToScreen({ball3DPos.x, ball3DPos.y, ball3DPos.z})

        local fieldFloor = dx9.WorldToScreen({455, 14, 873})

        local fieldFloor = dx9.WorldToScreen({455, 14, 873})

        local ballCframe = dx9.GetCFrame(v)
        local velocity = dx9.GetVelocity(v)
        local Euler = dx9.MatrixToEulers(ballCframe)

        local airResistance = 0.6

        dx9.DrawLine({player2DPos.x, player2DPos.y}, {ball2DPos.x, ball2DPos.y}, {espColour.R, espColour.G, espColour.B})
        if velocity.x ~= 0 and velocity.z ~= 0 then
            dx9.Box3d(
                box_matrix, 
                {
                    ball3DPos.x + (velocity.x * airResistance),
                    10.75,
                    ball3DPos.z + (velocity.z * airResistance)
                }, 
                {0, 0, 0},
                {2, 0.5, 2}, -- size 0.5
                {espColour.R, espColour.G, espColour.B}
            )
        else
            dx9.Box3d(
                box_matrix, 
                {
                    ball3DPos.x,
                    10.75,
                    ball3DPos.z
                }, 
                {0, 0, 0},
                {2, 0.5, 2}, -- size 0.5
                {espColour.R, espColour.G, espColour.B}
            )
        end

--        local slideAbleX = math.abs(player3DPos.x - ball3DPos.x) * 1
--        local slideAbleZ = math.abs(player3DPos.z - ball3DPos.z) * 1
--        if slideAbleX < 70 and slideAbleZ < 70 then
--            if(dx9.GetKey() == "[F]") then 
--                
--                dx9.FirstPersonAim({ball2DPos.x, dx9.GetMouse().y}, 1, 1)
--            end
--        end
    end
end

dx9.Box3d(
        box_matrix, 
        {
            462.5,
            10.75,
            -875
        }, 
        {0, 0, 0},
        {49.5, 0.1, 250}, -- size 0.5
        {0, 1, 0}
)