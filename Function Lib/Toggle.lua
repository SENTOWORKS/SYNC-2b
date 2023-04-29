function toggle(clicked)
    if clicked and out and active then
        out = false
        active = false
    else
        if clicked and not out and active then 
            out = true
            active = false
        end
    end
    if not clicked then
        active = true
    end
    return out
    end