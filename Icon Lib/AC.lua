col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF


function acicon(x,y,r,g,b,a)
    col(60,60,60)
    --AC Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(r,g,b,a)
    dL(x+2,y+7,x+12,y+7)
    dL(x+2,y+7,x+2,y+5)
    dL(x+4,y+7,x+4,y+5)
    dL(x+6,y+7,x+6,y+5)
    dL(x+8,y+6,x+12,y+6)
    dRF(x+9,y+5,2,4)
end