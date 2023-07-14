--CC-L02

col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inb = input.getBool
inn = input.getNumber
dTF = screen.drawTriangleF
chr = string.char

function onTick()
fm = inb(1)
pwr = inb(2)
frq = inn(1)
rds1 = inn(2)
rds2 = inn(3)
rds3 = inn(4)
rds4 = inn(5)
rds5 = inn(6)
rds6 = inn(7)
rds7 = inn(8)
seek = inb(4)
pre = inb(5)

output.setBool(1,pwr)
output.setNumber(1,frq)

end

function onDraw()
--Radio Boxes
col(0,0,0)
dRF(14,24,7,7)
dRF(14,1,7,22)

dRF(22,24,7,7)
dRF(22,1,7,22)

dRF(30,1,7,30)
dRF(38,1,7,30)


--Power Button
if pwr then
	col(0,100,0,150)
else
	col(60,0,0,150)
end
dL(16,25,19,25)
dL(15,27,18,27)
dL(16,29,19,29)
dL(19,26,19,29)

col(60,60,60)

--Source Select
dL(23,25,23,30)
dL(25,25,25,30)
dL(27,25,27,30)

--AM/FM
dL(17,13,17,9)

if fm or pre then
	col(200,200,200)
	dst(14,15,"FM",1,4)
	col(60,60,60)
	dst(14,2,"AM",1,4)
	mhz = string.format("%03d",frq)
	dst(22,7,mhz,1,4)
else
	col(200,200,200)
	dst(14,2,"AM",1,4)
	col(60,60,60)
	dst(14,15,"FM",1,4)
	mhz = string.format("%04d",frq)
	dst(22,5,mhz,1,4)
end

--RDS
if seek then
	dst(38,2,"SEEKING",1,4)
else	
	rds = chr(rds1) .. chr(rds2) .. chr(rds3) .. chr(rds4) .. chr(rds5) .. chr(rds6) .. chr(rds7)
	dst(38,2,rds,1,4)
end

--Seek
--AS R
dL(31, 6,33 ,4)
dL(35, 6,32 ,3)

dL(31, 9,34 ,6)
dL(35, 9,32 ,6)

dL(31, 3,36 ,3)
dL(33, 6,33 ,3)

--AS L
dL(31,22,34,25)
dL(35,22,32,25)

dL(31,25,34,28)
dL(35,25,32,28)

dL(35,28,30,28)
dL(33,28,33,24)

--L
dL(31,17,34,20)
dL(35,17,32,20)

--R
dL(31,14,34,11)
dL(35,14,32,11)

end

-- Needed function below

drf=screen.drawRectF
pgt=property.getText
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