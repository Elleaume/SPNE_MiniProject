%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Symbol to digit substitution %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc; close all;

% Welcoming data
% data = newSubjectInitialization;

% ------------------------ Initialize Screens --------------------------- %

oldValue = Screen('Preference', 'SkipSyncTests', 1);

% ----------------------------- Setting --------------------------------- %

BackColor = [0 0 0];
TextColor = [255 255 255];

% Call all of your screens
screens = Screen('Screens');
% Change the value of the screenNumber variable to get the test displayed on a differet screen
screenNumber = max(screens);
% get dimension of the screen and draw window
[outwindow, rect] = Screen('OpenWindow', screenNumber, [0 0 0]);

x = rect(3)/2;
y = rect(4)/4;
n_symbols = 8;

max_x = 600;
max_y = max_x/n_symbols*2;
tree = max_y/2 *0.7;

TextSize = 60;

% ----------------------------- Draw Grid ------------------------------- %

drawGrid(x, y, outwindow , n_symbols, max_x , max_y)

% ---------------------------- Draw Shapes ------------------------------ %
shapes = ["circle", "square", "triangle", "equal", "cross", "hat", "moon", "lightning"];
[shapes, indexes] = shuffle(shapes);
for i = 1:n_symbols
    drawShape(shapes(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
end

% --------------------------- Draw Numbers ------------------------------ %

for i = 1:n_symbols
    [~, ~] = Screen('TextFont', outwindow, 'Arial');
    Screen('TextSize', outwindow, TextSize);
    color  = TextColor;
    posY   = y + max_y/2 - TextSize/2; 
    posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
    Screen('DrawText', outwindow, int2str(i), posX, posY, color);  
end


% ----------------------------- 2nd Gird -------------------------------- %
x = rect(3)/2;
y = 3*rect(4)/4;

drawGrid(x, y, outwindow , n_symbols, max_x , max_y)
shapes = ["circle", "square", "triangle", "equal", "cross", "hat", "moon", "lightning"];
[shapes, indexes] = shuffle(shapes);
for i = 1:n_symbols
    drawShape(shapes(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
end

% ---------------------- Subject enter Numbers -------------------------- %
Screen('Flip', outwindow, [], 1);
for i= 1:n_symbols
    keyIsDown = 0;
    while ~keyIsDown
        [keyIsDown, seconds, keyCode] = KbCheck;
        if keyIsDown
            find(keyCode)
            [~, ~] = Screen('TextFont', outwindow, 'Arial');
            Screen('TextSize', outwindow, TextSize);
            color  = TextColor;
            posY   = y + max_y/2 - TextSize/2; 
            posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
            Screen('DrawText', outwindow, int2str(find(keyCode)), posX, posY, color);  
            Screen('Flip', outwindow, [], 1);
        end
    end
end

WaitSecs(4);

Screen('CloseAll')





%%
Screen('CloseAll')


