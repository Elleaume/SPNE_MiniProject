%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Symbol to digit substitution %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; clc; close all;

% Welcoming data
% data = newSubjectInitialization;

% ------------------------ Initialize Screens --------------------------- %

oldValue = Screen('Preference', 'SkipSyncTests', 1);

% ----------------------------- Settings -------------------------------- %

back_color = [0 0 0];
text_color = [255 255 255];

% Call all of your screens
screens = Screen('Screens');
% Change the value of the screenNumber variable to get the test displayed on a differet screen
screen_number = min(screens);
% get dimension of the screen and draw window
[outwindow, rect] = Screen('OpenWindow', screen_number, back_color);

text_size = round(rect(4)/20);
text_size_small = round(rect(4)/40);
% put x and y at the center of the screen
x = round(rect(3)/2);
y = round(rect(4)/2);

n_symbols = 8;

% Dimensions settings for the boxes
max_x = round(rect(3)*0.4);
max_y = max_x/n_symbols*2;
tree = max_y/2 *0.7;


% Keep track of success of the subject
success = [];
% Maximum time to complete the task
stop = 60;
% Specify ground truth of shapes
true_shapes = ["circle", "square", "triangle", "equal", "cross", "hat", "moon", "lightning"];


% getDevices = PsychHID('Devices');
KbName('UnifyKeyNames');

while KbCheck; end

% --------------------------- Welcoming page ---------------------------- %

white = WhiteIndex(outwindow);
Screen('TextSize', outwindow, text_size);
Screen('TextFont', outwindow, 'Arial');
DrawFormattedText(outwindow, 'Welcome to the symbol to digit substitution test !', 'center', round(rect(4)/3), white);
Screen('TextSize', outwindow, text_size_small);
Screen('Flip', outwindow, [], 1);
WaitSecs(1);
DrawFormattedText(outwindow, ['Please press enter to continue towards the instructions'], 'center', 3*round(rect(4)/4), white);
Screen('Flip', outwindow);

waitForEnter;

% --------------------------- Instruction page -------------------------- %
            
DrawFormattedText(outwindow, ['You will be show a table of symbols associated with numbers similar to the example below'], ...
                              'center', text_size_small*4 ,white, 0);
            
% Place the Example Grid 
y = 1*round(rect(4)/3) + text_size_small;
drawGrid(x, y, outwindow , n_symbols, max_x , max_y)

% Draw Shapes 
[shapes_instructions, indexes] = shuffle(true_shapes);
for i = 1:n_symbols
    drawShape(shapes_instructions(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
end

% Draw Numbers
for i = 1:n_symbols
    [~, ~] = Screen('TextFont', outwindow, 'Arial');

    Screen('TextSize', outwindow, text_size);
    posY   = y + max_y/2 - text_size/2; 

    posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
    Screen('DrawText', outwindow, int2str(i), posX, posY, text_color);  
end

Screen('TextSize', outwindow, text_size_small);
DrawFormattedText(outwindow, ['Press enter to continue'], 'center',  7*round(rect(4)/8) +text_size_small*2 ...
    ...
    ...
    , white);
Screen('Flip', outwindow, [], 1);

waitForEnter;

DrawFormattedText(outwindow, ['And a second table with the symbols shuffled'], 'center', text_size_small*5,white, 0);

% Place the 2nd Example Grid 
y = 2*round(rect(4)/3) + text_size_small*2;
drawGrid(x, y, outwindow , n_symbols, max_x , max_y)

% Draw Shapes 
[shapes, indexes] = shuffle(shapes_instructions);
for i = 1:n_symbols
    drawShape(shapes(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
end
Screen('Flip', outwindow, [], 1);
waitForEnter;

DrawFormattedText(outwindow, ['In the lower bar, place the correct number in the box under each symbol according to the codes above'], 'center', text_size_small*6 ,white, 0);
Screen('Flip', outwindow, [], 1);
WaitSecs(1);

% Draw Numbers
for i = 1:n_symbols
    WaitSecs(0.5);
    [~, ~] = Screen('TextFont', outwindow, 'Arial');

    Screen('TextSize', outwindow, text_size);
    posY   = y + max_y/2 - text_size/2; 

    posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
    Screen('DrawText', outwindow, int2str(indexes(i)), posX, posY, text_color);  
    if i == n_symbols 
        Screen('Flip', outwindow, [], 0);
    else
        Screen('Flip', outwindow, [], 1);
    end
end

waitForEnter;

Screen('TextSize', outwindow, text_size);
DrawFormattedText(outwindow, 'Please work as quickly and accurately as you can', 'center', round(rect(4)/3), white);
DrawFormattedText(outwindow, 'You will have ONE MINUTE to complete as many as you can.', 'center', round(rect(4)/3) + 2*text_size, white);
Screen('TextSize', outwindow, text_size_small);
DrawFormattedText(outwindow, ['Press enter to continue'], 'center', 3*round(rect(4)/4), white);
Screen('Flip', outwindow);

waitForEnter;



% --------------------------- Loading Page ------------------------------ %

Screen('TextSize', outwindow, text_size);
DrawFormattedText(outwindow, 'Ready? Press enter to start the test!' , 'center', 'center', white);
Screen('Flip', outwindow);

waitForEnter;
Screen('TextSize', outwindow, round(rect(4)/10));
for i = 1:3
    DrawFormattedText(outwindow, int2str(i), 'center', 'center', white);
    Screen('Flip', outwindow);
    WaitSecs(1);
end
DrawFormattedText(outwindow, 'GO!', 'center', 'center', white);
Screen('Flip', outwindow);
WaitSecs(1);



% ---------------------------- Start Task! ------------------------------ %
% Start task
tic();
while toc() < stop
% ----------------------------- Draw Grid ------------------------------- %

    % Place the 1st Grid at the top
    y = round(rect(4)/4);
    drawGrid(x, y, outwindow , n_symbols, max_x , max_y)
    
% ---------------------------- Draw Shapes ------------------------------ %
    
    for i = 1:n_symbols
        drawShape(true_shapes(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
    end
    
% --------------------------- Draw Numbers ------------------------------ %
    
    for i = 1:n_symbols
        [~, ~] = Screen('TextFont', outwindow, 'Arial');
        Screen('TextSize', outwindow, text_size);
        posY   = y + max_y/2 - text_size/2; 
        posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
        Screen('DrawText', outwindow, int2str(i), posX, posY, text_color);  
    end
    Screen('Flip', outwindow, [], 1);
    
% ----------------------------- 2nd Grid -------------------------------- %

    % Move second grid center to the bottom of the screen
    y = 3*round(rect(4)/4);


    drawGrid(x, y, outwindow , n_symbols, max_x , max_y)

    [shapes, indexes] = shuffle(true_shapes);
    for i = 1:n_symbols
        drawShape(shapes(i), i-5, x, y, outwindow , n_symbols, max_x , max_y, tree);
    end
    Screen('Flip', outwindow, [], 1);


% ---------------------- Subject enter Numbers -------------------------- %
    
    subject_labels = [];
    for i= 1:n_symbols
        keyIsDown = 0;
        while ~keyIsDown & toc() < stop
            [keyIsDown, seconds, key_code] = KbCheck();
            if keyIsDown
                code = KbName([key_code]);
                subject_labels = [subject_labels, str2num(code(1))];
                [~, ~] = Screen('TextFont', outwindow, 'Arial');
                Screen('TextSize', outwindow, text_size);
                posY   = y + max_y/2 - text_size/2; 
                posX   = x + (max_x/(n_symbols/2))*(i-5) + max_y/3;
                Screen('DrawText', outwindow, code(1), posX, posY, text_color);  
                
                if i == n_symbols 
                    Screen('Flip', outwindow, [], 0);
                else
                    Screen('Flip', outwindow, [], 1);
                end
                
 
                keyIsDown = 0;
                WaitSecs(0.2);
                break
            end
        end
    end

    if length(subject_labels) == n_symbols
        success = [success, all(subject_labels == indexes)];
    else
        success = [success, 0];
        Screen('Flip', outwindow, [], 0);
    end
end





5876324174213856641782538576

% ---------------------------- End Page --------------------------------- %
Screen('TextSize', outwindow, round(rect(4)/10));
DrawFormattedText(outwindow, 'DONE!', 'center', 2*round(rect(4)/4), white);
Screen('Flip', outwindow, [], 1);
WaitSecs(1);
DrawFormattedText(outwindow, 'Thank you for participating!', 'center', 3*round(rect(4)/4), white);
Screen('Flip', outwindow);
WaitSecs(3);

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









