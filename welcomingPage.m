function welcomingPage(outwindow, rect)
    
    text_size = round(rect(4)/20);
    text_size_small = round(rect(4)/40);
    
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
end