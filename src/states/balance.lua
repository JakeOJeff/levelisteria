balance = {
    amount = 11110,
    navbar = bottomnav
}


function balance:load()
    print("State : Balance")
    bottomnav:load(self)
end


function balance:update(dt)
    bottomnav:update(dt)
end


function balance:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))
    love.graphics.setFont(fontS)

    local heading = "My Balance"
    local itemY = 250 * scale
    love.graphics.setColor(utils.hexToRgb(colors[1]))

    love.graphics.rectangle("fill", 0, 0, wW, itemY)

    love.graphics.setColor(utils.hexToRgb(colors[4]))
    love.graphics.print(heading, wW/2 - fontS:getWidth(heading)/2, itemY - itemY/2)

    -- love.graphics.rectangle("fill", wW/2 - fontH:getWidth(heading)/2, 40 * scale + fontH:getHeight(heading), fontH:getWidth(heading), 10 * scale, 5 * scale, 5 * scale)
    itemY  = itemY + fontS:getHeight(heading) + 20 * scale
    love.graphics.setColor(utils.hexToRgb(colors[2]))
    love.graphics.setLineWidth(5 * scale)
    love.graphics.rectangle("line", 20 * scale, itemY, wW - 40 * scale, 100 * scale, 10 * scale, 10 * scale)

    love.graphics.print("$ "..self.amount, 30 * scale, itemY + (100 * scale)/2 - fontH:getHeight(self.amount)/2)

    itemY = itemY + 20 * scale
    bottomnav:draw()
end

return balance