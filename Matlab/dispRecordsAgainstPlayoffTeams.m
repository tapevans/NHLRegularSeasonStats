function dispRecordsAgainstPlayoffTeams(Teams)
%% get idx of playoff teams
idx = [];
for TT = 1:32
    if Teams(TT).clinchedPlayoffs == 1
        if isempty(idx)
            idx = TT;
        else
            idx = [idx;TT];
        end
    end
end

%% Hard Code idx
idx = [8; 25; 10; 15; 30; 32; 12; 14; 3; 13; 28; 27; 6; 19; 18; 20];

%% Display Record
for PP = idx'
    disp([Teams(PP).name ' has a record of ' num2str(Teams(PP).PlayoffTeamsRecord(1)) '-' num2str(Teams(PP).PlayoffTeamsRecord(2)) '-' num2str(Teams(PP).PlayoffTeamsRecord(3)) ' against playoff teams.'])

    num_games = sum(Teams(PP).PlayoffTeamsRecord);
    pts = 2*Teams(PP).PlayoffTeamsRecord(1) + Teams(PP).PlayoffTeamsRecord(3);
    ptsPer = pts / (2*num_games);
    disp(['This is a points percentage of ' num2str(ptsPer) '%.'])
    disp(newline)
end

end