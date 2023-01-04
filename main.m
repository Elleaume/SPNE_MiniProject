%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Symbol to digit substitution %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Camille Elleaume %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% January 2023 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;  
close all;
clc;

% ------------------- Initialize Participant data ----------------------- %

data = newSubjectInitialization;

% -------------------------- Initialization ----------------------------- %
if ismac()
    oldValue = Screen('Preference', 'SkipSyncTests', 1);
end
back_color = [0 0 0];
text_color = [255 255 255];

% Call all of your screens
screens = Screen('Screens');
% Change the value of the screenNumber variable to get the test displayed on a differet screen
screen_number = max(screens);
% get dimension of the screen and draw window
[outwindow, rect] = Screen('OpenWindow', screen_number, back_color);

% Specify ground truth of shapes
true_shapes = ["circle", "moon", "triangle", "lightning", "square", "cross", "hat", "equal" ];

% getDevices = PsychHID('Devices');
KbName('UnifyKeyNames');

% --------------------------- Welcoming page ---------------------------- %

welcomingPage(outwindow, rect);

% --------------------------- Instruction page -------------------------- %

instructionPage(outwindow, rect, text_color, true_shapes);

% --------------------------- Loading Page ------------------------------ %

loadingPage(outwindow, rect);

% ---------------------------- Start Task! ------------------------------ %

success = symbolDigitTask(outwindow, rect, text_color, true_shapes);
data.overallScore = sum(success);
data.nTrial = length(success);
% ---------------------------- End Page --------------------------------- %

endingPage(outwindow, rect);

% ------------------------------ The End -------------------------------- %

WaitSecs(5);

Screen('CloseAll')