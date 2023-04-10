
function [Atlantic, Metro , Central, Pacific, subScores] = sortResults(Teams,Scores,IDX)
T = struct2table(Teams);
sortedT = sortrows(T , 'divison');
Atlantic = sortedT(1:8,:);
Atlantic = sortrows(Atlantic,'Pts', 'descend');
Central = sortedT(9:16,:);
Central = sortrows(Central,'Pts', 'descend');
Metro = sortedT(17:24,:);
Metro = sortrows(Metro,'Pts', 'descend');
Pacific = sortedT(25:32,:);
Pacific = sortrows(Pacific,'Pts', 'descend');


TT = 6;
subScores = [Scores(IDX(TT).GameIDXAway);Scores(IDX(TT).GameIDXHome)];

% N_teams     = length(Teams);
% for TT = 2:N_teams
%     subScores(:,TT) = [Scores(IDX(TT).GameIDXAway);Scores(IDX(TT).GameIDXHome)];
% end

end