
-- Both Functions Required
function cenjus(text)
    x = 17-2*#text 
    y = clamp(x,2,16)
    return y
end

function clamp(inVal, minVal, maxVal)
    if inVal < minVal then
        return minVal
    elseif inVal > maxVal then
        return maxVal
    else
        return inVal
    end
end