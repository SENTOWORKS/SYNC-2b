col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF

function sapicon(x,y)
    col(60,60,60)
    --SAP-500 Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)

    col(50,0,0)
    dRF(x+3,y+3,7,7)

    col(90,0,0)
    dRF(x+5,y+6,3,2)

	col(10,10,10)
	dRF(x+10,y+2,2,10)
    dL(x+10,y+3,x+3,y+3)
    dL(x+10,y+10,x+3,y+10)
    dL(x+2,y+4,x+2,y+10)
    dL(x+3,y+3,x+3,y+5)
    dL(x+3,y+10,x+3,y+8)
end