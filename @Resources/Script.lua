function Initialize()
end

function Update()
    Work_Area_Width=tonumber(SKIN:GetVariable("WORKAREAWIDTH"))
    Work_Area_Height=tonumber(SKIN:GetVariable("WORKAREAHEIGHT"))

    Grid_Size_X=tonumber(SKIN:GetVariable("GridSizeX",3))
    Grid_Size_Y=tonumber(SKIN:GetVariable("GridSizeY",3))
    
    Grid_Size_Total=(Grid_Size_X * Grid_Size_Y)
    
    Gap=tonumber(SKIN:GetVariable("Gap",10))
    
    Width=((Work_Area_Width-Gap*(2+(Grid_Size_X-1)))/Grid_Size_X)
    Height=((Work_Area_Height-Gap*(2+(Grid_Size_Y-1)))/Grid_Size_Y)

    for i = 2, Grid_Size_Total+1 do
        X=(Gap*(((i-2)-Grid_Size_X*(math.floor((i-2)/Grid_Size_X))-(Grid_Size_X*(math.floor((i-2)/(Grid_Size_X*Grid_Size_Y)))))+1) + Width*((i-2)-Grid_Size_X*(math.floor((i-2)/Grid_Size_X))-(Grid_Size_X*(math.floor((i-2)/(Grid_Size_X*Grid_Size_Y))))))
        Y=(Gap*(math.floor((i-2)/Grid_Size_X)+1) + Height*(math.floor((i-2)/Grid_Size_X)))
        
        SKIN:Bang('!SetOption', 'Grids', 'Shape'..i, 'Rectangle '..X..','..Y..','..Width..','..Height..',[#Radius] | Extend Background')
    end 

    SKIN:Bang('!UpdateMeter', 'Grids')
    SKIN:Bang('!Redraw')
end
