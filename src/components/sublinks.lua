local sublinks = {
    openIcon = utils.img("assets/icons/open.png")
}


function sublinks:draw(x, y, width, height, title, link)

    love.graphics.setColor(utils.hexToRgb(colors[2]))
    love.graphics.rectangle("fill", x, y, width, height, 10 * scale, 10 * scale )

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(font)
    love.graphics.print(title, x + 10 * scale, y + height/2 - font:getHeight()/2)
 

    love.graphics.setColor(1, 1, 0)
    love.graphics.draw(self.openIcon,
    x + width - self.openIcon:getWidth() - 10 * scale,
    y +  (0.8 * height) - self.openIcon:getHeight()/2,
    0,
    (0.8 * height) / self.openIcon:getWidth(),
    (0.8 * height) / self.openIcon:getHeight()

)


end

return sublinks
