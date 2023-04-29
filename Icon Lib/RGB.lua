col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function rgbicon(x,y)
    col(60,60,60)
    --RGB Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)
    
    col(204,204,0)
    dL(x+6,y+3,x+10,y+3)
    dL(x+5,y+4,x+11,y+4)
    dL(x+4,y+5,x+12,y+5)
    dL(x+11,y+5,x+11,y+8)
    dL(x+4,y+8,x+12,y+8)
    dL(x+5,y+9,x+11,y+9)
    dL(x+6,y+10,x+10,y+10)

    col(255,0,0)
    dL(x+6,y+9,x+10,y+9)
    dL(x+5,y+8,x+11,y+8)

    col(0,255,0)
    dL(x+4,y+7,x+11,y+7)
    dL(x+4,y+6,x+11,y+6)

    col(0,0,255)
    dL(x+5,y+5,x+11,y+5)
    dL(x+6,y+4,x+10,y+4)

    col(20,20,20)
    dL(x+5,y+5,x+8,y+5)
    dL(x+6,y+5,x+6,y+8)
    dL(x+5,y+8,x+8,y+8)
    dL(x+2,y+5,x+4,y+5)
    dL(x+1,y+6,x+4,y+6)
    dL(x+1,y+7,x+4,y+7)
    dL(x+2,y+8,x+4,y+8)
end