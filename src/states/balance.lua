balance = {
    amount = 0,
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
    love.graphics.setFont(fontH)

    local heading = "My Balance"
    local itemY = 40 * scale

    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.print(heading, wW/2 - fontH:getWidth(heading)/2, itemY)

    -- love.graphics.rectangle("fill", wW/2 - fontH:getWidth(heading)/2, 40 * scale + fontH:getHeight(heading), fontH:getWidth(heading), 10 * scale, 5 * scale, 5 * scale)
    itemY  = itemY + fontH:getHeight(heading) + 20 * scale
    love.graphics.setColor(utils.hexToRgb(colors[2]))
    love.graphics.setLineWidth(8 * scale)
    love.graphics.rectangle("line", 20 * scale, itemY, wW - 40 * scale, 100 * scale, 10 * scale, 10 * scale)

    love.graphics.print(self.amount, wW/2 - fontH:getWidth(tostring(self.amount))/2, itemY + (100 * scale)/2)

    itemY = itemY + 20 * scale
    bottomnav:draw()
end

return balance