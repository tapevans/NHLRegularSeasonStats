
function [Atlantic, Metro , Central, Pacific, Eastern, Western] = sortResults(Teams)%,Scores,IDX)
%% Separate into divisons
    T = struct2table(Teams);
    sortedT = sortrows(T , 'divison');
    
    Atlantic = sortedT(1:8,:);
    Central  = sortedT(9:16,:);
    Metro    = sortedT(17:24,:);
    Pacific  = sortedT(25:32,:);

%% Separate into Conference
    T = struct2table(Teams);
    sortedT = sortrows(T , 'conference');
    
    Eastern = sortedT(1 :16,:);
    Western = sortedT(17:32,:);

%% Sort each division by Points
    % Atlantic = sortrows(Atlantic,'Pts', 'descend');
    % Central  = sortrows(Central ,'Pts', 'descend');
    % Metro    = sortrows(Metro   ,'Pts', 'descend');
    % Pacific  = sortrows(Pacific ,'Pts', 'descend');
    
    Atlantic = sortrows(Atlantic,'DivRank');
    Central  = sortrows(Central ,'DivRank');
    Metro    = sortrows(Metro   ,'DivRank');
    Pacific  = sortrows(Pacific ,'DivRank');

%% Sort each Conference by Points
    Eastern = sortrows(Eastern,'Pts', 'descend');
    Western  = sortrows(Western ,'Pts', 'descend');


end