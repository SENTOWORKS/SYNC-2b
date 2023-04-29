col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function seticon(x,y,r,g,b,a)
    col(60,60,60)
    --Settings Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(r,g,b,a)
    dL(x+3,y+2,x+3,y+12)
    dL(x+6,y+2,x+6,y+12)
    dL(x+9,y+2,x+9,y+12)
    dL(x+2,y+5,x+5,y+5)
    dL(x+5,y+10,x+8,y+10)
    dL(x+8,y+3,x+11,y+3)
end