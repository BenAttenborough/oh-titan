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
    self.right1 = love.graphics.newImage('sprites/alice-001.png')
    self.right2 = love.graphics.newImage('sprites/alice-002.png')
    self.left1 = love.graphics.newImage('sprites/alice-003.png')
    self.left2 = love.graphics.newImage('sprites/alice-004.png')
    self.down1 = love.graphics.newImage('sprites/alice-005.png')
    self.down2 = love.graphics.newImage('sprites/alice-006.png')
    self.up1 = love.graphics.newImage('sprites/alice-007.png')
    self.up2 = love.graphics.newImage('sprites/alice-008.png')
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
                if level == 2 then
                    gStateMachine:change('win')
                else
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

function Player:draw(frame1, frame2, axis)
    love.graphics.setColor(1,1,1)
    if axis % 2 == 0 then
        playarea_draw_sprite(frame1, (self.x - 1) * 8, (self.y - 1) * 8)
    else
        playarea_draw_sprite(frame2, (self.x - 1) * 8, (self.y - 1) * 8)
    end
end

function Player:render()
    if self.direction == "right" then
        love.graphics.setColor(1,1,1)
        self:draw(self.right1, self.right2, self.x)
    end
    if self.direction == "left" then
        love.graphics.setColor(1,1,1)
        self:draw(self.left1, self.left2, self.x)
    end
    if self.direction == "down" then
        love.graphics.setColor(1,1,1)
        self:draw(self.down1, self.down2, self.y)
    end
    if self.direction == "up" then
        love.graphics.setColor(1,1,1)
        self:draw(self.up1, self.up2, self.y)
    end
    
end

function Player:renderLives()
    local offset = 12
    love.graphics.setColor(1,1,1)
    for i=0,lives - 1 do
        if offset % 2 == 0 then
            playarea_draw_sprite(self.right1, TILE_SIZE * offset, -11)
        else
            playarea_draw_sprite(self.right2, TILE_SIZE * offset, -11)
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