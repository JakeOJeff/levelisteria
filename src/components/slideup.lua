local slideUp = {

}
function slideUp:load()
    self.isActive = false
    self.currentScene = nil
    self.target = nil
    self.x = 0
    self.y = wH
    self.w = wW
    self.h = wH + 10 * scale
end
function slideUp:startSlide(current, target)
    self.isActive = true
    self.currentScene = current
    self.target = target

end

function slideUp:update(dt)

    if self.isActive then
        if self.y > -10 * scale then
            self.y = self.y - ((wH * 2) * dt)
        else
            self.currentScene.setScene(self.target)
        end
    end

end


function slideUp:draw()
    if self.isActive then
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h, 0, 10 * scale, 10 * scale)
    end
end

return slideUp