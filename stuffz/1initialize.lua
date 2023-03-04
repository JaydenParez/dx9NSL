-- need to make these more automatic, too many hardcoded vectors.

local dx9User = {
    Team = nil
}
local espColour = {
    R = nil,
    G = nil,
    B = nil
}

local game = dx9.GetDatamodel()
local ws = dx9.FindFirstChildOfClass(game, "Workspace")
local objects = dx9.FindFirstDescendant(game, "Objects")
local map = dx9.FindFirstDescendant(game, "Map")

local Players = dx9.FindFirstChildOfClass(game, "Players")
local localPlayerDir = dx9.FindFirstChild(Players, dx9.get_localplayer().Info.Name)
local teamValue = dx9.FindFirstDescendant(localPlayerDir, 'Team')

dx9User.Team = dx9.GetStringValue(teamValue)
if dx9User.Team == "Blue" then
    espColour.R = 0
    espColour.G = 0
    espColour.B = 255
elseif dx9User.Team == "Red" then
    espColour.R = 255
    espColour.G = 0
    espColour.B = 0
end

local redGoal = dx9.FindFirstChild(map, "RedGoal")
local blueGoal = dx9.FindFirstChild(map, "BlueGoal")
local redGoalNet = dx9.FindFirstChild(redGoal, "NET")
local blueGoalNet = dx9.FindFirstChild(blueGoal, "NET")

local balls = dx9.FindFirstChild(objects, "Balls")

local redGoalLeftPost = -850
local redGoalRightPost = -900
local blueGoalLeftPost = -900
local blueGoalRightPost = -60
local GoalMiddlePost = -875

-- need to make these vectors retrieve automatically

local bluePost = {
    left = {
        x = 758,
        y = 15,
        z = 900
    },
    right = {
        x = 758,
        y = 15,
        z = 848
    }

}
local redPost = {
    left = {
        x = 168,
        y = 15,
        z = 848
    },
    right = {
        x = 168,
        y = 15,
        z = 900
    }

}

local pitchEnd1 = -630
local pitchEnd2 = -1120

local redShootPoint = 362
local blueShootPoint = 560

local ballInstance = dx9.FindFirstChild(objects, "Balls")
local ball = dx9.FindFirstChild(ballInstance, "PLAIN_BALL")
local ballIntents = dx9.FindFirstChild(ball, "HITBOX_BALL")

local physicalMapParts = dx9.FindFirstChild(map, "Parts")
local field = dx9.FindFirstChild(physicalMapParts, "Field")
local field3DPos = dx9.GetPosition(field)
local field2DPos = dx9.WorldToScreen({field3DPos.x, field3DPos.y, field3DPos.z})

local box_matrix = { 
    1,1,1,-1,1,1,
    -1,1,1,-1,-1,1,
    1,1,1,1,-1,1,
    1,-1,1,-1,-1,1,
    1,1,-1,1,1,1,
    1,- 1,-1,1,-1,1,
    1,1,-1,1,-1,-1,
    1,1,-1,-1,1,-1,
    -1,-1,-1,-1,1,-1,
    1,-1,-1,-1,-1,-1,
    -1,-1,-1,-1,-1,1,
    -1,1,-1,-1,1,1,
}