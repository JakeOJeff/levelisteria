local transfer = {
    navbar = bottomnav

}

function transfer:load()
    self.fadeInVal = 0

    self.inputAmount = ""
    print("IN TRANSFER STATE")
    bottomnav:load(self)
    buttontab:load()
    self.inputAmount = {
        value = "0",
        x = buttontab.x,
        y = buttontab.y + buttontab.h + 20 * scale,
        w = buttontab.w * 3 + 20 * scale * 2,
        h = buttontab.h * 2,
        selected = false
    }

    self.deleteHeld = false
    self.deleteTimer = 0
    self.deleteDelay = 1     -- seconds before repeating starts
    self.deleteInterval = 0.1 -- seconds between repeats
end

function transfer:update(dt)
    bottomnav:update(dt)
    buttontab:update(dt)
    if self.fadeInVal < 1 then
        self.fadeInVal = self.fadeInVal + 1 * dt
    end
    self.fadeInVal = math.min(self.fadeInVal, 1)

        if self.deleteHeld then
        self.deleteTimer = self.deleteTimer + dt

        if self.deleteTimer > self.deleteDelay then
            -- start repeating deletes
            self.deleteTimer = self.deleteTimer - self.deleteInterval
            self:deleteChar()
        end
    end
    local mx, my = love.mouse.getPosition()
    if mx > self.inputAmount.x and mx < self.inputAmount.x + self.inputAmount.w and my > self.inputAmount.y and my <
        self.inputAmount.y + self.inputAmount.h then
        if love.mouse.isDown(1) then

            self.inputAmount.selected = true
        end
    end
end

function transfer:textinput(t)
    
    if self.inputAmount.selected and checkNum(t) then
        self.inputAmount.value = self.inputAmount.value .. t

    end
end

function transfer:draw()
    local transColor = {utils.hexToRgb(colors[3])[1], utils.hexToRgb(colors[3])[2], utils.hexToRgb(colors[3])[3],
                        self.fadeInVal}

    love.graphics.setColor(transColor)
    love.graphics.setFont(fontB)
    local hText = "BANK TRANSFER"
    love.graphics.print(hText, wW / 2 - fontB:getWidth(hText) / 2, 50 * scale)
    buttontab:draw()
    love.graphics.rectangle("line", self.inputAmount.x, self.inputAmount.y, self.inputAmount.w, self.inputAmount.h,
        15 * scale)
    love.graphics.print(utils.normalizeCurrency(tonumber(self.inputAmount.value)), self.inputAmount.x,
        self.inputAmount.y)
    bottomnav:draw()
end

function transfer:keypressed(key)
        if key == "backspace" then
        self:deleteChar() -- immediate delete
        self.deleteHeld = true
        self.deleteTimer = 0
    end
end
function transfer:keyreleased(key)
    if key == "backspace" then
        self.deleteHeld = false
    end
end
-- helper: actually delete last char
function transfer:deleteChar()
    local str = tostring(self.inputAmount.value)
    if #str > 1 then
        self.inputAmount.value = string.sub(str, 1, -2)
    elseif #str >= 0 then
        self.inputAmount.value = "0"
    end
    
end

function checkNum(val)
    if tonumber(val) ~= nil then
        return true
    end
    return false
end
return transfer
