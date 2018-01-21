% Quy Chau
% May 2017
% Function handles the generation and playing of samples based on input wav

function[] = mainFM()

m = 0;
while (m == 0) %Run for specified instrument
    
    prompt = 'filename of WAV file sample (or enter end to exit): ';
    str = input(prompt,'s');
    
    if (strcmp(str, 'end'))
        break
        k = 1;
    end
    
    [a, b, c, d, e, f, g, h, i, j] = generator(str);
    
    disp('input fc: ')
    disp(a)
    disp('input fm: ')
    disp(b)
    disp('fm/fc: ')
    disp(b/a)
    
    k = 0;
    while (k == 0) %User input of note
        prompt = 'Note to be played (or enter end to play another instrument): ';
        str = input(prompt, 's');
        
        if (strcmp(str, 'end'))
            break
            k = 1;
        end
        
        num=str2double(regexp(str,'[\d.]+','match'));
        notecell = (regexp(str,'[A-G][b]*[#]*','match'));
        note = notecell{1};
        
        [aa, bb] = noteConvert(a, b, note, num);
        
        disp('output fc: ')
        disp(aa)
        disp('output fm: ')
        disp(bb)
        
        operator(aa, bb, c, d, e, f, g, h, i, j);
    end
end
close all

end

