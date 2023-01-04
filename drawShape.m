function drawShape(shape, i, x, y, outwindow , n_symbols, max_x , max_y, tree)
% drawSahpe draw the desired shape
%   Inputs :
%       shape : a shape that can take the values circle, square, trinangle,
%               equal, cross, hat, moon, lightning
%       i : integer from -4 to 3 assigning a square in the grid to the shape

    color = [255 255 255];
    penWidth = 7;

    % assert((shape in ['circle', 'square', 'trinangle', 'equal', 'cross', 'hat', 'moon', 'lightning']), "Invalid shape argument")
    assert((i>= -4 & i<=3), 'invalid index i, should be between -4 and 3')
    
    % Move the center to the corresponding box
    x = x + (max_x/(n_symbols/2))*i + max_y/2;
    y = y - max_y/2;
    
    % Draw a Circle
    if shape == 'circle'     
        Screen('FillOval', outwindow , color, [x-tree, y-tree, x+tree, y+tree]);
    % Draw a Square 
    elseif shape == 'square'        
        points = [x+tree, y-tree; x+tree, y+tree; x-tree,y+tree; x-tree, y-tree];
        Screen('FillPoly', outwindow, color, points);
    % Draw Triangle
    elseif shape == 'triangle'
        points = [x, y-tree; x+tree, y+tree; x-tree,y+tree];
        Screen('FillPoly', outwindow, color, points)
    % Draw an Equal symbol
    elseif shape == 'equal'
        Screen('DrawLine', outwindow, color, x+tree, y+tree/2, x+tree, y+tree/2, penWidth);
        Screen('DrawLine', outwindow, color, x+tree, y+tree/2, x-tree, y+tree/2, penWidth);
        Screen('DrawLine', outwindow, color, x+tree, y-tree/2, x+tree, y-tree/2, penWidth);
        Screen('DrawLine', outwindow, color, x+tree, y-tree/2, x-tree, y-tree/2, penWidth);
    % Draw a Cross
    elseif shape == 'cross'
        Screen('DrawLine', outwindow, color, x+tree, y, x+tree, y, penWidth);
        Screen('DrawLine', outwindow, color, x+tree, y, x-tree, y, penWidth);
        Screen('DrawLine', outwindow, color, x, y+tree, x, y+tree, penWidth);
        Screen('DrawLine', outwindow, color, x, y+tree, x, y-tree, penWidth);
    % Draw a Hat
    elseif shape == 'hat'
        hight_hat = tree*0.8;
        points = [x+tree*0.6, y-tree; x+tree*0.6, y+hight_hat; x-tree*0.6,y+hight_hat; x-tree*0.6, y-tree];
        Screen('FillPoly', outwindow, color, points)
        Screen('DrawLine', outwindow, color, x+tree, y+hight_hat, x+tree, y+hight_hat, penWidth);
        Screen('DrawLine', outwindow, color, x+tree, y+hight_hat, x-tree, y+hight_hat, penWidth);
    % Draw a Moon 
    elseif shape == 'moon'
        Screen('FillOval', outwindow , color, [x-tree, y-tree, x+tree, y+tree]);
        Screen('FillOval', outwindow , [0 0 0], [x-tree, y-tree, x+tree*0.5, y+tree*0.5]);
    % Draw a Lightning
    elseif shape == 'lightning'
        Screen('DrawLine', outwindow, color, x+0.6*tree, y, x+0.6*tree, y, penWidth);
        Screen('DrawLine', outwindow, color, x+0.6*tree, y, x-0.6*tree, y, penWidth);
        Screen('DrawLine', outwindow, color, x+0.6*tree, y, x, y-tree, penWidth);
        Screen('DrawLine', outwindow, color, x, y+tree, x-0.6*tree, y, penWidth);
    else
        error('Error. \nInvalid shape argument, shape should be : circle, square, trinangle, equal, cross, hat, moon or lightning')

    end
end