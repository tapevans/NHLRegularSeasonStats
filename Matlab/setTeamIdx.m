%% setTeamIdx
% set the team index in the table

function [Scores] = setTeamIdx( Teams , Scores )
% Initialize
    N_Teams     = length(Teams);
    [N_games,~] = size(Scores);
    Scores(1).awayIDX = [];
    Scores(1).homeIDX = [];

% Loop through all the teams and place their index in Scores
    % tic
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
    % toc

    % tic
    % for GG = 1:N_games
    %     AwaySTR = Scores(GG).Away;
    %     HomeSTR = Scores(GG).Home;
    %     for TT = 1:N_Teams
    %         if strcmp(AwaySTR , Teams(TT).name)
    %             Scores(GG).awayIDX = TT;
    %         end
    %         if strcmp(HomeSTR , Teams(TT).name)
    %             Scores(GG).homeIDX = TT;
    %         end
    %     end
    % end
    % toc

% Add to existing table
    % T_right = table(awayIDX , homeIDX);
    % Scores = join(Scores,T_right);

end