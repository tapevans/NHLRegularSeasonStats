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

function [Teams] = getDivisionRank(Teams)

end