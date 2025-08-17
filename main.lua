local SceneryInit = require("src.libs.scenery")

local scenery = SceneryInit.init({
    { path = "src.states.home", key = "home", default = true },
    { path = "src.states.profile", key = "profile" },
})

scenery:hook(love)