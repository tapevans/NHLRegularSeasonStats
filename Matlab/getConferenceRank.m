function [Teams] = getConferenceRank(Teams)
% Get the index for teams in each conference
    ConferenceIDX.Eastern = [];
    ConferenceIDX.Western = [];

    N_teams     = length(Teams);
    for TT = 1:N_teams
        if     strcmp(Teams(TT).conference, 'Eastern')
            if isempty(ConferenceIDX.Eastern)
                ConferenceIDX.Eastern = TT;
            else
                ConferenceIDX.Eastern = [ConferenceIDX.Eastern; TT];
            end
        elseif strcmp(Teams(TT).conference, 'Western')
            if isempty(ConferenceIDX.Western)
                ConferenceIDX.Western = TT;
            else
                ConferenceIDX.Western = [ConferenceIDX.Western ; TT];
            end
        else
            disp('error in determining divison idx')
        end
    end

%% Find the number of teams in each Divison
    N_teams_A = length(ConferenceIDX.Eastern);
    N_teams_C = length(ConferenceIDX.Western);

%% Split Teams into divison
    Eastern = Teams(ConferenceIDX.Eastern);
    Western  = Teams(ConferenceIDX.Western);

%% Convert to Tables
    EasternT = struct2table(Eastern);
    WesternT  = struct2table(Western);

%% Sort each division by Points
    EasternT = sortrows(EasternT,'Pts', 'descend');
    WesternT  = sortrows(WesternT ,'Pts', 'descend');

% %% Convert to Struct
%     Eastern = struct2table(EasternT);
%     Western  = struct2table(WesternT);

%% Determine Divison Rank
% Are their any teams with the same number of points
    % Eastern
        idx_E = find(EasternT.Pts(1:end-1)==EasternT.Pts(2:end));
        if isempty(idx_E)
            for DD = 1:N_teams_A
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, EasternT.name{DD})
                        Teams(TT).ConRank = DD;
                    end
                end
            end
        end
    % Western
        idx_W = find(WesternT.Pts(1:end-1)==WesternT.Pts(2:end));
        if isempty(idx_W)
            for DD = 1:N_teams_C
                for TT = 1:N_teams
                    if strcmp(Teams(TT).name, WesternT.name{DD})
                        Teams(TT).ConRank = DD;
                    end
                end
            end
        end
end

    % Eastern
    % Western