col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF

function engicon(engx,engy)
    col(60,60,60)
    --Eng Button
    dRF(engx,engy+1,14,12)
    dL(engx+1,engy,engx+13,engy)
    dL(engx+1,engy+13,engx+13,engy+13)

	col(23,23,23)
	dL(engx+6,engy+1,engx+10,engy+1)
	dL(engx+7,engy+2,engx+9,engy+2)

	col(20,20,20)
	dRF(engx+6,engy+3,4,8)
	dL(engx+5,engy+5,engx+5,engy+11)
	dL(engx+4,engy+8,engx+4,engy+10)
	dL(engx+3,engy+7,engx+3,engy+11)
	dL(engx+6,engy+11,engx+9,engy+11)
	
	col(15,15,15)
	dL(engx+5,engy+12,engx+10,engy+12)
	
	col(0,0,0)
	dL(engx+10,engy+5,engx+10,engy+10)
end