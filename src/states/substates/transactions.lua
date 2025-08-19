local transactions = {
    navbar = bottomnav

}


function transactions:load()
    self.fadeInVal = 0
    print("IN TRANSACTIONS STATE")
    bottomnav:load(self)
end

function transactions:update(dt)
    bottomnav:update(dt)
    if self.fadeInVal < 1 then
        self.fadeInVal = self.fadeInVal + 1 * dt
    end
end

function transactions:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))
    love.graphics.setColor(1, 1, 1, self.fadeInVal)
    love.graphics.setColor(utils.hexToRgb(colors[1])[1], utils.hexToRgb(colors[1])[2], utils.hexToRgb(colors[1])[3], self.fadeInVal)
    love.graphics.print("TRANSACTIONS", wW / 2 - fontH:getWidth("TRANSACTIONS") / 2, 40 * scale)
    bottomnav:draw()
end

return transactions
