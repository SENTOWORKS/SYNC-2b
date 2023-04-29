col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF

function radioicon(x,y,r,g,b,a)
    col(60,60,60)
    --Radio Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(r,g,b,a)
    dL(x+4,y+3,x+10,y+3)
    dL(x+4,y+9,x+10,y+9)
    dL(x+3,y+3,x+3,y+10)
    dR(x+7,y+9,2,2)
    dR(x+7,y+3,2,2)
end