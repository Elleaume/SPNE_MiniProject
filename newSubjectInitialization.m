function data = newSubjectInitialization 
    disp('Welcome to the symbol to digit substitution experiment!')
    data.nr = input('Subject number (expected value from 0 to 1000): ');
    while isempty(data.nr) | ~(ismember(data.nr, (0:1000))) 
        data.nr = input('The entered value is not correct. Please enter your subject number (expected value from 0 to 1000): ');
    end
    data.age = input('Age? ');
    while isempty(data.age) | ~(ismember(data.age, (1:100)))
        data.age = input('The entered value is not correct. Please enter your age: ');
    end
    data.gender = input('Gender? (m/f) ', 's');
    while isempty(data.gender) | ~(data.gender == 'f' | data.gender == 'm')
        data.gender = input('The entered value is not correct. Please enter m for male or f for female: ', 's');
    end
    disp('Experiment ready to start!')
end

