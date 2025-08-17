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

    bottomnav:draw()
end

return home