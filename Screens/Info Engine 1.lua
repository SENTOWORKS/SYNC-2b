-- Author: SENTOWORKS
-- GitHub: https://github.com/SENTOWORKS/SYNC-2b
-- Workshop: 
--
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey


--[====[ HOTKEYS ]====]
-- Press F6 to simulate this file
-- Press F7 to build the project, copy the output from /_build/out/ into the game to use
-- Remember to set your Author name etc. in the settings: CTRL+COMMA


--[====[ EDITABLE SIMULATOR CONFIG - *automatically removed from the F7 build output ]====]
---@section __LB_SIMULATOR_ONLY__
do
    ---@type Simulator -- Set properties and screen sizes here - will run once when the script is loaded
    simulator = simulator
    simulator:setScreen(1, "2x1")
    simulator:setProperty("FONT1", "00019209B400AAAA793CA54A555690015244449415500BA00049038000092549F6DE592EE7CEE79EB792F39EF3DEE492F7DEF79E104110490A201C7008A04504")
    simulator:setProperty("FONT2", "FFFE57DAD75C7246D6DCF34EF3487256B7DAE92E64D4B75A924EBEDAF6DA56D4D74856B2D75A711CE924B6DEB6A4B6FAB55AB524E54ED24C911264965400000E")
    simulator:setProperty("Engine", "MX-13")
    simulator:setProperty("Fuel", "DERV")
    simulator:setProperty("Gearbox", "ASTRONIC 12")
    simulator:setProperty("Driveline", "6x4x2")
    simulator:setProperty("PTO", "13H BTR")
    simulator:setProperty("Regen", "Not Fitted")


    -- Runs every tick just before onTick; allows you to simulate the inputs changing
    ---@param simulator Simulator Use simulator:<function>() to set inputs etc.
    ---@param ticks     number Number of ticks since simulator started
    function onLBSimulatorTick(simulator, ticks)

        -- touchscreen defaults
        local screenConnection = simulator:getTouchScreen(1)
        simulator:setInputBool(1, screenConnection.isTouched)
        simulator:setInputNumber(1, screenConnection.width)
        simulator:setInputNumber(2, screenConnection.height)
        simulator:setInputNumber(3, screenConnection.touchX)
        simulator:setInputNumber(4, screenConnection.touchY)

        -- NEW! button/slider options from the UI
        simulator:setInputBool(3, simulator:getIsClicked(1))
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

drf=screen.drawRectF
pgt=property.getText
dr = screen.drawRect
col = screen.setColor
dTF = screen.drawTriangleF
title = {}
text = {}

function onTick()

    title[1] = "ENGINE"
    title[2] = "FUEL"
    title[3] = "GEARBOX"
    title[4] = "DRIVELINE"
    title[5] = "PTO"
    title[6] = "REGEN"

    text[1] = pgt("Engine")
    text[2] = pgt("Fuel")
    text[3] = pgt("Gearbox")
    text[4] = pgt("Driveline")
    text[5] = pgt("PTO")
    text[6] = pgt("Regen")
    
    inputX = input.getNumber(3)
    inputY = input.getNumber(4)
    Pressed = input.getBool(1)
    Pulse = input.getBool(2)
    pulse = input.getBool(3)


    up = Pressed and iPIR(inputX, inputY, 8, 2, 5, 5)
    down = Pressed and iPIR(inputX, inputY, 58, 2, 5, 5)
    line = counter(down,up,true,1,3,0,0,7, false) +1
    end
    
    function onDraw()

        dTF(13,3,13,9,10,6)
        dTF(60,3,60,9,63,6)

        col(20,20,20)
        drf(21,0,7,33)
        
        drf(36,0,7,33)
        drf(51,0,7,33)
        
        col(15,15,15)
        dr(21,0,6,31)
        
        dr(36,0,6,31)
        dr(51,0,6,31)

        col(150,150,150)
        cdst(14,title[line],1,4,pulse,1)
        cdst(21,text[line],1,4,pulse,2)
    
        cdst(29,title[line+1],1,4,pulse,3)
        cdst(36,text[line+1],1,4,pulse,4)
    
        cdst(44,title[line+2],1,4,pulse,5)
        cdst(51,text[line+2],1,4,pulse,6)
    end



-- cdst(Y,TEXT,SIZE,ORIENT,pulse)
-- pulse is supplied from external blinker in a constant on for the text scroll.

-- Scrolling Text Requires All Following Functions
drf=screen.drawRectF
pgt=property.getText
val = {}
val[1] = 0
val[2] = 0
val[3] = 0
val[4] = 0
val[5] = 0
val[6] = 0
val[7] = 0


function cdst(x,text,size,orient,p,inst)
	tt = splitstr(text)
	if #text > 7 then
	num = counter(p,false,true,1,#text-6,0,0,inst, true)
	texto = tt[num+1] .. tt[num+2] .. tt[num+3] .. tt[num+4] .. tt[num+5] .. tt[num+6] .. tt[num+7]
	dst(x,2,texto,size,orient)
	else
	dst(x,cenjus(text),text,size,orient)
	end
end

function counter(up,down,clamp,incr,nmax,nmin,nrst,inst, loop)
  if up then
      if clamp then
          val[inst] = math.min((val[inst]+incr),nmax)
      else
          val[inst] = val[inst]+incr
      end
  end
  if down then
      if clamp then
          val[inst] = math.max((val[inst]-incr),nmin)
      else
          val[inst] = val[inst]-incr
      end
  end
  if val[inst] == nmax and loop then
      val[inst] = nrst
  end 
  return val[inst]
end

function splitstr(text)
    t = {}
    for i = 1, #text do
        t[i] = string.sub(text,i,i)
    end
    return t
end

function cenjus(text)
z = 17-(2*#text)
y = clamp(z,2,16)
return y
end

function clamp(inVal, minVal, maxVal)
	if inVal < minVal then
		return minVal
	elseif inVal > maxVal then
		return maxVal
	else return inVal
	end
end

FONT=pgt("FONT1")..pgt("FONT2")
FONT_D={}
FONT_S=0
for n in FONT:gmatch("....")do FONT_D[FONT_S+1]=tonumber(n,16)FONT_S=FONT_S+1 end
function dst(x,y,t,s,r,m)s=s or 1
r=r or 1
if r>2 then t=t:reverse()end
t=t:upper()for c in t:gmatch(".")do
ci=c:byte()-31 if 0 < ci and ci <= FONT_S then
for i=1,15 do
if r>2 then p=2^i else p=2^(16-i)end
if FONT_D[ci]&p==p then
xx,yy=((i-1)%3)*s,((i-1)//3)*s
if r%2==1 then drf(x+xx,y+yy,s,s)else drf(x+5-yy,y+xx,s,s)end
end
end
if FONT_D[ci]&1==1 and not m then
i=2*s
else
i=4*s
end
if r%2==1 then x=x+i else y=y+i end
end
end
end

function iPIR(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end