--Vertical Gradient
function GradH(x, y, w, h, r1, g1, b1, t1, r2, g2, b2, t2)
    for i = 0, w, 1
    do
        screen.setColor(r1 + i*((r2-r1)/w), g1 + i*((g2-g1)/w), b1 + i*((b2-b1)/w), t1 + i*((t2-t1)/w))
        screen.drawRectF(x+i, y, 1, h)
    end
end

--Horizonal Gradient
function GradV(x, y, w, h, r1, g1, b1, o1, r2, g2, b2, o2)
    for i = 0, h, 1
    do
     screen.setColor(r1 + i*((r2-r1)/h), g1 + i*((g2-g1)/h), b1 + i*((b2-b1)/h), o1 + i*((o2-o1)/h))
     screen.drawRectF(x, y+i, w, 1)
    end
   end