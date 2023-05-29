-- Up/Down Counter w/ Reset & Clamp
-- **BOOL** up,down,rst,clamp,loop
-- **NUM** incr,nmax,nmin,nrst,inst
-- Counter(UP,DOWN,Reset,Clamp_Toggle,Increment,Clamp_MAX,Clamp_MIN,Reset_Value,Instance,Looping )
val = {}
val[1] = 0

function counter(up,down,reset,clamp,incr,nmax,nmin,nrst,inst, loop)
    if up then
        if clamp then
            val[inst] = math.min((val[inst]+incr),nmax)
        else
            val[inst] = val[inst]+incr
        end
    end
    if down then
        if clamp then
            val[inst] = math.max((val[inst]-incr),nmin)
        else
            val[inst] = val[inst]-incr
        end
    end
    if val[inst] == nmax and loop or reset then
        val[inst] = nrst
    end 
    return val[inst]
  end