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

-- Tick function that will be executed every logic tick
function onTick()
    x = input.getNumber(5)
    y = input.getNumber(6)

    inputX = input.getNumber(3)
	inputY = input.getNumber(4)
	isPressed = input.getBool(1)

	plus = isPressed and isPointInRectangle(inputX, inputY, 7, 0, 7,7)
	minus = isPressed and isPointInRectangle(inputX, inputY, 7, 25, 5,7)
	
    zoom = counter(minus,plus,false,true,0.1,50,0.1,1,1,false)

end


function onDraw()
screen.drawMap(x, y, zoom)
screen.setColor(255,0,0)
screen.drawRect(32,16,1,1)

screen.setColor(2,35,172)
screen.drawLine(10,1,10,6)
screen.drawLine(8,3,13,3)

screen.drawLine(10,26,10,31)
end

val = {}
val[1] = 1

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