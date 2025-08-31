local buttontab = {}

function buttontab:load()
    self.amounts = {returnBalance() / 3, returnBalance() / 2, returnBalance()}
    self.x = 25 * scale
    self.y = 300 * scale
    self.w = (wW - (self.x * 2) - (2 * (20 * scale))) / 3 -- subtract total spacing
    self.h = 50 * scale
    self.spacing = 20 * scale
    self.hoveringElement = 0
end

function buttontab:update(dt)
    local mx, my = love.mouse.getPosition()
    self.hoveringElement = 0
    for i = 0, 2 do
        local bx = self.x + (self.w + self.spacing) * i
        if mx > bx and mx < bx + self.w and my > self.y and my < self.y + self.h then
            self.hoveringElement = i + 1
        end
    end
end

function buttontab:draw()
    love.graphics.setColor(utils.hexToRgb(colors[3]))
    for i = 0, 2 do
        if self.hoveringElement == ( i + 1 ) then
            print("HOVER "..i)
            love.graphics.setColor(utils.hexToRgb(colors[4]))
        end
        local bx = self.x + (self.w + self.spacing) * i
        love.graphics.rectangle("line", bx, self.y, self.w, self.h, 10, 10)
            love.graphics.setColor(utils.hexToRgb(colors[3]))

    end
end

return buttontab
