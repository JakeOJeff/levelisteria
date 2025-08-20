local transactions = {
    navbar = bottomnav,
    scrollY = 0,
    touchStartY = 0,
    history = {
        {
            id = 1,
            amount = 100,
            partner = "Jimmy",
            date = "2025-08-20"
        }
    }

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

    self.scrollY = self.scrollY + self.touchStartY
end

function transactions:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))
    love.graphics.setColor(1, 1, 1, self.fadeInVal)
    love.graphics.setFont(fontB)
    local itemY = 40 * scale
    love.graphics.setColor(utils.hexToRgb(colors[1])[1], utils.hexToRgb(colors[1])[2], utils.hexToRgb(colors[1])[3], self.fadeInVal)
    love.graphics.print("TRANSACTIONS", wW / 2 - fontB:getWidth("TRANSACTIONS") / 2, itemY)

    itemY = 20 * scale + fontB:getHeight() + itemY
    love.graphics.push()

    local perim = {
        x = 50 * scale,
        y = itemY,
        w = wW - 100 * scale,
        h = wH - itemY - bottomnav.height - 60 * scale
    }
    love.graphics.rectangle("line", perim.x, perim.y, perim.w, perim.h, 10 * scale, 10 * scale)

    love.graphics.setScissor(perim.x + 10 * scale, perim.y + 10 * scale, perim.w - 20 * scale, perim.h - 20 * scale, 10 * scale, 10 * scale)
    
    for i, v in ipairs(self.history) do
        local cardY = perim.y + 12 * scale + (i - 1) * scale * 50 + self.scrollY
        love.graphics.rectangle("line", perim.x + 12 * scale, cardY, perim.w - 24 * scale, 150 * scale, 10 * scale, 10 * scale)
        love.graphics.setFont(font)
        local ind = self.history[v.id]
        local transactionType = ind.amount > 0 and "Received" or "Sent"
        love.graphics.print(transactionType .. " " .. math.abs(ind.amount), perim.x + 18 * scale, cardY + 5 * scale)
    end

    love.graphics.setScissor()


    love.graphics.pop()
    bottomnav:draw()
end


function transactions:wheelmoved(x, y)
    if (y < 0 ) then
        self.scrollY  = self.scrollY - 20 * scale
    else 
        self.scrollY  = self.scrollY + 20 * scale
    end
end



return transactions
