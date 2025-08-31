local buttontab = {}

function buttontab:new()
    self.amounts = {
        returnBalance()/3,
        returnBalance()/2,
        returnBalance()
    }
    self.x = 10 * scale
    self.y = 300 * scale
    self.w = 50 * scale
    self.h = 20 * scale
end

function buttontab:update(dt)
    
end

function buttontab:draw()
    love.graphics.setColor()
    for i = 1, 3 do
        love.graphics.rectangle("line", self.x + self.w * i, self.y, self.w, self.h, 10, 10)
    end
end

return buttontab