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
while KbCheck; end
%getDevices = PsychHID('Devices');
KbName('UnifyKeyNames');

% ----------------------------- Draw Grid ------------------------------- %

drawGrid(x, y, outwindow , n_symbols, max_x , max_y)

% ---------------------------- Draw Shapes ------------------------------ %
shapes = ["circle", "square", "triangle", "equal", "cross", "hat", "moon", "lightning"];
% Store reference table
[true_shapes, true_indexes] = shuffle(shapes);
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


% ----------------------------- 2nd Grid -------------------------------- %
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
tic();
successes = [];
subject_labels = [];
for i= 1:n_symbols
    keyIsDown = 0;

    while ~keyIsDown & toc() < 60
        [keyIsDown, seconds, keyCode] = KbCheck();
        if keyIsDown
            code = KbName([keyCode]);
            subject_labels = [subject_labels, str2num(code(1))];
            [~, ~] = Screen('TextFont', outwindow, 'Arial');
            Screen('TextSize', outwindow, TextSize);
            color  = TextColor;
            posY   = y + max_y/2 - TextSize/2; 
            posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
            Screen('DrawText', outwindow, code(1), posX, posY, color);  
            Screen('Flip', outwindow, [], 1);
            
            keyIsDown = 0;
            WaitSecs(0.2);
            break
        end
    end
end

successes = [successes all(subject_labels == indexes)]

WaitSecs(4);

Screen('CloseAll')





%%
Screen('CloseAll')

%%
getDevices = PsychHID('Devices');

for device = getDevices 
    if device.usageName == "Keyboard"
        disp(device.product )
        disp(device.index)
    end
end










