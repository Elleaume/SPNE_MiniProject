oldValue = Screen('Preference', 'SyncTestSettings', 0.001);

% Call all of your screens
screens = Screen('Screens');
% Change the value of the screenNumber variable to get the test displayed on a differet screen
screenNumber = max(screens);
% get dimension of the screen and draw window
[settings.screen.outwindow, settings.screen.outwindowdims] = Screen('OpenWindow', screenNumber, settings.layout.color.background);
DrawFormattedText(settings.screen.outwindow, 'Hello World', 'center', 'center', settings.layout.color.text);
Screen('Flip', settings.screen.outwindow);
WaitSecs(3);

Screen('CloseAll');
