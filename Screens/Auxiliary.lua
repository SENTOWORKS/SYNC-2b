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
        simulator:setInputBool(3, simulator:getIsToggled(1))  --AUX1
        simulator:setInputBool(4, simulator:getIsToggled(2))  --AUX2
        simulator:setInputBool(5, simulator:getIsToggled(3))  --AUX3
        simulator:setInputBool(6, simulator:getIsToggled(4))  --AUX4
        simulator:setInputBool(7, simulator:getIsToggled(5))  --AUX5
        simulator:setInputBool(8, simulator:getIsToggled(6))  --AUX6
        simulator:setInputBool(9, simulator:getIsToggled(7))  --AUX7
        simulator:setInputBool(10, simulator:getIsToggled(8))  --AUX8
        simulator:setInputBool(11, simulator:getIsToggled(9))  --Worklight
        simulator:setInputBool(12, simulator:getIsToggled(10))  --Beacon
        simulator:setInputBool(13, simulator:getIsToggled(11))  --Front Fog
        simulator:setInputBool(14, simulator:getIsToggled(12))  --Rear Fog

    end;
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF
inb = input.getBool
osB = output.setBool

function onTick()
	inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)


	aux1 = isPressed and iPIN(inputX, inputY, 16,24,11,7)
	aux2 = isPressed and iPIN(inputX, inputY, 16,16,11,7)
	aux3 = isPressed and iPIN(inputX, inputY, 16,7,11,7)
	aux4 = isPressed and iPIN(inputX, inputY, 16,0,11,7)
	aux5 = isPressed and iPIN(inputX, inputY, 28,24,11,7)
	aux6 = isPressed and iPIN(inputX, inputY, 28,16,11,7)
	aux7 = isPressed and iPIN(inputX, inputY, 28,7,11,7)
	aux8 = isPressed and iPIN(inputX, inputY, 28,0,11,7)
	ff = isPressed and iPIN(inputX, inputY, 40,0,11,15)
	rf = isPressed and iPIN(inputX, inputY, 40,16,11,15)
	wl = isPressed and iPIN(inputX, inputY, 52,0,11,15)
	bc = isPressed and iPIN(inputX, inputY, 52,16,11,15)

	osB(3, aux1)
	osB(4, aux2)
	osB(5, aux3)
	osB(6, aux4)
	osB(7, aux5)
	osB(8, aux6)
	osB(9, aux7)
	osB(10, aux8)
	osB(11, wl)
	osB(12, bc)
    osB(13, ff)
	osB(14, rf)

	aux1 = inb(3)
	aux2 = inb(4)
	aux3 = inb(5)
	aux4 = inb(6)
	aux5 = inb(7)
	aux6 = inb(8)
	aux7 = inb(9)
	aux8 = inb(10)
	wl = inb(11)
	bc = inb(12)
	ff = inb(13)
	rf = inb(14)
end

function onDraw()
	col(0,0,0)
--4
	dRF(16,0,11,7)
--3
	dRF(16,8,11,7)
--2
	dRF(16,17,11,7)
--1
	dRF(16,25,11,7)
--8
	dRF(28,0,11,7)
--7
	dRF(28,8,11,7)
--6
	dRF(28,17,11,7)
--5
	dRF(28,25,11,7)
--Front Fog
	dRF(40,0,11,15)
--Rear Fog
	dRF(40,17,11,15)
--Worklight
	dRF(52,0,11,15)
--Beacon
	dRF(52,17,11,15)	
	
	col(150,150,150)

-- Icons	
	dst(17,27,"1",1,4)
	dst(17,19,"2",1,4)
	dst(17,10,"3",1,4)
	dst(17,2,"4",1,4)
	
	dst(29,27,"5",1,4)
	dst(29,19,"6",1,4)
	dst(29,10,"7",1,4)
	dst(29,2,"8",1,4)
	

	ffx=42
	ffy=1	
    dL(ffx+2,ffy+7,ffx+5,ffy+7)
	dL(ffx+1,ffy+6,ffx+6,ffy+6)
	dL(ffx,ffy+5,ffx+7,ffy+5)	
	dL(ffx,ffy+4,ffx+7,ffy+4)	
	dL(ffx,ffy+1,ffx+7,ffy+1)
	
	dL(ffx+1,ffy,ffx+1,ffy+3)
	dL(ffx+3,ffy,ffx+3,ffy+3)
	dL(ffx+5,ffy,ffx+5,ffy+3)


	rfx=42
	rfy=23
	dL(rfx+2,rfy,rfx+5,rfy)
	dL(rfx+1,rfy+1,rfx+6,rfy+1)
	dL(rfx,rfy+2,rfx+7,rfy+2)	
	dL(rfx,rfy+3,rfx+7,rfy+3)	
	dL(rfx,rfy+6,rfx+7,rfy+6)
	dL(rfx+1,rfy+5,rfx+1,rfy+8)
	dL(rfx+3,rfy+5,rfx+3,rfy+8)
	dL(rfx+5,rfy+5,rfx+5,rfy+8)

	wlx=54
	wly=1
	dL(wlx+2,wly+7,wlx+5,wly+7)
	dL(wlx+1,wly+6,wlx+6,wly+6)
	dL(wlx,wly+5,wlx+7,wly+5)	
	dL(wlx,wly+4,wlx+7,wly+4)	
	dL(wlx+3,wly,wlx,wly+3)
	dL(wlx+6,wly,wlx+3,wly+3)

	bcx=54
	bcy=23
	dL(bcx,bcy+2,bcx,bcy+6)
	dL(bcx+1,bcy+6,bcx+7,bcy+6)
	dL(bcx+1,bcy+1,bcx+7,bcy+1)
	dL(bcx+6,bcy,bcx+6,bcy+8)
	dL(bcx+5,bcy,bcx+5,bcy+8)
	
--Indicators	
	if bc then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(bcx+1,bcy-3,bcx+6,bcy-3)
		
	if wl then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(wlx+1,wly+10,wlx+6,wly+10)

	if ff then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(ffx+1,ffy+10,ffx+6,ffy+10)
	
	if rf then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(rfx+1,rfy-3,rfx+6,rfy-3)

	if aux4 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(25,2,25,5)

	if aux3 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(24,10,24,13)

	if aux2 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(24,19,24,22)

	if aux1 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(24,27,24,30)



	if aux8 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(36,2,36,5)
	
	if aux7 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(36,10,36,13)
	
	if aux6 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(36,19,36,22)
	
	if aux5 then
		col(255,294,0)
	else
		col(2,35,172)
	end
	dL(36,27,36,30)
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

function iPIN(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end
