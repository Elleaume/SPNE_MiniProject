function instructionPage(outwindow, rect, text_color, shapes)
    
    % Settings for display
    white = WhiteIndex(outwindow);
    text_size = round(rect(4)/20);
    text_size_small = round(rect(4)/40);
    n_symbols = length(shapes);

    % Dimensions settings for the boxes
    max_x = round(rect(3)*0.4);
    max_y = max_x/n_symbols*2;
    tree = max_y/2 *0.7;

    % put x and y at the center of the screen
    x = round(rect(3)/2);
    y = round(rect(4)/2);

    % Start instructions
    DrawFormattedText(outwindow, ['A table of symbols associated with numbers will be shown, as in the example below.'], ...
                      'center', text_size_small*4, white, 0);

    % ----------------------- First Example Grid ------------------------ %

    % Place the Example Grid 
    y = 1*round(rect(4)/3) + text_size_small;
    drawGrid(x, y, outwindow , n_symbols, max_x , max_y)
    
    % Draw Shapes 
    [shapes_instructions, indexes] = shuffle(shapes);
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
    DrawFormattedText(outwindow, ['Press enter to continue'], ...
                      'center',  7*round(rect(4)/8) +text_size_small*2 , white);
    Screen('Flip', outwindow, [], 1);
    
    waitForEnter;

    % ------------------------------------------------------------------- %
    
    DrawFormattedText(outwindow, ['A second table with symbols shuffled will be displayed below'], ...
                      'center', text_size_small*5,white, 0);
    
    % ----------------------- Second Example Grid ----------------------- %

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
    
    DrawFormattedText(outwindow, ['In the lower bar, place the correct number in the box under each symbol according to the codes above'], ...
                      'center', text_size_small*6 ,white, 0);
    
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

    % ------------------------------------------------------------------- %
    
    Screen('TextSize', outwindow, text_size);
    DrawFormattedText(outwindow, 'Please work as quickly and accurately as you can.', ...
                      'center', round(rect(4)/4), white);
    DrawFormattedText(outwindow, 'You have 1 MIN to complete as many patterns as you can.', ...
                      'center', round(rect(4)/4) + 2*text_size, white);
    DrawFormattedText(outwindow, 'Use your keyboard to enter the digits.', ...
                      'center', round(rect(4)/4) + 4*text_size , white);
    DrawFormattedText(outwindow, 'Work from left to right starting with the very first left shape.', ...
                      'center', round(rect(4)/4) + 6*text_size , white);
    DrawFormattedText(outwindow, 'Be careful, you cannot correct an answer.', ...
                      'center', round(rect(4)/4) + 8*text_size , white);
    DrawFormattedText(outwindow, 'A serie is considered correct if ALL the shapes are matched correctly.', ...
                      'center', round(rect(4)/4) + 10*text_size , white);
    
    Screen('TextSize', outwindow, text_size_small);
    DrawFormattedText(outwindow, 'Press enter to continue', ...
                      'center', round(rect(4)/4) + 12*text_size, white);
    Screen('Flip', outwindow);
    
    waitForEnter;


end