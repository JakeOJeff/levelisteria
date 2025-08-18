local utils = {

}

function utils.img(path)
    return love.graphics.newImage(path)
end

function utils.sortFlexList(table)
    for i = 1, #table - 1 do
        for j = i + 1, #table do
            if table[i].flex > table[j].flex then
                table[i], table[j] = table[j], table[i]
            end
        end
    end
    return table
end

function utils.hexToRgb(hex)
    hex = hex:gsub("#","")
    return {
        tonumber("0x" .. hex:sub(1,2)) / 255, 
        tonumber("0x" .. hex:sub(3,4)) / 255, 
        tonumber("0x" .. hex:sub(5,6)) / 255
    }
end

local COLOR_MUL = love._version >= "11.0" and 1 or 255

function utils.gradient(colors)
    local direction = colors.direction or "horizontal"
    if direction == "horizontal" then
        direction = true
    elseif direction == "vertical" then
        direction = false
    else
        error("Invalid direction '" .. tostring(direction) .. "' for gradient.  Horizontal or vertical expected.")
    end
    local result = love.image.newImageData(direction and 1 or #colors, direction and #colors or 1)
    for i, color in ipairs(colors) do
        local x, y
        if direction then
            x, y = 0, i - 1
        else
            x, y = i - 1, 0
        end
        result:setPixel(x, y, color[1], color[2], color[3], color[4] or 255)
    end
    result = love.graphics.newImage(result)
    result:setFilter('linear', 'linear')
    return result
end

function utils.drawinrect(img, x, y, w, h, r, ox, oy, kx, ky)
    return -- tail call for a little extra bit of efficiency
    love.graphics.draw(img, x, y, r, w / img:getWidth(), h / img:getHeight(), ox, oy, kx, ky)
end

return utils