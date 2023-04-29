col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function mapicon(x,y,r,g,b,a)
    col(60,60,60)
    --Map Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(r,g,b,a)
    dL(x+3,y+3,x+7,y+3)
    dL(x+2,y+4,x+9,y+4)
    dL(x+1,y+5,x+4,y+5)
    dL(x+1,y+6,x+3,y+6)
    dL(x+1,y+7,x+3,y+7)
    dL(x+1,y+8,x+4,y+8)
    dL(x+2,y+9,x+9,y+9)
    dL(x+3,y+10,x+7,y+10)
    dL(x+6,y+5,x+11,y+5)
    dL(x+7,y+6,x+13,y+6)
    dL(x+7,y+7,x+13,y+7)
    dL(x+6,y+8,x+11,y+8)
end