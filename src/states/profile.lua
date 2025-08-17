profile = {
    navbar = bottomnav
}


function profile:load()
    print("State : Profile")
    bottomnav:load(self)
end


function profile:update(dt)
    bottomnav:update(dt)
end


function profile:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))
    love.graphics.setFont(fontH)

    local heading = "My Profile"

    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.print(heading, wW/2 - fontH:getWidth(heading)/2, 40 * scale)

    -- love.graphics.rectangle("fill", wW/2 - fontH:getWidth(heading)/2, 40 * scale + fontH:getHeight(heading), fontH:getWidth(heading), 10 * scale, 5 * scale, 5 * scale)

    bottomnav:draw()
end

return profile