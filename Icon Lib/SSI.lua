col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF

function ssicon(x,y)
    col(60,60,60)
    --Super Select Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(10,10,10)
    dR(x+1,y+2,3,2)
    dR(x+1,y+9,3,2)
    dR(x+9,y+2,3,2)
    dR(x+9,y+9,3,2)
    
    dR(x+2,y+4,1,5)
    dR(x+10,y+4,1,5)
    dR(x+4,y+6,1,1)
    dR(x+8,y+6,1,1)
    dL(x+6,y+5,x+8,y+5)
    dL(x+6,y+8,x+8,y+8)
end