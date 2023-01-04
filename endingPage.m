function endingPage(outwindow, rect)

    white = WhiteIndex(outwindow); 
    Screen('TextSize', outwindow, round(rect(4)/10));
    DrawFormattedText(outwindow, 'DONE!', 'center', 2*round(rect(4)/4), white);
    Screen('Flip', outwindow, [], 1);
    WaitSecs(1);
    DrawFormattedText(outwindow, 'Thank you for participating!', 'center', 3*round(rect(4)/4), white);
    Screen('Flip', outwindow);
end