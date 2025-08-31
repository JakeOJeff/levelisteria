local buttontab = {}

function buttontab:load()
    local amounts = { returnBalance() / 3, returnBalance() / 2, returnBalance() }
    self.buttons = {}
    self.spacing = 20 * scale
    self.x = 25 * scale
    self.y = 300 * scale
    self.w = (wW - (self.x * 2) - (2 * self.spacing)) / 3
    self.h = 50 * scale

    for i, amt in ipairs(amounts) do
        local bx = self.x + (self.w + self.spacing) * (i - 1)
        self.buttons[i] = {
            x = bx,
            y = self.y,
            w = self.w,
            h = self.h,
            amount = amt,
            hovering = false
        }
    end
end

function buttontab:update(dt)
    local mx, my = love.mouse.getPosition()
    for _, btn in ipairs(self.buttons) do
        btn.hovering = (mx > btn.x and mx < btn.x + btn.w and my > btn.y and my < btn.y + btn.h)
    end
end

function buttontab:draw()
    for i, btn in ipairs(self.buttons) do
        if btn.hovering then
            hoverStyle = "fill"
            hoverInvertColor = {1,1,1}
        else
            hoverStyle = "line"
            hoverInvertColor = utils.hexToRgb(colors[3])
        end
        love.graphics.rectangle(hoverStyle, btn.x, btn.y, btn.w, btn.h, 10, 10)

        -- draw amount text centered inside button
        local text = "$"..tostring(math.floor(btn.amount))
        local font = love.graphics.getFont()
        local tw = font:getWidth(text)
        local th = font:getHeight()
        love.graphics.setColor(hoverInvertColor)
        love.graphics.print(text, btn.x + (btn.w - tw) / 2, btn.y + (btn.h - th) / 2)
        love.graphics.setColor(utils.hexToRgb(colors[3]))

    end
end

return buttontab
