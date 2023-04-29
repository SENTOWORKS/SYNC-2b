col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function infoicon(x,y,r,g,b,a)
    col(60,60,60)
    --Info Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(r,g,b,a)
    dRF(x+3,y+3,8,8)
    dL(x+2,y+4,x+2,y+10)
    dL(x+11,y+4,x+11,y+10)

    col(30,30,30)
    dL(x+2,y+4,x+4,y+2)
    dL(x+2,y+9,x+4,y+11)

    col(60,0,0)
    dL(x+11,y+4,x+9,y+2)
    dL(x+11,y+9,x+9,y+11)

    col(0,76,155)
    dRF(x+3,y+6,2,2)
    dRF(x+6,y+6,4,2)
    dL(x+6,y+6,x+6,y+9)
    dL(x+9,y+5,x+9,y+9)
end