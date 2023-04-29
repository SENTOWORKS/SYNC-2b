--CC-L03
inb = input.getBool
inn = input.getNumber

function onTick()
tp = inn(10)
tf = property.getBool("Temperature Unit")
eauto = inb(11)
max = inb(12)
auto = inb(13)
pwr = inb(14)

inputX = input.getNumber(3)
inputY = input.getNumber(4)
isPressed = input.getBool(1)
pulse = input.getBool(2)

up = isPressed and isPointInRectangle(inputX, inputY, 15, 1, 5, 5) or pulse and isPointInRectangle(inputX, inputY, 15, 1, 5, 5)
down = isPressed and isPointInRectangle(inputX, inputY, 19, 1, 5, 5) or pulse and isPointInRectangle(inputX, inputY, 19, 1, 5, 5)
if eauto then
	oauto = isPressed and isPointInRectangle(inputX, inputY, 26,9,9,22)
	omax = isPressed and isPointInRectangle(inputX, inputY, 36,14,9,17)
else
	omax =  isPressed and isPointInRectangle(inputX, inputY, 26,9,9,22)
end

opwr = isPressed and isPointInRectangle(inputX, inputY, 26,1,9,7)

	output.setBool(1, up)
	output.setBool(2, down)
if eauto then
	output.setBool(3, oauto)
end
	output.setBool(4, omax)
	output.setBool(5, opwr)
	output.setBool(6, eauto)
end

function isPointInRectangle(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end

col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
dTF = screen.drawTriangleF

function onDraw()


if tf then
	tp0 = tp*1.8 + 32
	unit = " F"
else
	tp0 = tp
	unit = " C"
end
tp1 = math.floor(tp0)
tp2 = tp%1
tp3 = tp2*10
tp4 = math.floor(tp3+0.5)

col(60,60,60)
tmp = string.format("%02d.%01d",tp1, tp4)
tempo = tostring(tmp) .. unit

col(0,0,0)
--Black Boxes

dRF(16,1,9,7)
dRF(16,9,9,22)

dRF(26,1,9,7)
dRF(26,9,9,22)

if eauto then
	dRF(36,13,9,18)
end


-- Set Temp Text
col(60,60,60)
if tp == 15 then
	dst(17,14,"LOW",1,4)
else
	if tp == 35 then
		dst(17,12,"HIGH",1,4)
	else
		dst(17,10,tempo,1,4)
		dRF(22,20,1,1)

		-- Squaring The C
		dRF(18,12,1,1)
		dRF(22,12,1,1)

		dRF(19,14,1,1)
	end
end
-- Arrows
col(150,0,0)
dTF(20,2,20,8,17,5)

col(0,0,150)
dTF(21,2,21,8,24,5)


if eauto then
	col(60,60,60)
	dst(27,14,"AUTO",1,4)
	if auto then
		col(255,294,0)
	else
		col(5,5,5)
	end
	dL(28,11,33,11)

	if max then
		col(255,294,0)
	else
		col(5,5,5)
	end
	dL(38,15,43,15)
	col(80,15,0)
	dst(37,18,"MAX",1,4)
else
	if max then
		col(255,294,0)
	else
		col(5,5,5)
	end
	dL(28,11,33,11)
	
	col(80,15,0)
	dst(27,15,"MAX",1,4)
end

	if pwr then
		col(0,100,0,150)
	else
		col(150,0,0)
	end
dL(29,2,32,2)

dL(28,4,31,4)

dL(29,6,32,6)

dL(32,3,32,6)

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
ci=c:byte()-31 if 0<ci and ci<=FONT_S then
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