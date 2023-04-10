%% getStats


function [Teams] = getStats(Teams , Scores)
% Loop through every game in the table
[N_games,~]    = size(Scores);
for GG = 1:N_games
    if strcmp(Scores(GG).Status , 'Scheduled')
        N_games_played = GG - 1;
        break
    end
end

for TT = 1:length(Teams)
    Teams(TT).GP  = 0;
    Teams(TT).W   = 0;
    Teams(TT).L   = 0;
    Teams(TT).OTL = 0;
    Teams(TT).Pts = 0;
    Teams(TT).GF  = 0;
    Teams(TT).GA  = 0;
    Teams(TT).HGR = 0;
    Teams(TT).AGR = 0;
    Teams(TT).GR  = 0;
    Teams(TT).TPP = 0;
end

%% Games Played
for GG = 1:N_games_played
    Teams(Scores(GG).awayIDX).GP = Teams(Scores(GG).awayIDX).GP + 1;
    Teams(Scores(GG).homeIDX).GP = Teams(Scores(GG).homeIDX).GP + 1;
% Identify the winner
    % Away team won
    if Scores(GG).AwayScore > Scores(GG).HomeScore 
        % disp([Scores(GG).Away ' beat ' Scores(GG).Home])
        % disp([Scores(GG).Away ' gets 2 points'])
        Teams(Scores(GG).awayIDX).Pts = Teams(Scores(GG).awayIDX).Pts + 2;
        if strcmp(Scores(GG).Status , 'Regulation')
            % disp([Scores.Home(GG) ' get 0 points'])
            % Teams(Scores(GG).homeIDX).points = Teams(Scores(GG).homeIDX).points + 0;
        else
            % disp([Scores(GG).Home ' get 1 points'])
            Teams(Scores(GG).homeIDX).Pts = Teams(Scores(GG).homeIDX).Pts + 1;
        end
    % Home team won
    else 
        % disp([Scores(GG).Home ' beat ' Scores(GG).Away])
        % disp([Scores(GG).Home ' gets 2 points'])
        Teams(Scores(GG).homeIDX).Pts = Teams(Scores(GG).homeIDX).Pts + 2;
        if strcmp(Scores(GG).Status , 'Regulation')
            % disp([Scores(GG).Away ' get 0 points'])
            % Teams(Scores(GG).awayIDX).points = Teams(Scores(GG).awayIDX).points + 0;
        else
            % disp([Scores(GG).Away ' get 1 points'])
            Teams(Scores(GG).awayIDX).Pts = Teams(Scores(GG).awayIDX).Pts + 1;
        end
    end


end

%% Remaining Games




end