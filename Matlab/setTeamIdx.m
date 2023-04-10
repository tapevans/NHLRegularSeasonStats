%% setTeamIdx
% set the team index in the table

function [Teams, Scores, IDX] = setTeamIdx( Teams , Scores )
% Initialize
    N_teams     = length(Teams);
    [N_games,~] = size(Scores);
    Scores(1).awayIDX = [];
    Scores(1).homeIDX = [];
    for TT = 1:N_teams
        IDX(TT).GameIDX = [];
        IDX(TT).GameIDXHome = [];
        IDX(TT).GameIDXAway = [];
    end

% Loop through all the teams and place their index in Scores
    for TT = 1:N_teams
        Team_str = Teams(TT).name;
        for GG = 1:N_games
            if strcmp(Scores(GG).Away , Team_str)
                Scores(GG).awayIDX = TT;
                if isempty(IDX(TT).GameIDX)
                    IDX(TT).GameIDX = GG;
                else
                    IDX(TT).GameIDX = [IDX(TT).GameIDX , GG];
                end
                if isempty(IDX(TT).GameIDXAway)
                    IDX(TT).GameIDXAway = GG;
                else
                    IDX(TT).GameIDXAway = [IDX(TT).GameIDXAway , GG];
                end
            end
            if strcmp(Scores(GG).Home , Team_str)
                Scores(GG).homeIDX = TT;
                if isempty(IDX(TT).GameIDX)
                    IDX(TT).GameIDX = GG;
                else
                    IDX(TT).GameIDX = [IDX(TT).GameIDX , GG];
                end
                if isempty(IDX(TT).GameIDXHome)
                    IDX(TT).GameIDXHome = GG;
                else
                    IDX(TT).GameIDXHome = [IDX(TT).GameIDXHome , GG];
                end
            end
        end
    end

% 


end