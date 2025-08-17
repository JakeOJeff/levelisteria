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

    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.print("Profile State", 10, 10)

    bottomnav:draw()
end

return profile