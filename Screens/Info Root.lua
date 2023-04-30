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
    simulator:setProperty("Body Colour", "255,204,0")
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
        simulator:setInputNumber(32, simulator:getSlider(1) *3)        -- set input 31 to the value of slider 1
    end
end
---@endsection


--[====[ IN-GAME CODE ]====]

-- try require("Folder.Filename") to include code from another file in this, so you can store code in libraries
-- the "LifeBoatAPI" is included by default in /_build/libs/ - you can use require("LifeBoatAPI") to get this, and use all the LifeBoatAPI.<functions>!

col = screen.setColor
dL = screen.drawLine
dRF = screen.drawRectF
osb = output.setBool
pgt = property.getText

function onTick()
    inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)
    faultsev = input.getNumber(32)

    info = isPressed and iPIN(inputX, inputY, 15,9,14,14)
    eng = isPressed and iPIN(inputX, inputY, 31,9,14,14)
    obd = isPressed and iPIN(inputX, inputY, 47,9,14,14)

    osb(1,info)
    osb(2,eng)
    osb(3,obd)

    rgb = pgt("Body Colour")
    bodycolour = commasplit(rgb)

    if faultsev == 0 then
        r = 20
        g = 20
        b = 20
    else
        if faultsev == 1 then
            r = 255
            g = 191
            b = 0
        else
            if faultsev == 2 then
                r = 255
                g = 294
                b = 0
            else
                if faultsev == 3 then
                    r = 255
                    g = 0
                    b = 0
                end
            end
        end
    end
end

function onDraw()
    infoicon(15,9,bodycolour[1],bodycolour[2],bodycolour[3],255)
    engicon(31,9)
    obdicon(47,9,r,g,b)
end

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

function obdicon(x,y,r,g,b)
    col(60,60,60)
    --OBD Button
    dRF(x,y+1,14,12)
    dL(x+1,y,x+13,y)
    dL(x+1,y+13,x+13,y+13)


	col(r,g,b)
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

function iPIN(x, y, rectX, rectY, rectW, rectH)
	return x > rectX and y > rectY and x < rectX+rectW and y < rectY+rectH
end

function commasplit(str)
    t = {}
    i = 1
    for word in str:gmatch('[^,%s]+') do
        t[i] = tonumber(word)
        i = i + 1
    end
    return t
end