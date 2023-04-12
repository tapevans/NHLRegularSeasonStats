%% getDivisionRank
% Tie-Breaker Procedure 
%
% 1) The fewer number of games played (i.e., superior points percentage). 
% 
% 2) The greater number of games won, excluding games won in Overtime or by
% Shootout (i.e., "Regulation Wins"). This figure is reflected in the RW
% column. 
% 
% 3) The greater number of games won, excluding games won by Shootout. This
% figure is reflected in the ROW column.
% 
% 4) The greater number of games won by the Club in any manner (i.e, "Total
% Wins"). This figure is reflected in the W column. 
% 
% 5) The greater number of points earned in games against each other among
% two or more tied clubs. For the purpose of determining standing for two
% or more Clubs that have not played an even number of games with one or
% more of the other tied Clubs, the first game played in the city that has
% the extra game (the "odd game") shall not be included. When more than two
% Clubs are tied, the percentage of available points earned in games among
% each other (and not including any "odd games") shall be used to determine
% standing. 
% 
% 6) The greater differential between goals for and against (including
% goals scored in Overtime or awarded for prevailing in Shootouts) for the
% entire regular season. This figure is reflected in the DIFF column. 
% 
% 7)
% The greater number of goals scored (including goals scored in Overtime or
% awarded for prevailing in Shootouts) for the entire regular season. This
% figure is reflected in the GF column.

% 0) Points
% 1) Per
% 2) RW
% 3) ROW
% 4) W
% 5) ~ Uh, figure this out later
% 6) Dif
% 7) GF

function [Teams] = getDivisionRank(Teams)
% Get the index for teams in each division
    DivisonIDX.Atlantic = [];
    DivisonIDX.Central  = [];
    DivisonIDX.Metro    = [];
    DivisonIDX.Pacific  = [];

    N_teams     = length(Teams);
    for TT = 1:N_teams
        if     strcmp(Teams(TT).divison, 'Atlantic')
            if isempty(DivisonIDX.Atlantic)
                DivisonIDX.Atlantic = TT;
            else
                DivisonIDX.Atlantic = [DivisonIDX.Atlantic ; TT];
            end
        elseif strcmp(Teams(TT).divison, 'Central')
            if isempty(DivisonIDX.Central)
                DivisonIDX.Central = TT;
            else
                DivisonIDX.Central = [DivisonIDX.Central ; TT];
            end
        elseif strcmp(Teams(TT).divison, 'Metropolitan')
            if isempty(DivisonIDX.Metro)
                DivisonIDX.Metro = TT;
            else
                DivisonIDX.Metro = [DivisonIDX.Metro ; TT];
            end
        elseif strcmp(Teams(TT).divison, 'Pacific')
            if isempty(DivisonIDX.Pacific)
                DivisonIDX.Pacific = TT;
            else
                DivisonIDX.Pacific = [DivisonIDX.Pacific ; TT];
            end
        else
            disp('error in determining divison idx')
        end
    end

%% Find the number of teams in each Divison
    N_teams_A = length(DivisonIDX.Atlantic);
    N_teams_C = length(DivisonIDX.Central);
    N_teams_M = length(DivisonIDX.Metro);
    N_teams_P = length(DivisonIDX.Pacific);

%% Split Teams into divison
    Atlantic = Teams(DivisonIDX.Atlantic);
    Central  = Teams(DivisonIDX.Central);
    Metro    = Teams(DivisonIDX.Metro);
    Pacific  = Teams(DivisonIDX.Pacific);

%% Convert to Tables
    AtlanticT = struct2table(Atlantic);
    CentralT  = struct2table(Central);
    MetroT    = struct2table(Metro);
    PacificT  = struct2table(Pacific);

%% Sort each division by Points
    AtlanticT = sortrows(AtlanticT,'Pts', 'descend');
    CentralT  = sortrows(CentralT ,'Pts', 'descend');
    MetroT    = sortrows(MetroT   ,'Pts', 'descend');
    PacificT  = sortrows(PacificT ,'Pts', 'descend');

% %% Convert to Struct
%     Atlantic = struct2table(AtlanticT);
%     Central  = struct2table(CentralT);
%     Metro    = struct2table(MetroT);
%     Pacific  = struct2table(PacificT);

%% Determine Divison Rank
% Are their any teams with the same number of points
    % Atlantic
        idx_A = find(AtlanticT.Pts(1:end-1)==AtlanticT.Pts(2:end));
        if isempty(idx_A)
            for DD = 1:N_teams_A
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, AtlanticT.name{DD})
                        Teams(TT).DivRank = DD;
                    end
                end
            end
        end
    % Central
        idx_C = find(CentralT.Pts(1:end-1)==CentralT.Pts(2:end));
        if isempty(idx_C)
            for DD = 1:N_teams_C
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, CentralT.name{DD})
                        Teams(TT).DivRank = DD;
                    end
                end
            end
        end
    % Metro
        idx_M = find(MetroT.Pts(1:end-1)==MetroT.Pts(2:end));
        if isempty(idx_M)
            for DD = 1:N_teams_M
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, MetroT.name{DD})
                        Teams(TT).DivRank = DD;
                    end
                end
            end
        end
    % Pacific
        idx_P = find(PacificT.Pts(1:end-1)==PacificT.Pts(2:end));
        if isempty(idx_P)
            for DD = 1:N_teams_P
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, PacificT.name{DD})
                        Teams(TT).DivRank = DD;
                    end
                end
            end
        end

end

    % Atlantic
    % Central
    % Metro
    % Pacific










