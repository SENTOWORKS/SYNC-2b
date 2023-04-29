function decode(cn,ca)
    t = {}
    text = {}
    for i = 1, #ca do
        t[i] = string.sub(ca,i,i)
    end
    for o = 1, cn do
        text[o] = string.char(t[o*2-1] .. t[o*2])
    end
    name = table.concat(text)
    return name
end

function encode(text)
    t = {}
    te = {}
    texto = string.upper(text)
    for i = 1, #texto do
        t[i] = string.sub(texto,i,i)
    end

    for o = 1, #texto do
        te[o] = string.byte(t[o])
    end

    name = table.concat(te)
    output.setNumber(1,#texto)
---@diagnostic disable-next-line: param-type-mismatch
    output.setNumber(2,name)

end