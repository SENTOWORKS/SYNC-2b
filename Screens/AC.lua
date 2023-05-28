-- Author: SENTOWORKS
-- GitHub: <GithubLink>
-- Workshop: <WorkshopLink>
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
    simulator:setProperty("Heater Type", true)

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
        simulator:setInputBool(3, simulator:getIsToggled(1)) -- Unit
        simulator:setInputNumber(5, simulator:getSlider(1)) --Temperture

        simulator:setInputBool(32, simulator:getIsClicked(2)) -- rstpulse
 
        simulator:setInputBool(4, simulator:getIsToggled(3))
        simulator:setInputBool(5, simulator:getIsToggled(4))
        simulator:setInputBool(6, simulator:getIsToggled(5))
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

col = screen.setColor
dL = screen.drawLine
dR = screen.drawRect
dRF = screen.drawRectF
inn = input.getNumber
dTF = screen.drawTriangleF
inb = input.getBool
osb = output.setBool
pgb = property.getBool

function onTick()

    tempunit = inb(3)
    otemp = inn(5)
    enableauto = pgb("Heater Type")

    inputX = inn(3)
    inputY = inn(4)
    Pressed = inb(1)
    Pulse = inb(2)

    auto = inb(4)
    bmax = inb(5)
    pwr = inb(6)

    up = Pressed and iPIR(inputX, inputY, 15, 1, 5, 5) or Pulse and iPIR(inputX, inputY, 15, 1, 5, 5) 
    down = Pressed and iPIR(inputX, inputY, 19, 1, 5, 5) or Pulse and iPIR(inputX, inputY, 19, 1, 5, 5) 

    if enableauto then
        oauto = Pressed and iPIR(inputX, inputY, 26,9,9,22)
        omax = Pressed and iPIR(inputX, inputY, 36,14,9,17)
    else
        omax =  Pressed and iPIR(inputX, inputY, 26,9,9,22)
    end
    opwr = Pressed and iPIR(inputX, inputY, 26,1,9,7)

    rstpulse = inb(32)

    if tempunit then
        unit = " C"
        mn = 14.9
        mx = 35.1
        rt = 21
    else
        unit = " F"
        mn = 58.9
        mx = 95.1
        rt = 70
        otemp = otemp*1.8
    end
    set = counter(up,down,rstpulse,true,0.1,mx,mn,rt)
    if set == 35.1 or set == 95.1 or bmax then
        settemp = "MAX "
        seta = true
    else
        if set == 14.9 or set == 58.9 then
            settemp = "MIN "
            seta = false
        else
            seta = false
            y=math.floor(x*10)/10
            settemp = y .. unit
        end
    end

osb(2,oauto)
osb(3,omax)
osb(4,opwr)


if auto and pwr and otemp < set or not auto and pwr and set > (rt+5) or seta and pwr then
    osb(1,true)
else
    osb(1,false)
end

end

function onDraw()
    col(10,10,10)
    dRF(16,1,9,7)
    dRF(16,9,9,22)
    
    dRF(26,1,9,7)
    dRF(26,9,9,22)

    if enableauto then
        dRF(36,13,9,18)
    end

    col(150,150,150)
    dst(17,11,settemp,1,4)
    dRF(22,21,1,1)
    dRF(19,15,1,1)

    -- Arrows
    col(150,0,0)
    dTF(20,2,20,8,17,5)
    col(0,0,150)
    dTF(21,2,21,8,24,5)

    if enableauto then
        col(60,60,60)
        dst(27,14,"AUTO",1,4)
        if auto then
            col(255,294,0)
        else
            col(5,5,5)
        end
        dL(28,11,33,11)
    
        if bmax then
            col(255,294,0)
        else
            col(5,5,5)
        end
        dL(38,15,43,15)
        col(80,15,0)
        dst(37,18,"MAX",1,4)
    else
        if bmax then
            col(255,294,0)
        else
            col(5,5,5)
        end
        dL(28,11,33,11)
        
        col(80,15,0)
        dst(27,15,"MAX",1,4)
    end
    
        if pwr then
            col(0,100,0,150)
        else
            col(150,0,0)
        end
    --Power
    dL(29,2,32,2)
    dL(28,4,31,4)
    dL(29,6,32,6)
    dL(32,3,32,6)
end

x = 0
function counter(up,down,rst,clamp,incr,nmax,nmin,nrst)
  if up then
      if clamp then
          x = math.min((x+incr),nmax)
        else
          x = x+incr
      end
  end
  if down then
      if clamp then
          x = math.max((x-incr),nmin)
      else
          x = x-incr
      end
  end
  if rst then
      x = nrst
  end 

  x = math.min(x,nmax)
  x = math.max(x,nmin)
  return x
end

function iPIR(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end

-- Needed function below
drf=screen.drawRectF
pgt=property.getText
FONT=pgt("FONT1")..pgt("FONT2")
FONT_D={}
FONT_S=0
for n in FONT:gmatch("....")do FONT_D[FONT_S+1]=tonumber(n,16)FONT_S=FONT_S+1 end
function dst(x,y,t,s,r,m)s=s or 1
r=r or 1
if r>2 then t=t:reverse()end
t=t:upper()for c in t:gmatch(".")do
ci=c:byte()-31 if 0<ci and ci<=FONT_S then
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