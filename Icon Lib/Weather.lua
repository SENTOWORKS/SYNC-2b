col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function weathericon(x,y)
    col(60,60,60)
    --Weather Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)
    
    col(127,127,0)
    dRF(x+4,y+2,3,5)
    dL(x+3,y+3,x+3,y+6)
    dL(x+2,y+1,x+3,y+2)
    dL(x+1,y+3,x+2,y+4)
    dL(x+1,y+5,x+2,y+6)
    dL(x+2,y+7,x+3,y+8)
    dL(x+4,y+8,x+5,y+9)

    col(20,20,20)
    dRF(x+7,y+2,5,10)
    dL(x+6,y+8,x+6,y+4)
    
    col(10,10,10)
    dL(x+12,y+3,x+12,y+11)
    dL(x+12,y+11,x+10,y+13)
    dL(x+10,y+12,x+8,y+12)
    dL(x+8,y+12,x+6,y+10)
    dL(x+6,y+10,x+6,y+7)
    dL(x+5,y+8,x+5,y+4)
    dL(x+5,y+5,x+7,y+3)
    dL(x+7,y+3,x+7,y+1)
	dL(x+8,y+1,x+11,y+1)
    dL(x+10,y+1,x+12,y+3)
    dL(x+7,y+7,x+9,y+7)
    dL(x+8,y+7,x+10,y+9)
    dL(x+12,y+5,x+10,y+7)
	dL(x+7,y+3,x+9,y+5)
end