%% getSubScores

function [subScores] = getSubScores(Scores , IDX , desTeam , desOpp)
    if ~isempty(desOpp)
        % matchup_home = intersect(IDX(desTeam).GameIDXHome , IDX(desOpp).GameIDX);
        % matchup_away = intersect(IDX(desTeam).GameIDXAway , IDX(desOpp).GameIDX);
        % subScores = [Scores(matchup_home);Scores(matchup_away)];

        matchup = intersect(IDX(desTeam).GameIDX , IDX(desOpp).GameIDX);
        subScores = [Scores(matchup)];
        
    else
        subScores = [Scores(IDX(desTeam).GameIDXAway);Scores(IDX(desTeam).GameIDXHome)];
    end
end