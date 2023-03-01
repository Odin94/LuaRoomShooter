Object = require 'libraries.classic.classic'
Timer = require 'libraries.enhanced_timer.EnhancedTimer'
Input = require 'libraries.boipushy.Input'

require 'utils'

screen_width, screen_height = 1200, 800

function love.load()
    love.window.setMode(screen_width, screen_height)
    love.window.setTitle ("LuaRoomShooter")
    utils_requireFiles(utils_getObjectFiles())

    input = Input()
    bind_input()

    current_room = Stage()
end

function love.update(dt)
    update_input()
    if current_room then current_room:update(dt) end
end

function love.draw()
    if current_room then current_room:draw() end
end

function gotoRoom(room_type, ...)
    current_room = _G[room_type](...) -- _G = global table that holds all global variables, so _G['Stage'] = Stage class
end


function bind_input()
    input:bind('f1', function() gotoRoom('Stage') end)
    input:bind('d', 'right')
    input:bind('a', 'left')
    input:bind('w', 'up')
    input:bind('s', 'down')

    input:bind('right', 'arrow_right')
    input:bind('left', 'arrow_left')
    input:bind('up', 'arrow_up')
    input:bind('down', 'arrow_down')

    --input:bind('f2', function() gotoRoom('RectangleRoom') end)
end

function update_input()
    current_room:reset_input()

    if input:down('right') then current_room:button_down_direction("right") end
    if input:down('left') then current_room:button_down_direction("left") end
    if input:down('up') then current_room:button_down_direction("up") end
    if input:down('down') then current_room:button_down_direction("down") end

    if input:pressed('arrow_right') then current_room.player:shoot("right") end
    if input:pressed('arrow_left') then current_room.player:shoot("left") end
    if input:pressed('arrow_up') then current_room.player:shoot("up") end
    if input:pressed('arrow_down') then current_room.player:shoot("down") end
end