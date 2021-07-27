Tomb = Class{}

function Tomb:init(x, y, open, type, primaryColour, secondaryColour)
    self.x = x
    self.y = y
    self.isOpen = open or false
    self.type = type
    self.primaryColour = primaryColour or 'Orange'
    self.secondaryColour = secondaryColour or 'Black'
    self.timer = Timer.new()
    self.openingPosition = 5
    self.colourSchemeIndex = ((level - 1) % #gTombColours) + 1
end

function Tomb:update(dt)
    self.timer:update(dt)
    if not self.isOpen then
        if self:isSurrounded() == true then
            self.isOpen = true
            if self.type == 1 then 
                score = score + 5 
            end
            if self.type == 4 then 
                player:getScroll()
            end
            if self.type == 5 then 
                score = score + 50
                player:getRoyalTomb()
            end
            if self.type == 3 then
                player:getKey()
            end
            if self.type == 6 and self.isOpen then
                self:openMummyTomb()
            end
        end
    end
end

function Tomb:render()
    if self.isOpen then
        self:renderOpenTomb()
    else
        self:renderUnopenedTomb()
    end
end

function Tomb:openMummyTomb()
    if numberOfMummies < 6 then numberOfMummies = numberOfMummies + 1 end
    self.timer:every(0.3, function()
        if self.openingPosition < 24 then
            self.openingPosition = self.openingPosition + 1
        else
            if hiddenMummy.asleep then
                hiddenMummy:wakeUp()
            end
        end
    end)
end

function Tomb:renderUnopenedTomb()
    toggle = true
    for i=0,TOMB_HEIGHT - 1 do
        for j=0,TOMB_WIDTH - 1 do
            if toggle then setColour(gTombColours[self.colourSchemeIndex].primary) else setColour(gTombColours[self.colourSchemeIndex].secondary) end
            playarea_points((self.x * 8) + j, (self.y * 8) + i)
            toggle = not toggle
        end
        toggle = not toggle
    end
end

function Tomb:renderMummyTomb()
    toggle = true
    for i=0,TOMB_HEIGHT - 1 do
        for j=0,TOMB_WIDTH - 1 do
            if toggle then setColour("Orange") else setColour("Bright Yellow") end
            if i >= 6 and i <= self.openingPosition then
                if j <= 24 then
                    playarea_points((self.x * 8) + j, (self.y * 8) + i)
                end
            else
                playarea_points((self.x * 8) + j, (self.y * 8) + i)
            end
            toggle = not toggle
        end
        toggle = not toggle
    end
end

function Tomb:renderOpenTomb()
    
    if self.type == 1 then 
        drawItem(itemCoffin, (self.x * 8), (self.y * 8))
    end
    if self.type == 2 then
        toggle = true
        for i=0,TOMB_HEIGHT - 1 do
            for j=0,TOMB_WIDTH - 1 do
                if toggle then setColour(self.primaryColour) else setColour(self.secondaryColour) end
                playarea_points((self.x * 8) + j, (self.y * 8) + i)
                toggle = not toggle
            end
            toggle = not toggle
        end
    end
    if self.type == 3 then drawItem(itemKey, (self.x * 8), (self.y * 8)) end
    if self.type == 4 then drawItem(itemScroll, (self.x * 8), (self.y * 8)) end
    if self.type == 5 then drawItem(itemSarcophagus, (self.x * 8), (self.y * 8)) end
    if self.type == 6 then self:renderMummyTomb() end
end

function Tomb:isSurrounded()
    for i = self.x - 1, self.x + 6 do
        if currentMap[self.y - 1][i] == 0 then
            return false
        end
        if currentMap[self.y + 4][i] == 0 then
            return false
        end
    end
    if currentMap[self.y][self.x - 1] == 0 then
        return false
    end
    if currentMap[self.y + 1][self.x - 1] == 0 then
        return false
    end
    if currentMap[self.y + 2][self.x - 1] == 0 then
        return false
    end
    if currentMap[self.y + 3][self.x - 1] == 0 then
        return false
    end
    if currentMap[self.y][self.x + 6] == 0 then
        return false
    end
    if currentMap[self.y + 1][self.x + 6] == 0 then
        return false
    end
    if currentMap[self.y + 2][self.x + 6] == 0 then
        return false
    end
    if currentMap[self.y + 3][self.x + 6] == 0 then
        return false
    end
    return true
end
