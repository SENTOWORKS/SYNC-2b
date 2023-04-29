col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function auxicon(x,y)
col(60,60,60)
--Aux Button
dRF(x,y+1,14,12)
dL(x+1,y,x+13,y)
dL(x+1,y+13,x+13,y+13)

col(0,10,50)
dL(x+3,y+1,x+6,y+1)
dL(x+3,y+3,x+6,y+3)
dL(x+6,y+2,x+7,y+2)
dL(x+7,y+1,x+10,y+1)
dL(x+7,y+3,x+10,y+3)
dL(x+3,y+5,x+10,y+5)
dL(x+9,y+5,x+9,y+8)
dL(x+3,y+8,x+10,y+8)
dL(x+3,y+10,x+10,y+10)
dL(x+6,y+10,x+6,y+12)
dL(x+3,y+10,x+3,y+12)
dL(x+3,y+12,x+10,y+12)
end

