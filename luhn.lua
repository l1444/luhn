function Verify(number)
    number = string.reverse(tostring(number))
    local len = string.len(number)
    local b = false; local add = 0;

    for i = 1, len do
        local n = tonumber(string.sub(number, i, i))
        if b == true then
            local multi = n * 2
            if multi > 9 then
                multi = multi - 9
                add = add + multi
            else
                add = add + multi
            end
            b = false
        else
            add = add + n
            b = true
        end
    end
    local result = add % 10
    if result == 0 then
        return true
    else
        return false, result
    end

end

function Generate(n)
    local number = n
    local len = string.len(tostring(number))
    local pin = true; local add = 0;
    number = string.reverse(tostring(number))
    number = number .. 0;
    for i = 1, len do
        local d = tonumber(string.sub(number, i, i))
        if pin == true then
            local mu = d * 2;
            if mu > 9 then
                add = add + mu;
                add = add - 9;
            else
                add = add + mu;
            end
            pin = false;
        else
            add = add + d;
            pin = true;
        end
    end
    local result = 10 - add % 10;
    if result > 9 then
        result = string.reverse(tostring(result))
        result = string.match(result, "%d")
    end
    return n .. result
end


