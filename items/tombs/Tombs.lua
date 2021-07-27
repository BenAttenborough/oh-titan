Tombs = Class{}

require 'items.tombs.Tomb'

function Tombs:init()
    self.tombs = {}
end

function Tombs:update(dt)
    for i,tomb in ipairs(self.tombs) do
        tomb:update(dt)
    end
end

function Tombs:create()
    local tombTypes = {}
    for i=1,10 do table.insert(tombTypes, 1) end
    for i=1,6 do table.insert(tombTypes, 2) end
    table.insert(tombTypes, 3)
    table.insert(tombTypes, 4)
    table.insert(tombTypes, 5)
    table.insert(tombTypes, 6)
    tombTypes = M.shuffle(tombTypes, os.time())
    local type = 1
    for i=0,3 do
        for j=0,4 do
            table.insert(self.tombs, Tomb((j * 7) + 2, (i * 5) + 4, false, tombTypes[type]))
            type = type + 1
        end
    end
end

function Tombs:render()
    for i,tomb in ipairs(self.tombs) do
        tomb:render()
    end
end

function Tombs:createTitleTombs()
    local tombTypes = {5,2,1,2,3,}
    local tombTypesBottomRow = {1,2,4,2,1}
    local type = 1
    local i = 0
    local primaryColour = "Orange"
    local secondaryColour = "Orange"
    for j=0,4 do
        table.insert(self.tombs, Tomb((j * 7) + 2, (i * 5) + 2, true, tombTypes[type], primaryColour))
        if j > 1 then primaryColour = "Sky Blue" end
        type = type + 1
    end
    table.insert(self.tombs, Tomb(2, 7, false, 1))
    table.insert(self.tombs, Tomb(30, 7, false, 1))
    table.insert(self.tombs, Tomb(2, 12, false, 1))
    table.insert(self.tombs, Tomb(30, 12, false, 1))
    type = 1
    i = 3
    primaryColour = "Bright Yellow"
    for j=0,4 do
        table.insert(self.tombs, Tomb((j * 7) + 2, (i * 5) + 2, true, tombTypesBottomRow[type], primaryColour, secondaryColour))
        if j > 1 then 
            primaryColour = "Pastel Cyan"
            secondaryColour = "Orange"
        end
        type = type + 1
    end
end

function Tombs:getMummyTomb()
    for i,tomb in ipairs(self.tombs) do
        if tomb.type == 6 then
            return tomb
        end 
    end
end