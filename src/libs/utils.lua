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



return utils