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
% Change the value of the screenNumber variable to get the test displayed 
% on a differet screen
screen_number = max(screens);
% get dimension of the screen and draw window
[outwindow, rect] = Screen('OpenWindow', screen_number, back_color);

% Specify ground truth of shapes
true_shapes = ["circle", "moon", "triangle", "lightning", "square", ...
    "cross", "hat", "equal" ];

% getDevices = PsychHID('Devices');
KbName('UnifyKeyNames');

% --------------------------- Welcoming page ---------------------------- %

welcomingPage(outwindow, rect);

% --------------------------- Instruction page -------------------------- %

instructionPage(outwindow, rect, text_color, true_shapes);

% --------------------------- Loading Page ------------------------------ %

loadingPage(outwindow, rect);

% ---------------------------- Start Task! ------------------------------ %

[success_series, n_success, n_miss_match] = symbolDigitTask(outwindow, rect, text_color, true_shapes);

data.n_successfull_serie = sum(success_series);
data.n_trial = length(success_series);
data.n_success = n_success;
data.n_miss_match = n_miss_match;
% ---------------------------- End Page --------------------------------- %

endingPage(outwindow, rect);

% ------------------------------ The End -------------------------------- %

WaitSecs(5);

Screen('CloseAll')

%writetable(struct2table(data), 'results/data.csv')

% Save the new results
previous_data = readtable('results/data.csv');
overall_data = [previous_data;struct2table(data)];
writetable(overall_data, 'results/data.csv')


