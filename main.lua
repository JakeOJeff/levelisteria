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
    "#D0D6B3",
    "#F7F7F7",
    "#EFEFEF"
}

fontName = "assets/fonts/chivo-black.ttf"

fontH = love.graphics.newFont(fontName, 64 * scale)

-- Importing components
bottomnav = require("src.components.bottomnav")


local scenery = SceneryInit(
    { path = "src.states.home", key = "home", default = true },
    { path = "src.states.balance", key = "balance" },
    { path = "src.states.profile", key = "profile" }
)

scenery:hook(love)

function love.resize(w, h)
    wW = w
    wH = h
    scale = math.max(wW / baseW, wH / baseH)
end
