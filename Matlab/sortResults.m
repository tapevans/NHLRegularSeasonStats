
function [Atlantic, Metro , Central, Pacific, subScores] = sortResults(Teams,Scores,IDX)
%% Separate into divisons
T = struct2table(Teams);
sortedT = sortrows(T , 'divison');

Atlantic = sortedT(1:8,:);
Central  = sortedT(9:16,:);
Metro    = sortedT(17:24,:);
Pacific  = sortedT(25:32,:);


%% Sort each division by Points
Atlantic = sortrows(Atlantic,'Pts', 'descend');
Central  = sortrows(Central ,'Pts', 'descend');
Metro    = sortrows(Metro   ,'Pts', 'descend');
Pacific  = sortrows(Pacific ,'Pts', 'descend');


%% Determine current divison rank
% Split tie breakers


%% !!!!!!!!!Split off subscores into its own function
TT = 6;
subScores = [Scores(IDX(TT).GameIDXAway);Scores(IDX(TT).GameIDXHome)];

% N_teams     = length(Teams);
% for TT = 2:N_teams
%     subScores(:,TT) = [Scores(IDX(TT).GameIDXAway);Scores(IDX(TT).GameIDXHome)];
% end

end