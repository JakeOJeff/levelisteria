local sublinks = {}


function sublinks:draw(x, y, width, height, title, subtitle, link)

    love.graphics.setColor(utils.hexToRgb(colors[1]))
    love.graphics.rectangle("fill", x, y, width, height, 10 * scale, 10 * scale )

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(fontB)
    love.graphics.print(title, x + 10 * scale, y + height/2 - fontB:getHeight())
end

return sublinks
