-- User: Odin
-- Date: 02.05.2017
-- Time: 11:53
require 'objects.GameObject'

Actor = GameObject:extend()

function Actor:new(area, x, y, opts)
    Actor.super.new(self, area, x, y, opts)
    --self.timer:after(love.math.random(2, 4), function() self.timer:tween(1, self, { radius = 0 }, 'in-out-quad',
    --   function() self.dead = true end)
    --end)

    self.vertical_direction = ""
    self.horizontal_direction = ""
    self.radius = 35

    self.color_red, self.color_green, self.color_blue = 133, 20, 75
end

function Actor:update(dt)
    Actor.super.update(self, dt)
    self:move(dt)
end

function Actor:draw()
    love.graphics.setColor(self.color_red, self.color_green, self.color_blue)
    love.graphics.circle('fill', self.x, self.y, self.radius)
end

function Actor:shoot(direction)
    if direction == "up" then self.area:addGameObject('Bullet', self.x, self.y - self.radius - 15, { direction = "up" })
    elseif direction == "down" then self.area:addGameObject('Bullet', self.x, self.y + self.radius + 15, { direction = "down" })
    elseif direction == "left" then self.area:addGameObject('Bullet', self.x - self.radius - 15, self.y, { direction = "left" })
    elseif direction == "right" then self.area:addGameObject('Bullet', self.x + self.radius + 15, self.y, { direction = "right" })
    end
end

function Actor:move(dt)
    local speed = 300

    if self.horizontal_direction == "right" then self.x = self.x + speed * dt
    elseif self.horizontal_direction == "left" then self.x = self.x - speed * dt
    end

    if self.vertical_direction == "up" then self.y = self.y - speed * dt
    elseif self.vertical_direction == "down" then self.y = self.y + speed * dt
    end
end