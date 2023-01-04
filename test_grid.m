%%
oldValue = Screen('Preference', 'SkipSyncTests', 1);

% Call all of your screens
screens = Screen('Screens');
% Change the value of the screenNumber variable to get the test displayed on a differet screen
screenNumber = max(screens);
% get dimension of the screen and draw window
[outwindow, rect] = Screen('OpenWindow', screenNumber, [0,0,0]);

%%
% -- Setting -- %
color = [255 255 255];
penWidth = 7;
x = rect(3)/2;
y = rect(4)/2;
max_x = 600;
n_symbols = 8;
max_y = max_x/n_symbols*2;
tree = max_y/2 *0.7;

%%
% ------------- %

% --- Code ---- %

%%
% Draw outline of the grid
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


%%
x = rect(3)/2;
y = rect(4)/2;

% Draw a square 
% To move it around can change the center
x = x + (max_x/(n_symbols/2))*-4 + max_y/2;
y = y - max_y/2;

points = [x+tree, y-tree; x+tree, y+tree; x-tree,y+tree; x-tree, y-tree];

Screen('FillPoly', outwindow, color, points);


%%
x = rect(3)/2;
y = rect(4)/2;

% Draw cross
x = x + (max_x/(n_symbols/2))*-3 + max_y/2;
y = y - max_y/2;
Screen('DrawLine', outwindow, color, x+tree, y, x+tree, y, penWidth);
Screen('DrawLine', outwindow, color, x+tree, y, x-tree, y, penWidth);
Screen('DrawLine', outwindow, color, x, y+tree, x, y+tree, penWidth);
Screen('DrawLine', outwindow, color, x, y+tree, x, y-tree, penWidth);
%%
x = rect(3)/2;
y = rect(4)/2;

% Draw Circle
x = x + (max_x/(n_symbols/2))*-2  + max_y/2;
y = y - max_y/2;
Screen('FillOval', outwindow , color, [x-tree, y-tree, x+tree, y+tree]);

%%
x = rect(3)/2;
y = rect(4)/2;

% Draw Moon
x = x + (max_x/(n_symbols/2))*-1 + max_y/2;
y = y - max_y/2;
Screen('FillOval', outwindow , color, [x-tree, y-tree, x+tree, y+tree]);
Screen('FillOval', outwindow , [0 0 0], [x-tree, y-tree, x+tree*0.5, y+tree*0.5]);

%%
x = rect(3)/2;
y = rect(4)/2;

% Draw Equal
x = x + (max_x/(n_symbols/2))*0 + max_y/2;
y = y - max_y/2;
Screen('DrawLine', outwindow, color, x+tree, y+tree/2, x+tree, y+tree/2, penWidth);
Screen('DrawLine', outwindow, color, x+tree, y+tree/2, x-tree, y+tree/2, penWidth);
Screen('DrawLine', outwindow, color, x+tree, y-tree/2, x+tree, y-tree/2, penWidth);
Screen('DrawLine', outwindow, color, x+tree, y-tree/2, x-tree, y-tree/2, penWidth);

%%
x = rect(3)/2;
y = rect(4)/2;

% Draw Lightning
x = x + (max_x/(n_symbols/2))*1 + max_y/2;
y = y - max_y/2;
Screen('DrawLine', outwindow, color, x+0.6*tree, y, x+0.6*tree, y, penWidth);
Screen('DrawLine', outwindow, color, x+0.6*tree, y, x-0.6*tree, y, penWidth);
Screen('DrawLine', outwindow, color, x+0.6*tree, y, x, y-tree, penWidth);
Screen('DrawLine', outwindow, color, x, y+tree, x-0.6*tree, y, penWidth);

%%
x = rect(3)/2;
y = rect(4)/2;

% Draw hat
x = x + (max_x/(n_symbols/2))*2 + max_y/2;
y = y - max_y/2;
hight_hat = tree*0.8;

points = [x+tree*0.6, y-tree; x+tree*0.6, y+hight_hat; x-tree*0.6,y+hight_hat; x-tree*0.6, y-tree];
Screen('FillPoly', outwindow, color, points)
Screen('DrawLine', outwindow, color, x+tree, y+hight_hat, x+tree, y+hight_hat, penWidth);
Screen('DrawLine', outwindow, color, x+tree, y+hight_hat, x-tree, y+hight_hat, penWidth);

%%
x = rect(3)/2;
y = rect(4)/2;

% Draw Triangle
x = x + (max_x/(n_symbols/2))*3 + max_y/2;
y = y - max_y/2;
points = [x, y-tree; x+tree, y+tree; x-tree,y+tree];
Screen('FillPoly', outwindow, color, points)

%%
x = rect(3)/2;
y = rect(4)/2;
color = [255 0 0];
% Draw numbers 
y_num = y + max_y/2;

Screen('DrawText', outwindow, "2", x + (max_x/(n_symbols/2))*-2 + max_y/2, y_num, color);

for i= 1:n_symbols
    Screen('DrawText', outwindow, i, x + (max_x/(n_symbols/2))*(i-4) + max_y/2, y_num, color);
    %DrawFormattedText(outwindow, "1", 'center', 'center', color);
end
%x + (max_x/(n_symbols/2))*(i-4) + max_y/2, y_num,


%%
Screen('Flip', outwindow);
% ------------- %
WaitSecs(10);
Screen('CloseAll')