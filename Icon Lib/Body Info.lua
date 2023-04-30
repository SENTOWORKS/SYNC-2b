col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF

function infoicon(infox,infoy,r,g,b,a)
    col(60,60,60)
    --Info Button
    dRF(infox,infoy+1,14,12)
    dL(infox+1,infoy,infox+13,infoy)
    dL(infox+1,infoy+13,infox+13,infoy+13)

    col(r,g,b,a)
    dRF(infox+3,infoy+3,8,8)
    dL(infox+2,infoy+4,infox+2,infoy+10)
    dL(infox+11,infoy+4,infox+11,infoy+10)

    col(30,30,30)
    dL(infox+2,infoy+4,infox+4,infoy+2)
    dL(infox+2,infoy+9,infox+4,infoy+11)

    col(60,0,0)
    dL(infox+11,infoy+4,infox+9,infoy+2)
    dL(infox+11,infoy+9,infox+9,infoy+11)
end