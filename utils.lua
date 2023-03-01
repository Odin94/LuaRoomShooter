-- User: Odin
-- Date: 02.05.2017
-- Time: 11:37

--- goes through all files in a folder and adds them to a string table
function utils_recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        local info = love.filesystem.getInfo(file)
        if info.type == 'file' then
            table.insert(file_list, file)
        elseif info.type == 'directory' then
            utils_recursiveEnumerate(file, file_list)
        end
    end
end

function utils_getObjectFiles()
    local object_files = {}
    utils_recursiveEnumerate('objects', object_files)
    return object_files
end

--- imports all passed files
function utils_requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function UUID()
    local fn = function(x)
        local r = love.math.random(16) - 1
        r = (x == "x") and (r + 1) or (r % 4) + 9
        return ("0123456789abcdef"):sub(r, r)
    end
    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end

--- returns a floating point random between min and max (regular love.math.random returns integers only if bounded)
--- if called with only one argument it returns a random value between 0 and the argument
function random(min, max)
    local max = max or min
    if max == min then min = 0 end
    return love.math.random() * (max - min) + min
end