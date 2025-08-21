home = {
    navbar = bottomnav
}


function home:load()
    print("State : Home")
    bottomnav:load(self)
end

function home:update(dt)
    bottomnav:update(dt)
end

function home:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))

    love.gradient.draw(
        function()
            love.graphics.rectangle("fill", 0, 0, wW, wH)
        end,
        "linear",
        wW / 2, wH / 2,          -- center x, y
        wW, wH - bottomnav.height, -- width, height
        utils.hexToRgb(colors[4]),
        utils.hexToRgb(colors[5]),
        0,   -- angle
        1, 1 -- scale
    )

    local topCirc = {
        x = 0,
        y = 0,
        w = wW,
        h = wH/2
    }
    love.gradient.draw(
        function ()
            love.graphics.rectangle("fill", topCirc.x, topCirc.y, topCirc.w, topCirc.h, wW * scale, wW * scale)
        end,
        "linear",
        topCirc.x/2, topCirc.y/2,  -- center x, y
        topCirc.w, topCirc.h, -- width, height
        utils.hexToRgb(colors[1]),
        utils.hexToRgb(colors[3]),
        0,   -- angle
        1, 1 -- scale
    )
    bottomnav:draw()
end

return home
