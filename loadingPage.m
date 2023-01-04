function loadingPage(outwindow, rect)

    text_size = round(rect(4)/20);
    white = WhiteIndex(outwindow);
    
    Screen('TextSize', outwindow, text_size);
    DrawFormattedText(outwindow, 'Ready? Press enter to start the test!' , 'center', 'center', white);
    Screen('Flip', outwindow);
    
    waitForEnter;

    Screen('TextSize', outwindow, round(rect(4)/5));
    for i = flip(1:3)
        DrawFormattedText(outwindow, int2str(i), 'center', 'center', white);
        Screen('Flip', outwindow);
        WaitSecs(1);
    end
    DrawFormattedText(outwindow, 'GO!', 'center', 'center', white);
    Screen('Flip', outwindow);
    WaitSecs(1);

end