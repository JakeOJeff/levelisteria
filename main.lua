love.graphics.setDefaultFilter("linear", "linear", 1)
-- Importing Libraries
local SceneryInit = require("src.libs.scenery")
utils = require("src.libs.utils")
require "src.libs.gradient"

baseW = 720
baseH = 1280

wW = love.graphics.getWidth()
wH = love.graphics.getHeight()
scale = math.max(wW / baseW, wH / baseH)

-- colors = {
--     "#143109",
--     "#AAAE7F",
--     "#D0D6B3",
--     "#F7F7F7",
--     "#EFEFEF"
-- }
colors = {
    "#111827",
    "#2b3b5c",
    "#3c5280",
    "#FFFFFF",
    "#e0e0e0"
}


fontName = "assets/fonts/chivo"


fontS = love.graphics.newFont(fontName.."-light.ttf", 32 * scale)
fontSB = love.graphics.newFont(fontName.."-black.ttf", 32 * scale)
fontB = love.graphics.newFont(fontName.."-black.ttf", 40 * scale)
font = love.graphics.newFont(fontName.."-light.ttf", 40 * scale)
fontH = love.graphics.newFont(fontName.."-light.ttf", 64 * scale)
fontHB = love.graphics.newFont(fontName.."-black.ttf", 64 * scale)

-- Importing components
bottomnav = require("src.components.bottomnav")
sublinks = require("src.components.sublinks")
slideup = require("src.components.slideup")


local scenery = SceneryInit(
    { path = "src.states.home", key = "home"},
    { path = "src.states.balance", key = "balance" },
    { path = "src.states.profile", key = "profile" },

    --sublinks
        { path = "src.states.substates.transactions", key = "transactions", default = true  }

)

scenery:hook(love)

function love.resize(w, h)
    wW = w
    wH = h
    scale = math.max(wW / baseW, wH / baseH)
end
