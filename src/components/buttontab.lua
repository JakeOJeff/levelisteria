local buttontab = {}

function buttontab:load()
    self.amounts = {
        returnBalance()/3,
        returnBalance()/2,
        returnBalance()
    }
    self.x = 25 * scale
    self.y = 300 * scale
    self.w = (wW - (self.x * 2) - (2 * (20 * scale))) / 3  -- subtract total spacing
    self.h = 50 * scale
    self.spacing = 20 * scale
end

function buttontab:update(dt)
    
    for i = 0, 2 do
        
    end
end

function buttontab:draw()
    love.graphics.setColor(utils.hexToRgb(colors[3]))
    for i = 0, 2 do
        local bx = self.x + (self.w + self.spacing) * i
        love.graphics.rectangle("line", bx, self.y, self.w, self.h, 10, 10)
    end
end

return buttontab
