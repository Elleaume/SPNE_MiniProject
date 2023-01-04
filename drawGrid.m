function drawGrid(x, y, outwindow , n_symbols, max_x , max_y)
% drawGrid Draw outline of the grid 
%   Inputs 
% 
%
    color = [255 255 255];
    penWidth = 7;
    
    Screen('DrawLine', outwindow, color, x, y, x+max_x, y, penWidth);
    Screen('DrawLine', outwindow, color, x, y, x-max_x, y, penWidth);
    
    Screen('DrawLine', outwindow, color, x, y-max_y, x+max_x, y-max_y, penWidth);
    Screen('DrawLine', outwindow, color, x, y-max_y, x-max_x, y-max_y, penWidth);
    
    Screen('DrawLine', outwindow, color, x, y+max_y, x+max_x, y+max_y, penWidth);
    Screen('DrawLine', outwindow, color, x, y+max_y, x-max_x, y+max_y, penWidth);
    
    % Draw boxes 
    for i = -(n_symbols/2):(n_symbols/2)
        Screen('DrawLine', outwindow, color, x+(max_x/(n_symbols/2))*i, y, x+(max_x/(n_symbols/2))*i, y+max_y, penWidth);
        Screen('DrawLine', outwindow, color, x+(max_x/(n_symbols/2))*i, y, x+(max_x/(n_symbols/2))*i, y-max_y, penWidth);
    end
end