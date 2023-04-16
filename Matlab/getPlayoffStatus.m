%% getPlayoffStatus
% Determine

function [Teams] = getPlayoffStatus(Teams)
%% !!!!!!!!!!!!!!!!!!!!!!!!HardCoded
for i = 1:32
    if     strcmp(Teams(i).name , 'Colorado Avalanche')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Seattle Kraken')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Dallas Stars')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Minnesota Wild')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Vegas Golden Knights')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Winnipeg Jets')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Edmonton Oilers')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Los Angeles Kings')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Boston Bruins')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Florida Panthers')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Toronto Maple Leafs')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Tampa Bay Lightning')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'Carolina Hurricanes')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'New York Islanders')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'New Jersey Devils')
        Teams(i).clinchedPlayoffs = 1;
    elseif strcmp(Teams(i).name , 'New York Rangers')
        Teams(i).clinchedPlayoffs = 1;
    else
        Teams(i).clinchedPlayoffs = 0;
    end

end

end