local sublinks = {
    openIcon = utils.img("assets/icons/open.png")
}

function sublinks:draw(x, y, width, height, title,currentLink, link)
    love.graphics.setColor(0,0,0,0.2)

        love.graphics.rectangle("fill", x, y + 3 * scale, width, height, 10 * scale, 10 * scale )
    love.graphics.setColor(utils.hexToRgb(colors[2]))

    love.graphics.rectangle("fill", x, y, width, height, 10 * scale, 10 * scale )

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(font)
    love.graphics.print(title, x + 10 * scale, y + height/2 - font:getHeight()/2)
 

    local iconX = x + width - (0.5 * height) - 16 * scale
    local iconY = y + (height)/2 - (0.5 * height)/2
    local mx, my = love.mouse.getPosition()
    if utils.dist(mx, my, x, y, width, height) then
        if love.mouse.isDown(1) then
            slideup:startSlide(currentLink, link)
        end
        if iconX < width - 2 * scale then
            iconX = iconX + 2 * scale
        end
    end

    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.openIcon,
    iconX,
    iconY,
    0,
    (0.5 * height) / self.openIcon:getWidth(),
    (0.5 * height) / self.openIcon:getHeight()

)

end

return sublinks
