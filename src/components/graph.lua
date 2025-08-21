local graph = {}

function graph:load(data)
    self.data = data or {}

    self.totalAmount = 0
    for i, v in ipairs(self.data) do
        self.totalAmount = self.totalAmount + (v.amount or 0)
    end
    self.mean = self.totalAmount / #self.data
    for i = 1, #self.data do
        if self.data[i].amount >= self.mean then
            self.aboveMean = self.data[i]
        else
            self.belowMean = self.data[i]
        end
    end
end

function graph:draw(x, y)
    self.x, self.y = x, y
    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.rectangle("line", x, y, wW - 40 * scale, 200 * scale, 10 * scale, 10 * scale)
    love.graphics.line(x, y + 100, x + wW - 40 * scale, y + 100)


    local mx, my = love.mouse.getPosition()
    --
    local lineTable = {}
    for i = 1, #self.data do
        local v = self.data[i]
        local gX, gY = x + (i - 1) * (wW - 40 * scale) / #self.data, 0
        if v.amount >= self.mean then
            gY = y + 100 - (v.amount / self.totalAmount) * 100 * scale
        else
            gY = y + 100 + (v.amount / self.totalAmount) * 100 * scale
        end
        table.insert(lineTable, gX)
        table.insert(lineTable, gY)
        if utils.distCirc(mx, my, gX, gY, 20 * scale) then
            love.graphics.circle("line", gX, gY, 20 * scale)
            love.graphics.print(v.amount, gX, gY + 25 * scale)
        end
    end
    love.graphics.line(lineTable)
        love.graphics.setColor(1,1,1)

end

function graph:normalizeData()

end

return graph
