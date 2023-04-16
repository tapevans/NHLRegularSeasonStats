%%

function [Teams] = getRecordAgainstPlayoffTeams(Teams , H2H)
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

%% Get Record
for PP = idx'
    for PP_p = idx'
        if PP_p ~= PP
            Teams(PP).PlayoffTeamsRecord = Teams(PP).PlayoffTeamsRecord + H2H{PP,PP_p};
        end
    end
end

end