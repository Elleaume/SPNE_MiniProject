function waitForEnter()
    WaitSecs(0.2);
    keyIsDown = 0;
    while ~keyIsDown 
        [keyIsDown, seconds, key_code] = KbCheck();
        if keyIsDown
            key = KbName([key_code])
            if key == 'Return'
                break
            else
                waitForEnter()
            end
        end
    end
end
