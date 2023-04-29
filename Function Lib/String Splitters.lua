--Splits Text String Into Seperate Entries In A Table
--Table Referance = TABLENAME[ENTRY NUMBER]
function splitstr(text)
    t = {}
    for i = 1, #text do
        t[i] = string.sub(text,i,i)
    end
    return t
end

--Splits Text String By Comma In A Table
function commasplit(str)
    t = {}
    i = 1
    for word in str:gmatch('[^,%s]+') do
        t[i] = tonumber(word)
        i = i + 1
    end
    return t
end