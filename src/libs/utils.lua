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

function utils.gradientMesh(dir, ...)
    -- Check for direction
    local isHorizontal = true
    if dir == "vertical" then
        isHorizontal = false
    elseif dir ~= "horizontal" then
        error("bad argument #1 to 'gradient' (invalid value)", 2)
    end

    -- Check for colors
    local colorLen = select("#", ...)
    if colorLen < 2 then
        error("color list is less than two", 2)
    end

    -- Generate mesh
    local meshData = {}
    if isHorizontal then
        for i = 1, colorLen do
            local color = select(i, ...)
            local x = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {x, 1, x, 1, color[1], color[2], color[3], color[4] or (1 * COLOR_MUL)}
            meshData[#meshData + 1] = {x, 0, x, 0, color[1], color[2], color[3], color[4] or (1 * COLOR_MUL)}
        end
    else
        for i = 1, colorLen do
            local color = select(i, ...)
            local y = (i - 1) / (colorLen - 1)

            meshData[#meshData + 1] = {1, y, 1, y, color[1], color[2], color[3], color[4] or (1 * COLOR_MUL)}
            meshData[#meshData + 1] = {0, y, 0, y, color[1], color[2], color[3], color[4] or (1 * COLOR_MUL)}
        end
    end

    -- Resulting Mesh has 1x1 image size
    return love.graphics.newMesh(meshData, "strip", "static")
end

return utils