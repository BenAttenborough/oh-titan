Footsteps = Class{}

require 'items/footsteps/footstepsSprite'

function Footsteps:init()
end

function Footsteps:drawSprite(frame1, frame2, x, y, axis)
    if axis % 2 == 0 then
        drawItem(frame1, (x - 1) * 8, (y - 1) * 8)
    else
        drawItem(frame2, (x - 1) * 8, (y - 1) * 8)
    end
end

function Footsteps:render()
    for y, line in ipairs(currentMap) do
        for x, cell in ipairs(currentMap[y]) do
            if cell == 2 then
                self:drawSprite(footstepsSpriteRight1, footstepsSpriteRight2, x, y, x)
            end
            if cell == 3 then
                self:drawSprite(footstepsSpriteLeft1, footstepsSpriteLeft2, x, y, x)
            end
            if cell == 4 then
                self:drawSprite(footstepsSpriteUp1, footstepsSpriteUp2, x, y, y)
            end
            if cell == 5 then
                self:drawSprite(footstepsSpriteDown1, footstepsSpriteDown2, x, y, y)
            end
        end
    end
end
