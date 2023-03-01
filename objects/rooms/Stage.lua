-- User: Odin
-- Date: 02.05.2017
-- Time: 23:05
require 'objects.Actor'

Stage = Object:extend()

function Stage:new()
    self.area = Area(self)
    self.timer = Timer()
    self.player = self.area:addGameObject('Actor', 200, 200)
    self.player.color_red, self.player.color_green, self.player.color_blue = 0/255, 116/255, 217/255

    self.area:addGameObject('Actor', 900, 400)

    self.background_red, self.background_green, self.background_blue = random(255)/255, random(255)/255, random(255)/255
    self.timer:every(0.05, function() self:shift_background_color() end)
end

function Stage:update(dt)
    if self.timer then self.timer:update(dt) end
    self.area:update(dt)
end

function Stage:draw()
    love.graphics.setBackgroundColor(self.background_red, self.background_green, self.background_blue)
    self.area:draw()
end

function Stage:shift_background_color()
    local color_to_shift = love.math.random(1, 3)
    local shift_intensity = 5.0

    if color_to_shift == 1 then self.background_red = self.background_red + random(-shift_intensity, shift_intensity)/255
    elseif color_to_shift == 2 then self.background_green = self.background_green + random(-shift_intensity, shift_intensity)/255
    else self.background_blue = self.background_blue + random(-shift_intensity, shift_intensity)/255
    end

    if self.background_red > 1 then self.background_red = 1
    elseif self.background_red < 0 then self.background_red = 0
    end

    if self.background_green > 1 then self.background_green = 1
    elseif self.background_green < 0 then self.background_green = 0
    end

    if self.background_blue > 1 then self.background_blue = 1
    elseif self.background_blue < 0 then self.background_blue = 0
    end
end

function Stage:reset_input()
    self.player.horizontal_direction = ""
    self.player.vertical_direction = ""
end

function Stage:button_down_direction(direction)
    if direction == "up" or direction == "down" then self.player.vertical_direction = direction
    else self.player.horizontal_direction = direction
    end
end