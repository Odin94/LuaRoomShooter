-- User: Odin
-- Date: 03.05.2017
-- Time: 10:34

GameObject = Object:extend()

function GameObject:new(area, x, y, opts)
    local opts = opts or {}
    if opts then
        for k, v in pairs(opts) do
            print(k)
            print(v)
            self[k] = v
        end -- add opts as instance vars
    end

    self.area = area
    self.x, self.y = x, y
    self.id = UUID()
    self.dead = false
    self.timer = Timer()
end

function GameObject:update(dt)
    if self.timer then self.timer:update(dt) end
end

function GameObject:draw()
end