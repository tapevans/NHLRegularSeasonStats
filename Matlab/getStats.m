%% getStats


function [Teams] = getStats(Teams , Scores)
% Initialize
N_teams     = length(Teams);
[N_games,~] = size(Scores);

P.Win  = 1;
P.Loss = 2;
P.OTL  = 3;

for GG = 1:N_games
    if strcmp(Scores(GG).Status , 'Scheduled')
        N_games_played = GG - 1;
        break
    end
end
if ~strcmp(Scores(N_games).Status, 'Scheduled')
    N_games_played = N_games;
end
% Loop through every game in the table

%% Completed Games
for GG = 1:N_games_played
    %% Games Played
    Teams(Scores(GG).awayIDX).GP = Teams(Scores(GG).awayIDX).GP + 1;
    Teams(Scores(GG).homeIDX).GP = Teams(Scores(GG).homeIDX).GP + 1;

    %% Goals For
    Teams(Scores(GG).awayIDX).GF = Teams(Scores(GG).awayIDX).GF + Scores(GG).AwayScore;
    Teams(Scores(GG).homeIDX).GF = Teams(Scores(GG).homeIDX).GF + Scores(GG).HomeScore;

    %% Goals Against
    Teams(Scores(GG).awayIDX).GA = Teams(Scores(GG).awayIDX).GA + Scores(GG).HomeScore;
    Teams(Scores(GG).homeIDX).GA = Teams(Scores(GG).homeIDX).GA + Scores(GG).AwayScore;

    %% Identify the winner
    %% Away team won
    if Scores(GG).AwayScore > Scores(GG).HomeScore
        % Update Away Points
            Teams(Scores(GG).awayIDX).Pts = Teams(Scores(GG).awayIDX).Pts + 2;

        % Update Away Wins
            Teams(Scores(GG).awayIDX).W   = Teams(Scores(GG).awayIDX).W   + 1;

        % Update Away Record (Win)
            Teams(Scores(GG).awayIDX).AR(P.Win) = Teams(Scores(GG).awayIDX).AR(P.Win) + 1; 

        if strcmp(Scores(GG).Status , 'Regulation')            
            % Add win to RW for away team
                Teams(Scores(GG).awayIDX).RW = Teams(Scores(GG).awayIDX).RW + 1; 
            
            % Update Home Points
                % Teams(Scores(GG).homeIDX).points = Teams(Scores(GG).homeIDX).points + 0;

            % Update Home Loss
                Teams(Scores(GG).homeIDX).L   = Teams(Scores(GG).homeIDX).L   + 1;
                
            % Update Home Record (Loss)
                Teams(Scores(GG).homeIDX).HR(P.Loss) = Teams(Scores(GG).homeIDX).HR(P.Loss) + 1;
        else
            % Update Points
                Teams(Scores(GG).homeIDX).Pts = Teams(Scores(GG).homeIDX).Pts + 1;

            % Update OTL
                Teams(Scores(GG).homeIDX).OTL = Teams(Scores(GG).homeIDX).OTL + 1;

            % Update Home Record (OT Loss)
                Teams(Scores(GG).homeIDX).HR(P.OTL) = Teams(Scores(GG).homeIDX).HR(P.OTL) + 1;

            % Update OT Record
            if strcmp(Scores(GG).Status , 'OT')
                % Away (OTR Win)
                    Teams(Scores(GG).awayIDX).OTR(P.Win)  = Teams(Scores(GG).awayIDX).OTR(P.Win)  + 1;
                % Home (OTR Loss)
                    Teams(Scores(GG).homeIDX).OTR(P.Loss) = Teams(Scores(GG).homeIDX).OTR(P.Loss) + 1;
                
            % Update SO Record    
            elseif strcmp(Scores(GG).Status , 'SO')
                % Away (SOR Win)
                    Teams(Scores(GG).awayIDX).SOR(P.Win)  = Teams(Scores(GG).awayIDX).SOR(P.Win)  + 1;
                % Home (SOR Loss)
                    Teams(Scores(GG).homeIDX).SOR(P.Loss) = Teams(Scores(GG).homeIDX).SOR(P.Loss) + 1;
            else
                disp('Something is wrong here')
            end
        end

    %% Home team won
    else 
        % Update Home Points
            Teams(Scores(GG).homeIDX).Pts = Teams(Scores(GG).homeIDX).Pts + 2;

        % Update Home Wins
            Teams(Scores(GG).homeIDX).W   = Teams(Scores(GG).homeIDX).W   + 1;

        % Update Home Record (Win)
            Teams(Scores(GG).homeIDX).HR(P.Win) = Teams(Scores(GG).homeIDX).HR(P.Win) + 1;
        
        
        if strcmp(Scores(GG).Status , 'Regulation')            
            % Add win to RW for home team
                Teams(Scores(GG).homeIDX).RW = Teams(Scores(GG).homeIDX).RW + 1; 
            
            % Update Away Points
                % Teams(Scores(GG).awayIDX).points = Teams(Scores(GG).awayIDX).points + 0;

            % Update Away Loss
                Teams(Scores(GG).awayIDX).L   = Teams(Scores(GG).awayIDX).L   + 1;
                
            % Update Away Record (Loss)
                Teams(Scores(GG).awayIDX).AR(P.Loss) = Teams(Scores(GG).awayIDX).AR(P.Loss) + 1;            
        else
            % Update Away Points
                Teams(Scores(GG).awayIDX).Pts = Teams(Scores(GG).awayIDX).Pts + 1;

            % Update Away OTL
                Teams(Scores(GG).awayIDX).OTL = Teams(Scores(GG).awayIDX).OTL + 1;

            % Update Away Record (OT Loss)
                Teams(Scores(GG).awayIDX).AR(P.OTL) = Teams(Scores(GG).awayIDX).AR(P.OTL) + 1;

            % Update OT Record
            if strcmp(Scores(GG).Status , 'OT')
                % Home (OTR Win)
                    Teams(Scores(GG).homeIDX).OTR(P.Win)  = Teams(Scores(GG).homeIDX).OTR(P.Win)  + 1;

                % Away (OTR Loss)
                    Teams(Scores(GG).awayIDX).OTR(P.Loss) = Teams(Scores(GG).awayIDX).OTR(P.Loss) + 1;
                
            % Update SO Record    
            elseif strcmp(Scores(GG).Status , 'SO')
                % Home (SOR Win)
                    Teams(Scores(GG).homeIDX).SOR(P.Win)  = Teams(Scores(GG).homeIDX).SOR(P.Win)  + 1;
                % Away (SOR Loss)
                    Teams(Scores(GG).awayIDX).SOR(P.Loss) = Teams(Scores(GG).awayIDX).SOR(P.Loss) + 1;
            else
                disp('Something is wrong here')
            end
        end
    end


end


%% Remaining Games
    for GG = N_games_played + 1:N_games
        Teams(Scores(GG).awayIDX).GR = Teams(Scores(GG).awayIDX).GR + 1;
        Teams(Scores(GG).homeIDX).GR = Teams(Scores(GG).homeIDX).GR + 1;
        
        for TT = 1:N_teams
            if strcmp(Scores(GG).Away , Teams(TT).name)
                Teams(TT).AGR = Teams(TT).AGR + 1;
            end
            if strcmp(Scores(GG).Home , Teams(TT).name)
                Teams(TT).HGR = Teams(TT).HGR + 1;
            end
        end
    
    end


%% Total Possible Points
    for TT = 1:N_teams
        Teams(TT).TPP = Teams(TT).Pts + 2*Teams(TT).GR;
    end


%% Goal Differential
    for TT = 1:N_teams
        Teams(TT).Dif = Teams(TT).GF - Teams(TT).GA;
    end


%% Points Percentage
    for TT = 1:N_teams
        Teams(TT).Per = Teams(TT).Pts/ ( 2*Teams(TT).GP );
    end

%% Regulation + OT Wins
    for TT = 1:N_teams
        Teams(TT).ROW = Teams(TT).RW + Teams(TT).OTR(P.Win);
    end


end