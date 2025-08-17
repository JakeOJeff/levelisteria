-- Importing Libraries
local SceneryInit = require("src.libs.scenery")
utils = require("src.libs.utils")

baseW = 720
baseH = 1280

wW = love.graphics.getWidth()
wH = love.graphics.getHeight()
scale = math.max(wW / baseW, wH / baseH)

colors = {
    "#143109",
    "#AAAE7F",
    "#DOD6B3",
    "#F7F7F7",
    "#EFEFEF"
}

-- Importing components
bottomnav = require("src.components.bottomnav")


local scenery = SceneryInit(
    { path = "src.states.home", key = "home", default = true },
    { path = "src.states.profile", key = "profile" }
)

scenery:hook(love)
