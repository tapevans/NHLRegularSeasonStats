%% getH2H

function [H2H] = getH2H(Teams , Scores)
N_teams = length(Teams);

H2H = cell(N_teams);
for TT = 1:N_teams
    for OO = 1:N_teams
        H2H{TT,OO} = zeros(1,3);
    end
end


for TT = 1:N_teams
    for OO = 1:N_teams
        if OO ~= TT
            matchup = intersect(Teams(TT).GameIDXHome,Teams(OO).GameIDX);
            subScores = Scores(matchup);
            for i = length(subScores)
                if subScores(i).HomeScore > subScores(i).AwayScore
                    H2H{TT,OO}(1,1) = H2H{TT,OO}(1,1) + 1;
                else
                    if strcmp(subScores(i).Status , 'Regulation')
                        H2H{TT,OO}(1,2) = H2H{TT,OO}(1,2) + 1;
                    else
                        H2H{TT,OO}(1,3) = H2H{TT,OO}(1,3) + 1;
                    end
                end
            end
            matchup = intersect(Teams(TT).GameIDXAway,Teams(OO).GameIDX);
            subScores = Scores(matchup);
            for i = length(subScores)
                if subScores(i).AwayScore > subScores(i).HomeScore
                    H2H{TT,OO}(1,1) = H2H{TT,OO}(1,1) + 1;
                else
                    if strcmp(subScores(i).Status , 'Regulation')
                        H2H{TT,OO}(1,2) = H2H{TT,OO}(1,2) + 1;
                    else
                        H2H{TT,OO}(1,3) = H2H{TT,OO}(1,3) + 1;
                    end
                end
            end
        end
    end
end
end