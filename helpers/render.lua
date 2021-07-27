function drawItem(item, x, y)
    x = x - 1
    y = y - 1
    for i,line in ipairs(item) do
        for j,cell in ipairs(item[i]) do
            setColour("Black")
            if cell == 1 then setColour("Bright Yellow") end
            if cell == 2 then setColour("Orange") end
            if cell == 3 then setColour("Sky Blue") end
            playarea_points(x + j, y + i)
        end
    end
end

function scaleItem(item, scale)
    local scaledItem = {}
    for lineIndex,line in ipairs(item) do
        for i = 1,scale,1 do
            local newLine = {}
            for cellIndex,cell in ipairs(item[lineIndex]) do
                for j = 1, scale, 1 do
                    newLine[#newLine + 1] = cell
                end
            end
            table.insert(scaledItem, deepcopy(newLine))
        end
        
    end
    return scaledItem;
end