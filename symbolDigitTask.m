function [success_series, n_success, n_miss_match] = symbolDigitTask(outwindow, rect, text_color, true_shapes)
    
    % Keep track of success of the subject
    success_series = [];
    n_success = 0;
    n_miss_match = 0;
    % Maximum time to complete the task
    stop = 60;
    
    % Settings for display
    white = WhiteIndex(outwindow);
    text_size = round(rect(4)/20);
    n_symbols = length(true_shapes);

    % Dimensions settings for the boxes
    max_x = round(rect(3)*0.4);
    max_y = max_x/n_symbols*2;
    tree = max_y/2 *0.7;

    % put x and y at the center of the screen
    x = round(rect(3)/2);
    y = round(rect(4)/2);

    % Start task
    tic();
    
    while toc() < stop
    % ----------------------------- First Grid ------------------------------ %
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
                    % Avoid that same key already pressed added in next box
                    WaitSecs(0.2);
                    break
                end
            end
        end
    
        if length(subject_labels) == n_symbols
            success_series = [success_series, all(subject_labels == indexes)];
            n_success = n_success + sum(subject_labels==indexes) ;
            n_miss_match = n_miss_match + sum(subject_labels~=indexes);
        else
            success_series = [success_series, 0];
            Screen('Flip', outwindow, [], 0);
            if length(subject_labels) > 0 
                n_success = n_success + sum(subject_labels==indexes(1:length(subject_labels))) ;
                n_miss_match = n_miss_match + sum(subject_labels~=indexes(1:length(subject_labels)));
            end
        end
    end
end