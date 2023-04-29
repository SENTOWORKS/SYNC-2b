function clamp(inVal, minVal, maxVal)
    if inVal < minVal then
        return minVal
    elseif inVal > maxVal then
        return maxVal
    else
        return inVal
    end
end