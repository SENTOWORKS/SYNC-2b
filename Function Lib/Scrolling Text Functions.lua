-- cdst(Y,TEXT,SIZE,ORIENT,pulse,instance)
-- pulse is supplied from external blinker in a constant on for the text scroll.
-- instance is the text box number for scroll instance, add one to the val[x] = 0 for instance
-- Scrolling Text Requires All Following Functions
drf=screen.drawRectF
pgt=property.getText
val = {}
val[1] = 0
val[2] = 0
val[3] = 0
val[4] = 0
val[5] = 0
val[6] = 0
val[7] = 0


function cdst(x,text,size,orient,p,inst)
	tt = splitstr(text)
	if #text > 7 then
	num = counter(p,false,true,1,#text-6,0,0,inst, true)
	texto = tt[num+1] .. tt[num+2] .. tt[num+3] .. tt[num+4] .. tt[num+5] .. tt[num+6] .. tt[num+7]
	dst(x,2,texto,size,orient)
	else
	dst(x,cenjus(text),text,size,orient)
	end
end

function counter(up,down,clamp,incr,nmax,nmin,nrst,inst, loop)
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
  if val[inst] == nmax and loop then
      val[inst] = nrst
  end 
  return val[inst]
end

function splitstr(text)
    t = {}
    for i = 1, #text do
        t[i] = string.sub(text,i,i)
    end
    return t
end

function cenjus(text)
z = 17-(2*#text)
y = clamp(z,2,16)
return y
end

function clamp(inVal, minVal, maxVal)
	if inVal < minVal then
		return minVal
	elseif inVal > maxVal then
		return maxVal
	else return inVal
	end
end

FONT=pgt("FONT1")..pgt("FONT2")
FONT_D={}
FONT_S=0
for n in FONT:gmatch("....")do FONT_D[FONT_S+1]=tonumber(n,16)FONT_S=FONT_S+1 end
function dst(x,y,t,s,r,m)s=s or 1
r=r or 1
if r>2 then t=t:reverse()end
t=t:upper()for c in t:gmatch(".")do
ci=c:byte()-31 if 0 < ci and ci <= FONT_S then
for i=1,15 do
if r>2 then p=2^i else p=2^(16-i)end
if FONT_D[ci]&p==p then
xx,yy=((i-1)%3)*s,((i-1)//3)*s
if r%2==1 then drf(x+xx,y+yy,s,s)else drf(x+5-yy,y+xx,s,s)end
end
end
if FONT_D[ci]&1==1 and not m then
i=2*s
else
i=4*s
end
if r%2==1 then x=x+i else y=y+i end
end
end
end