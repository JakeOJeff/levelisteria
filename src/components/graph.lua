local graph = {}

function graph:load(data)
    self.data = data or {}
    self.height = 0
    self.width = 0
    self.totalAmount = 0
    for i, v in ipairs(self.data) do
        self.totalAmount = self.totalAmount + (v.amount or 0)
    end
    self.mean = self.totalAmount / #self.data
    

    self.maxDeviation = 0
    for _, v in ipairs(self.data) do
        local deviation = math.abs(v.amount - self.mean)
        if deviation > self.maxDeviation then
            self.maxDeviation = deviation
        end
    end
end

function graph:draw(x, y)
    self.x, self.y = x, y

    local frameWidth = wW - 60 * scale
    local frameHeight = 300 * scale
    local baseline = y + frameHeight/2
    self.height = frameHeight
    self.width = frameWidth

    love.graphics.setLineWidth(2 * scale)

    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.rectangle("line", x, y, frameWidth, frameHeight, 10 * scale, 10 * scale)

    love.graphics.line(x, baseline, x + frameWidth, baseline)


    local mx, my = love.mouse.getPosition()
    --
    local lineTable = {}
    for i = 1, #self.data do
        local v = self.data[i]
        local gX = x + (i - 1) * (frameWidth / math.max((#self.data - 1), 1))

        local graphOffset = 0
        if self.maxDeviation > 0 then
            graphOffset = (v.amount - self.mean) / self.maxDeviation *( frameHeight / 2 - 20 * scale)

        end
        local gY = baseline - graphOffset

        table.insert(lineTable, gX)
        table.insert(lineTable, gY)
        if utils.distCirc(mx, my, gX, gY, 20 * scale) then
            love.graphics.circle("line", gX, gY, 20 * scale)
            love.graphics.print(v.amount, gX, gY + 25 * scale)
        end
    end
        if #lineTable >= 4 then
        love.graphics.line(lineTable)
    end
    love.graphics.setColor(1, 1, 1)
end

function graph:normalizeData()

end

return graph
