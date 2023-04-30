col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
dTF = screen.drawTriangleF

function obdicon(x,y)
    col(60,60,60)
    --OBD Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)


	col(20,20,20)
	dL(x+1,y+6,x+10,y+6)
	dL(x+1,y+11,x+10,y+11)
	dL(x+1,y+6,x+1,y+12)
	dL(x+4,y+6,x+4,y+12)
	dL(x+9,y+6,x+9,y+12)
	dL(x+6,y+8,x+6,y+10)
	dL(x+8,y+8,x+8,y+10)
	dL(x+9,y+10,x+13,y+10)
	dL(x+12,y+8,x+12,y+10)
	dL(x+11,y+8,x+11,y+5)

    dRF(x+2,y+2,5,2)
	dRF(x+8,y+2,2,2)

end