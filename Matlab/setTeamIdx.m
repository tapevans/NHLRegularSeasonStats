%% setTeamIdx
% set the team index in the table

function [Teams, Scores] = setTeamIdx( Teams , Scores )
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
                if isempty(Teams(TT).GameIDX)
                    Teams(TT).GameIDX = GG;
                else
                    Teams(TT).GameIDX = [Teams(TT).GameIDX , GG];
                end
                if isempty(Teams(TT).GameIDXAway)
                    Teams(TT).GameIDXAway = GG;
                else
                    Teams(TT).GameIDXAway = [Teams(TT).GameIDXAway , GG];
                end
            end
            if strcmp(Scores(GG).Home , Team_str)
                Scores(GG).homeIDX = TT;
                if isempty(Teams(TT).GameIDX)
                    Teams(TT).GameIDX = GG;
                else
                    Teams(TT).GameIDX = [Teams(TT).GameIDX , GG];
                end
                if isempty(Teams(TT).GameIDXHome)
                    Teams(TT).GameIDXHome = GG;
                else
                    Teams(TT).GameIDXHome = [Teams(TT).GameIDXHome , GG];
                end
            end
        end
    end

% 


end