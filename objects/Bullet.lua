-- User: Odin
-- Date: 03.05.2017
-- Time: 11:57
require 'objects.GameObject'

Bullet = GameObject:extend()

function Bullet:new(area, x, y, opts)
    Bullet.super.new(self, area, x, y, opts)

    self.radius = 15
end

function Bullet:update(dt)
    Bullet.super.update(self, dt)
    self:move(dt)

    if self:is_offscreen() then self.dead = true end
end

function Bullet:draw()
    love.graphics.setColor(255, 65, 54)
    love.graphics.circle('fill', self.x, self.y, self.radius)
end

function Bullet:move(dt)
    local speed = 600

    if not self.direction then self.direction = "right" end

    if self.direction == "right" then self.x = self.x + speed * dt
    elseif self.direction == "left" then self.x = self.x - speed * dt
    end

    if self.direction == "up" then self.y = self.y - speed * dt
    elseif self.direction == "down" then self.y = self.y + speed * dt
    end
end

function Bullet:is_offscreen()
    return self.x > screen_width + self.radius or self.x + self.radius < 0 or
            self.y + self.radius < 0 or self.y > screen_height + self.radius
end