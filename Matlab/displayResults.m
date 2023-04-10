
function displayResults(Teams)
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



end