home = {
    navbar = bottomnav
}


function home:load()
    print("State : Home")
end


function home:update(dt)

end


function home:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[1]))

    bottomnav:draw()
end

return home