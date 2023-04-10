%% setTeamIdx
% set the team index in the table

function [Scores] = setTeamIdx( Teams , Scores )
% Initialize
    N_Teams     = length(Teams);
    [N_games,~] = size(Scores);
    Scores(1).awayIDX = [];
    Scores(1).homeIDX = [];

% Loop through all the teams and place their index in Scores
    for TT = 1:N_Teams
        Team_str = Teams(TT).name;
        for GG = 1:N_games
            if strcmp(Scores(GG).Away , Team_str)
                Scores(GG).awayIDX = TT;
            end
            if strcmp(Scores(GG).Home , Team_str)
                Scores(GG).homeIDX = TT;
            end
        end
    end


end