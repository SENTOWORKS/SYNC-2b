-- Up/Down Counter w/ Reset & Clamp
-- **BOOL** up,down,rst,clamp
-- **NUM** incr,nmax,nmin,nrst
-- Counter(UP,DOWN,Reset,Clamp_Toggle,Increment,Clamp_MAX,Clamp_MIN,Reset_Value )
x = 0
function counter(up,down,rst,clamp,incr,nmax,nmin,nrst)
  if up then
      if clamp then
          x = math.min((x+incr),nmax)
      else
          x = x+incr
      end
  end
  if down then
      if clamp then
          x = math.max((x-incr),nmin)
      else
          x = x-incr
      end
  end
  if rst then
      x = nrst
  end 
  return x
end