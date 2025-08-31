local transfer = {
    navbar = bottomnav

}

function transfer:load()
    self.fadeInVal = 0

    self.inputAmount = ""
    print("IN TRANSFER STATE")
    print(balance_Data.amount)
    bottomnav:load(self)
    buttontab:load(self)
    self.inputAmount = {
        value = "0",
        x = buttontab.x,
        y = buttontab.y + buttontab.h + 20 * scale,
        w = buttontab.w * 3 + 20 * scale * 2,
        h = buttontab.h * 2,
        selected = false
    }
    self.inputName = {
        value = "",
        x = self.inputAmount.x,
        y = self.inputAmount.y + self.inputAmount.h + 100 * scale,
        w = buttontab.w * 3 + 20 * scale * 2,
        h = buttontab.h * 2,
        selected = false
    }
    self.deleteHeld = false
    self.deleteTimer = 0
    self.deleteDelay = 1 -- seconds before repeating starts
    self.deleteInterval = 0.1 -- seconds between repeats

    self.submitBtn = {
        func = function()
            table.insert(transaction_data, {
                id = #transaction_data + 1,
                amount = self.inputAmount.value,
                partner = self.inputName.value,
                date = os.date("%Y-%m-%d")
            })
            balance_Data.amount = balance_Data.amount - tonumber(self.inputAmount.value)

        end,
        hovering = false,
        x = self.inputAmount.x + 50 * scale,
        y = self.inputName.y + self.inputName.h + 40 * scale,
        w = self.inputAmount.w - 100 * scale,
        h = self.inputAmount.h

    }
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
            self:deleteChar(self:currentlySelected())
        end
    end
    local mx, my = love.mouse.getPosition()
    if love.mouse.isDown(1) then
        if mx > self.inputAmount.x and mx < self.inputAmount.x + self.inputAmount.w and my > self.inputAmount.y and my <
            self.inputAmount.y + self.inputAmount.h then
            self.inputAmount.selected = true
            self.inputName.selected = false
        elseif mx > self.inputName.x and mx < self.inputName.x + self.inputName.w and my > self.inputName.y and my <
            self.inputName.y + self.inputName.h then
            self.inputName.selected = true
            self.inputAmount.selected = false
        end
    end
    if mx > self.submitBtn.x and mx < self.submitBtn.x + self.submitBtn.w and my > self.submitBtn.y and my <
        self.submitBtn.y + self.submitBtn.h then
        self.submitBtn.hovering = true
    else
        self.submitBtn.hovering = false
    end
end

function transfer:textinput(t)

    if self.inputAmount.selected and checkNum(t) then
        self.inputAmount.value = self.inputAmount.value .. t 

    end
    if self.inputName.selected then
        self.inputName.value = self.inputName.value .. t
    end
end

function transfer:draw()
    local transColor = {utils.hexToRgb(colors[3])[1], utils.hexToRgb(colors[3])[2], utils.hexToRgb(colors[3])[3],
                        self.fadeInVal}

    love.graphics.setColor(transColor)
    love.graphics.setFont(fontB)
    local hText = "BANK TRANSFER"
    love.graphics.print(hText, wW / 2 - fontB:getWidth(hText) / 2, 50 * scale)
    love.graphics.setFont(fontB)
    love.graphics.print("Enter/Choose Amount", self.inputAmount.x, buttontab.y - fontB:getHeight() - 20 * scale)
    buttontab:draw()

    love.graphics.rectangle("line", self.inputAmount.x, self.inputAmount.y, self.inputAmount.w, self.inputAmount.h,
        15 * scale)
    local sendAmt = utils.normalizeCurrency(tonumber(self.inputAmount.value))
    love.graphics.setFont(fontHB)

    love.graphics.print(sendAmt, self.inputAmount.x + (self.inputAmount.w / 2 - fontHB:getWidth(sendAmt) / 2),
        self.inputAmount.y + (self.inputAmount.h / 2 - fontHB:getHeight() / 2))

    love.graphics.setColor(transColor)

    love.graphics.setFont(fontB)
    love.graphics.print("Enter Recipient", self.inputAmount.x, self.inputAmount.y + self.inputAmount.h + 30 * scale)
    love.graphics.rectangle("line", self.inputName.x, self.inputName.y, self.inputName.w, self.inputName.h, 15 * scale)
    local sendAmt = (self.inputName.value)
    love.graphics.setFont(fontHB)

    love.graphics.print(sendAmt, self.inputName.x + (self.inputName.w / 2 - fontHB:getWidth(sendAmt) / 2),
        self.inputName.y + (self.inputAmount.h / 2 - fontHB:getHeight() / 2))

    btn = self.submitBtn

    -- SEND BUTTON
    if btn.hovering then
        hoverStyle = "fill"
        hoverInvertColor = {1, 1, 1}
        if love.mouse.isDown(1) then
            btn.func()
        end
    else
        hoverStyle = "line"
        hoverInvertColor = utils.hexToRgb(colors[3])
    end
    love.graphics.rectangle(hoverStyle, btn.x, btn.y, btn.w, btn.h, 15 * scale, 15 * scale)

    -- draw amount text centered inside button
    local text = "Send Money"
    local font = love.graphics.getFont()
    local tw = font:getWidth(text)
    local th = font:getHeight()
    love.graphics.setColor(hoverInvertColor)
    love.graphics.print(text, btn.x + (btn.w - tw) / 2, btn.y + (btn.h - th) / 2)
    love.graphics.setColor(utils.hexToRgb(colors[3]))
    bottomnav:draw()
end
function transfer:currentlySelected()
    return self.inputAmount.selected and self.inputAmount or self.inputName 
end
function transfer:keypressed(key)
    if key == "backspace" then
        self:deleteChar(self:currentlySelected()) -- immediate delete
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
function transfer:deleteChar(sel)
    local str = tostring(sel.value) 

    -- For integers
    if sel == self.inputAmount then
        if #str > 1 then
            if #str == 2 and string.sub(str, 1, 1) == "-" then
                self.inputAmount.value = "0"
            else
                self.inputAmount.value = string.sub(str, 1, -2)
            end
        elseif #str >= 0 then
            self.inputAmount.value = "0"
        end
    else
        if #str > 0 then
                self.inputName.value = string.sub(str, 1, -2)
        end
    end

end

function transfer:mousepressed(x, y, button)
    if button == 1 then
        if self.submitBtn.hovering then
            self.submitBtn.func()
            
            trans_Data:load()
            transfer.setScene("balance")
        end
    end
end
function checkNum(val)
    if tonumber(val) ~= nil then
        return true
    end
    return false
end
return transfer
