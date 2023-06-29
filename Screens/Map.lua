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
        simulator:setInputBool(3, simulator:getIsClicked(1))       -- if button 1 is clicked, provide an ON pulse for input.getBool(31)
        simulator:setInputNumber(31, simulator:getSlider(1))        -- set input 31 to the value of slider 1

        simulator:setInputBool(32, simulator:getIsToggled(2))       -- make button 2 a toggle, for input.getBool(32)
        simulator:setInputNumber(32, simulator:getSlider(2) * 50)   -- set input 32 to the value from slider 2 * 50
    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

-- Tick function that will be executed every logic tick

col = screen.setColor
dR = screen.drawRect

function onTick()
    x = input.getNumber(5)
    y = input.getNumber(6)

    inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)
    pulse = input.getBool(3)
	plus = isPressed and isPointInRectangle(inputX, inputY, 7, 0, 7,7)
	minus = isPressed and isPointInRectangle(inputX, inputY, 7, 25, 5,7)
    
    Time = input.getNumber(5)
    Hour = math.floor(Time * 24)
    Minute = math.floor(Time * 1440 - Hour * 60)
    
        if Hour >= 12 then
            Hour = Hour - 12
            Time = "PM"
        else 
            Time = "AM"
        end
        if Hour == 0 then
            Hour = 12
        end	
    
    home = isPressed and isPointInRectangle(inputX, inputY, 5, 10, 8, 10)
    output.setBool(1, home)

    if isPressed then
        banner = true
    else
        banner = false
    end

    zoom = counter(minus,plus,false,true,0.1,50,0.1,1,1,false)
    fade = counter(false,pulse,banner,true,5,255,1,255,2,false)
    fadepercent = fade/255
end


function onDraw()
screen.drawMap(x, y, zoom)

screen.setColor(0,0,0,fade)
screen.drawRectF(0,0,14,32)

screen.setColor(255,0,0)
screen.drawRect(32,16,1,1)

screen.setColor(2,35,172,fade)
screen.drawLine(10,1,10,6)
screen.drawLine(8,3,13,3)

screen.drawLine(10,26,10,31)

--Home Button	
col(0,255,0,150*fadepercent)
dR(7,12,1,1)
col(255,294,0,fade)
dR(7,15,1,1)
col(2,35,172,150*fadepercent)
dR(7,18,1,1)
col(253,165,2,fade)
dR(10,12,1,1)
col(2,35,172,fade)
dR(10,15,1,1)
col(255,0,0,150*fadepercent)
dR(10,18,1,1)

-- Clock
clock = string.format("%02d :%02d",Hour,Minute).." ".. Time
screen.setColor(150, 150, 150,fade)
dst(0,1,clock,1,4)

end

val = {}
val[1] = 1
val[2] = 255
function counter(up,down,reset,clamp,incr,nmax,nmin,nrst,inst, loop)
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
    if val[inst] == nmax and loop or reset then
        val[inst] = nrst
    end 
    return val[inst]
  end

function isPointInRectangle(x, y, rectX, rectY, rectW, rectH)
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