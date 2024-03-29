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
    simulator:setProperty("ExampleNumberProperty", 123)
    simulator:setProperty("FONT1", "00019209B400AAAA793CA54A555690015244449415500BA00049038000092549F6DE592EE7CEE79EB792F39EF3DEE492F7DEF79E104110490A201C7008A04504")
    simulator:setProperty("FONT2", "FFFE57DAD75C7246D6DCF34EF3487256B7DAE92E64D4B75A924EBEDAF6DA56D4D74856B2D75A711CE924B6DEB6A4B6FAB55AB524E54ED24C911264965400000E")


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
        simulator:setInputBool(31, simulator:getIsClicked(1))       -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
        simulator:setInputNumber(31, simulator:getSlider(1))        -- set input 31 to the value of slider 1

        simulator:setInputBool(32, simulator:getIsToggled(2))       -- make button 2 a toggle, for input.getBool(32)
        simulator:setInputNumber(32, simulator:getSlider(2) * 50)   -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

ticks = 0
function onTick()
    
    inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)

	powerswitch = isPressed and isPointInRectangle(inputX, inputY, 14, 24, 7,7)
	recallswitch = isPressed and isPointInRectangle(inputX, inputY, 22, 24, 7,7)
    fmamswitch = isPressed and isPointInRectangle(inputX, inputY, 14, 1, 7,22)
    seekleft = isPressed and isPointInRectangle(inputX, inputY, 30,11,6,4)
	seekright = isPressed and isPointInRectangle(inputX, inputY, 30,16,6,4)
	autoseekleft = isPressed and isPointInRectangle(inputX, inputY, 30,21,6,8)
	autoseekright = isPressed and isPointInRectangle(inputX, inputY, 30,2,6,8)


    ticks = ticks + 1
    pwr = false
    frq = 88
    seek = true
end

function onDraw()

--Radio Boxes
col(10,0,0)
dRF(14,24,7,7)
dRF(14,1,7,22)

dRF(22,24,7,7)
dRF(22,1,7,22)

dRF(30,1,7,30)
dRF(38,1,7,30)


--Power Button
if pwr then
	col(0,100,0,150)
else
	col(60,0,0,150)
end

dL(16,25,19,25)
dL(15,27,18,27)
dL(16,29,19,29)
dL(19,26,19,29)

col(60,60,60)

--Source Select
dL(23,25,23,30)
dL(25,25,25,30)
dL(27,25,27,30)

--AM/FM
dL(17,13,17,9)

if fm then
	col(200,200,200)
	dst(14,15,"FM",1,4)
	col(60,60,60)
	dst(14,2,"AM",1,4)
	mhz = string.format("%03d",frq)
	dst(22,7,mhz,1,4)
else
	col(200,200,200)
	dst(14,2,"AM",1,4)
	col(60,60,60)
	dst(14,15,"FM",1,4)
	mhz = string.format("%04d",frq)
	dst(22,5,mhz,1,4)
end

--RDS
if seek then
	dst(38,2,"SEEKING",1,4)
else	
--	rds = chr(rds1) .. chr(rds2) .. chr(rds3) .. chr(rds4) .. chr(rds5) .. chr(rds6) .. chr(rds7)
--	dst(38,2,rds,1,4)
end

--Seek
--AS R
dL(31, 6,33 ,4)
dL(35, 6,32 ,3)

dL(31, 9,34 ,6)
dL(35, 9,32 ,6)

dL(31, 3,36 ,3)
dL(33, 6,33 ,3)

--AS L
dL(31,22,34,25)
dL(35,22,32,25)

dL(31,25,34,28)
dL(35,25,32,28)

dL(35,28,30,28)
dL(33,28,33,24)

--L
dL(31,17,34,20)
dL(35,17,32,20)

--R
dL(31,14,34,11)
dL(35,14,32,11)

end




col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inb = input.getBool
inn = input.getNumber
dTF = screen.drawTriangleF
chr = string.char
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