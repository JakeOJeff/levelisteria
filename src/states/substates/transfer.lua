local transfer = {
    navbar = bottomnav,


}


function transfer:load()
    self.fadeInVal = 0
    print("IN TRANSFER STATE")
    bottomnav:load(self)
    buttontab:load()
end

function transfer:update(dt)
    bottomnav:update(dt)
    buttontab:update(dt)
    if self.fadeInVal < 1 then
        self.fadeInVal = self.fadeInVal + 1 * dt
    end
    self.fadeInVal = math.min(self.fadeInVal, 1)
end

function transfer:draw()
    local transColor = { utils.hexToRgb(colors[3])[1], utils.hexToRgb(colors[3])[2], utils.hexToRgb(colors[3])[3], self
        .fadeInVal }

    love.graphics.setColor(transColor)    love.graphics.setFont(fontB)
    local hText = "Bank Transfer"
    love.graphics.print(hText, wW/2 - fontB:getWidth(hText)/2, 50 * scale)
    buttontab:draw()
    bottomnav:draw()
end



return transfer
