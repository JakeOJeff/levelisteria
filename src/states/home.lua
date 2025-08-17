home = {
    navbar = bottomnav
}


function home:load()
    print("State : Home")
    bottomnav:load()
end


function home:update(dt)

end


function home:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))

    bottomnav:draw()
end

return home