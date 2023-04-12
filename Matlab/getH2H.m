%% getH2H

function [H2H] = getH2H(Teams , Scores, IDX)
N_teams = length(Teams);

P.Win  = 1;
P.Loss = 2;
P.OTL  = 3;

H2H = cell(N_teams);
for TT = 1:N_teams
    for OO = 1:N_teams
        H2H{TT,OO} = zeros(1,3);
    end
end


for TT = 1:N_teams
    for OO = 1:N_teams
        if OO ~= TT
            if TT == 6 && OO == 13
                TT; % Used for testing
            end
            home_set = IDX(TT).GameIDXHome';
            away_set = IDX(TT).GameIDXAway';
            oo_set   = IDX(OO).GameIDX';

            matchup = intersect(IDX(TT).GameIDXHome,IDX(OO).GameIDX);
            subScores = Scores(matchup);
            for i = length(subScores)
                if ~strcmp(subScores(i).Status , 'Scheduled')
                    if subScores(i).HomeScore > subScores(i).AwayScore
                        H2H{TT,OO}(1,P.Win) = H2H{TT,OO}(1,P.Win) + 1;
                    else
                        if strcmp(subScores(i).Status , 'Regulation')
                            H2H{TT,OO}(1,P.Loss) = H2H{TT,OO}(1,P.Loss) + 1;
                        else
                            H2H{TT,OO}(1,P.OTL)  = H2H{TT,OO}(1,P.OTL)  + 1;
                        end
                    end
                end
            end
            matchup = intersect(IDX(TT).GameIDXAway,IDX(OO).GameIDX);
            subScores = Scores(matchup);
            for i = 1:length(subScores)
                if ~strcmp(subScores(i).Status , 'Scheduled')
                    if subScores(i).AwayScore > subScores(i).HomeScore
                        H2H{TT,OO}(1,P.Win) = H2H{TT,OO}(1,P.Win) + 1;
                    else
                        if strcmp(subScores(i).Status , 'Regulation')
                            H2H{TT,OO}(1,P.Loss) = H2H{TT,OO}(1,P.Loss) + 1;
                        else
                            H2H{TT,OO}(1,P.OTL)  = H2H{TT,OO}(1,P.OTL)  + 1;
                        end
                    end
                end
            end
        end
    end
end
end