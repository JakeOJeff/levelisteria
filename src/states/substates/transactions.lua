local transactions = {
    navbar = bottomnav,
    scrollY = 0,
    touchStartY = 0,
    cardHeight = 150 * scale,
    history = {
        {
            id = 3,
            amount = 100,
            partner = "Jimmy",
            date = "2025-08-20"
        },
        {
            id = 2,
            amount = 1688,
            partner = "Anrin",
            date = "2025-08-20"
        },
        {
            id = 1,
            amount = -50,
            partner = "Alice",
            date = "2025-08-21"
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

    if love.mouse.isDown(1) then
        self.isDragging = true
        self.lastY = love.mouse.getY()
    end

    self.scrollY = self.scrollY + self.touchStartY
end

function transactions:draw()
    love.graphics.setBackgroundColor(utils.hexToRgb(colors[4]))
    love.graphics.setColor(1, 1, 1, self.fadeInVal)
    love.graphics.setFont(fontB)
    local itemY = 40 * scale
    local transColor = { utils.hexToRgb(colors[3])[1], utils.hexToRgb(colors[3])[2], utils.hexToRgb(colors[3])[3], self
        .fadeInVal }

    love.graphics.setColor(transColor)
    love.graphics.print("TRANSACTIONS", wW / 2 - fontB:getWidth("TRANSACTIONS") / 2, itemY)

    itemY = 20 * scale + fontB:getHeight() + itemY
    love.graphics.push()

    local perim = {
        x = 50 * scale,
        y = itemY,
        w = wW - 100 * scale,
        h = wH - itemY - bottomnav.height - 60 * scale
    }
    love.graphics.setColor(transColor)
    love.graphics.rectangle("fill", perim.x, perim.y, perim.w, perim.h, 10 * scale, 10 * scale)

    love.graphics.setScissor(perim.x + 10 * scale, perim.y + 10 * scale, perim.w - 20 * scale, perim.h - 20 * scale,
        10 * scale, 10 * scale)

    for i, v in ipairs(self.history) do
        local cardY = perim.y + 12 * scale + (i - 1) * self.cardHeight + (i - 1) * (scale * 10) + self.scrollY
 
            love.graphics.setColor(1, 1, 1, self.fadeInVal)
                    love.graphics.rectangle("fill", perim.x + 12 * scale, cardY, perim.w - 24 * scale, self.cardHeight, 10 * scale,
            10 * scale)
            love.graphics.setColor(transColor)
                   love.graphics.rectangle("line", perim.x + 12 * scale, cardY, perim.w - 24 * scale, self.cardHeight, 10 * scale,
            10 * scale)
        love.graphics.setFont(font)
        local ind = self.history[v.id]
        local transactionType = ind.amount > 0 and "Received" or "Sent"
        love.graphics.print(transactionType .. " $" .. math.abs(ind.amount), perim.x + 18 * scale, cardY + 5 * scale)

        love.graphics.setFont(fontS)
        love.graphics.print(ind.partner .. " : " .. ind.date, perim.x + 18 * scale, cardY + 5 * scale + font:getHeight())


        love.graphics.setColor(transactionType == "Received" and { 134/255, 255/255, 125/255, self.fadeInVal } or { 255/255, 134/255, 125/255, self.fadeInVal })
        love.graphics.rectangle("fill", perim.x + 18 * scale,
            cardY + 5 * scale + font:getHeight() + 5 * scale + fontS:getHeight(), perim.w - 36 * scale, fontS:getHeight(),
            20 * scale, 20 * scale)
        love.graphics.setColor(transColor)
    end

    love.graphics.setScissor()


    love.graphics.pop()
    bottomnav:draw()
end

function transactions:wheelmoved(x, y)
    if (y < 0) then
        self.scrollY = self.scrollY - 20 * scale
    elseif (self.scrollY < 0) then
        self.scrollY = self.scrollY + 20 * scale
    end
end

function transactions:mousemoved(x, y, dx, dy, istouch)
    if self.isDragging and self.scrollY <= 0 then
        self.scrollY = self.scrollY + dy
        print(self.scrollY)
    end
end

function transactions:mousereleased(x, y, button)
    if button == 1 then
        self.isDragging = false
        self.scrollY = 0
    end
end

return transactions
