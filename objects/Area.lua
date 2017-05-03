-- User: Odin
-- Date: 03.05.2017
-- Time: 10:32

Area = Object:extend()

function Area:new(room)
    self.room = room
    self.game_objects = {}
end

function Area:update(dt)
    for i = #self.game_objects, 1, -1 do -- iterating over game_objects from # of obj to 1 [lua is 1-indexed] with step -1
        local game_object = self.game_objects[i]
        game_object:update(dt)
        if game_object.dead then table.remove(self.game_objects, i) end
    end
end

function Area:draw()
    for _, game_object in ipairs(self.game_objects) do game_object:draw() end
end

function Area:addGameObject(game_object_type, x, y, ops)
    local opts = opts or {}
    for k, v in pairs(opts) do
        print(k)
        print(v)
    end

    local game_object = _G[game_object_type](self, x or 0, y or 0, opts)
    table.insert(self.game_objects, game_object)
    return game_object
end