% Quy Chau
% May 2017
% Function takes in carrier and modulator frequency, as well as
% desired frequency (as a note)
% outputs a carrier and modulator frequency
% with same ratio as input fc and fm

function[foc, fom] = noteConvert(fc, fm, noname, oct)

nonum = 0;

if (strcmp(noname, 'A'))
    nonum = 0;
elseif (strcmp(noname, 'A#') | strcmp(noname, 'Bb'))
    nonum = 1;
elseif (strcmp(noname, 'B') | strcmp(noname, 'Cb'))
    nonum = 2;
elseif (strcmp(noname, 'C') | strcmp(noname, 'B#'))
    nonum = 3;
elseif (strcmp(noname, 'C#') | strcmp(noname, 'Db'))
    nonum = 4;
elseif (strcmp(noname, 'D'))
    nonum = 5;
elseif (strcmp(noname, 'D#') | strcmp(noname, 'Eb'))
    nonum = 6;
elseif (strcmp(noname, 'E') | strcmp(noname, 'Fb'))
    nonum = 7;
elseif (strcmp(noname, 'F') | strcmp(noname, 'E#'))
    nonum = 8;
elseif (strcmp(noname, 'F#') | strcmp(noname, 'Gb'))
    nonum = 9;
elseif (strcmp(noname, 'G'))
    nonum = 10;
elseif (strcmp(noname, 'G#') | strcmp(noname, 'Ab'))
    nonum = 11;
end


note = nonum + oct*12;

foc = (27.5/2)*2^(note/12);
fom = foc*(fm/fc);


end