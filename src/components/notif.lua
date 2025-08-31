local notif = {}

function notif:load(info, type)
    self.x = 20 * scale
    self.width = wW - 40 * scale

    self.y = wH
    self.height = 60 * scale

    self.color = type == "err" and { 255 / 255, 134 / 255, 125 / 255} or {134 / 255, 255 / 255, 125 / 255}
end

function notif:update(dt)
    
end

function notif:draw()
    
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return notif