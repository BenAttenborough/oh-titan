Player = Class{}

require 'items.player.playerSprite'

function Player:init(x, y, direction)
    self.x = x
    self.y = y
    self.movementCounter = 0
    self.direction = direction or 'right'
    self.hasKey = false
    self.hasScroll = false
    self.hasRoyalTomb = false
end

function Player:afterMovement(direction)
    self.movementCounter = 0
    self.direction = direction
end

function Player:getKey()
    self.hasKey = true
end

function Player:getRoyalTomb()
    self.hasRoyalTomb = true
end

function Player:getScroll()
    self.hasScroll = true
end

function Player:movement(direction, dt)
    if self.movementCounter < movementInterval then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if direction == 'right' then
        if self.x <= 35 and currentMap[self.y][self.x + 1] ~= 1 then
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        end
        self:afterMovement(direction)
    end
    if direction == 'left' then
        if self.x >1 and currentMap[self.y][self.x - 1] ~= 1 then
            currentMap[self.y][self.x] = 3
            self.x = self.x - 1
        end
        self:afterMovement(direction)
    end
    if direction == 'up' then
        if self.y > 1 and currentMap[self.y - 1][self.x] ~= 1 then
            currentMap[self.y][self.x] = 4
            self.y = self.y - 1
        end
        self:afterMovement(direction)
        if self.y == 1 then
            if self:exitRequirementIsMet() then
                numberOfMummies = math.min(numberOfMummies + 1, 6)
                level = level + 1
                if level % 5 == 0 then
                    if lives < 5 then 
                        lives = lives + 1 
                    end
                    if mummyIntelligence < 95 then
                        mummyIntelligence = mummyIntelligence + 5
                    end
                    if movementInterval > 0.02 then
                        movementInterval = movementInterval - 0.02
                    elseif movementInterval > 0.002 then
                        movementInterval = movementInterval - 0.002
                    end
                    numberOfMummies = 1
                    gStateMachine:change('story')
                else
                    gStateMachine:change('play')
                end
            end
        end
    end
    if direction == 'down' then
        if self.y <= 22 and currentMap[self.y + 1][self.x] ~= 1 then
            currentMap[self.y][self.x] = 5
            self.y = self.y + 1
        end
        self:afterMovement(direction)
    end
end

function Player:update(dt)
    if love.keyboard.wasHeld('right') then
        self:movement('right', dt)
    end
    if love.keyboard.wasHeld('left') then
        self:movement('left', dt)
    end
    if love.keyboard.wasHeld('up') then
        self:movement('up', dt)
    end
    if love.keyboard.wasHeld('down') then
        self:movement('down', dt)
    end
end

function Player:drawSprite(frame1, frame2, axis)
    if axis % 2 == 0 then
        drawItem(frame1, (self.x - 1) * 8, (self.y - 1) * 8)
    else
        drawItem(frame2, (self.x - 1) * 8, (self.y - 1) * 8)
    end
end

function Player:render()
    if self.direction == "right" then
        self:drawSprite(playerSpriteRight1, playerSpriteRight2, self.x)
    end
    if self.direction == "left" then
        self:drawSprite(playerSpriteLeft1, playerSpriteLeft2, self.x)
    end
    if self.direction == "up" then
        self:drawSprite(playerSpriteUp1, playerSpriteUp2, self.y)
    end
    if self.direction == "down" then
        self:drawSprite(playerSpriteDown1, playerSpriteDown2, self.y)
    end
end

function Player:renderLives()
    local offset = 12
    for i=0,lives - 1 do
        if offset % 2 == 0 then
            drawItem(playerSpriteRight2, TILE_SIZE * offset, -11)
        else
            drawItem(playerSpriteRight1, TILE_SIZE * offset, -11)
        end
        offset = offset + 1
    end
end

function Player:titleMovement(dt)
    if self.movementCounter < movementInterval then
        self.movementCounter = self.movementCounter + dt
        return
    end
    if self.direction == 'right' then
        if self.x <= 24 then
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        else
            self.direction = 'left'
        end     
    end
    if self.direction == 'left' then
        if self.x > 12 then
            currentMap[self.y][self.x] = 3
            self.x = self.x - 1
        else
            self.direction = 'right'
            currentMap[self.y][self.x] = 2
            self.x = self.x + 1
        end     
    end
    self.movementCounter = 0
end

function Player:exitRequirementIsMet()
    return self.hasKey and self.hasRoyalTomb
end

function Player:loseLife()
    if self.hasScroll then
        self.hasScroll = false
    else
        lives = lives - 1
    end
    return lives
end