%% Initialize Teams

function [Teams] = getTeams
i = 1;

Teams(i).name       = 'Anaheim Ducks';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Arizona Coyotes';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Boston Bruins';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Buffalo Sabres';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Calgary Flames';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Carolina Hurricanes';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Chicago Blackhawks';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Colorado Avalanche';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Columbus Blue Jackets';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Dallas Stars';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Detroit Red Wings';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Edmonton Oilers';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Florida Panthers';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Los Angeles Kings';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Minnesota Wild';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Montreal Canadiens';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Nashville Predators';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'New Jersey Devils';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'New York Islanders';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'New York Rangers';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Ottawa Senators';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Philadelphia Flyers';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Pittsburgh Penguins';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'San Jose Sharks';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Seattle Kraken';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'St. Louis Blues';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Tampa Bay Lightning';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Toronto Maple Leafs';
Teams(i).divison    = 'Atlantic';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Vancouver Canucks';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Vegas Golden Knights';
Teams(i).divison    = 'Pacific';
Teams(i).conference = 'Western';
i = i+1;

Teams(i).name       = 'Washington Capitals';
Teams(i).divison    = 'Metropolitan';
Teams(i).conference = 'Eastern';
i = i+1;

Teams(i).name       = 'Winnipeg Jets';
Teams(i).divison    = 'Central';
Teams(i).conference = 'Western';
i = i+1;



for TT = 1:length(Teams)
    % Google Standings Order
    Teams(TT).GP  = 0; % Games Played
    Teams(TT).W   = 0; % Wins
    Teams(TT).L   = 0; % Loses
    Teams(TT).OTL = 0; % Overtime Loses
    Teams(TT).Pts = 0; % Points
    Teams(TT).GF  = 0; % Goals For
    Teams(TT).GA  = 0; % Goals Against
    Teams(TT).Dif = 0; % Goals For - Goals Against
    Teams(TT).TPP = 0; % Total Possible Points
    Teams(TT).Per = 0; % Points Percentage
    Teams(TT).RW  = 0; % Regulation Wins
    Teams(TT).ROW = 0; % Regulation and OT Wins
    Teams(TT).HGR = 0; % Home Games Remaining
    Teams(TT).AGR = 0; % Away Games Remaining
    Teams(TT).GR  = 0; % Games Remaining
    Teams(TT).HR  = [0,0,0]; % Home Record
    Teams(TT).AR  = [0,0,0]; % Away Record
    Teams(TT).OTR = [0,0];   % Overtime Record
    Teams(TT).SOR = [0,0];   % Shootout Record
    Teams(TT).DivRank = 0; % Division Rank
    Teams(TT).PlayoffTeamsRecord  = [0,0,0]; % Home Record

    % % NHL Site Order
    % Teams(TT).GP  = 0; % Games Played
    % Teams(TT).W   = 0; % Wins
    % Teams(TT).L   = 0; % Loses
    % Teams(TT).OTL = 0; % Overtime Loses
    % Teams(TT).Pts = 0; % Points
    % Teams(TT).Per = 0; % Points Percentage
    % Teams(TT).RW  = 0; % Regulation Wins
    % Teams(TT).ROW = 0; % Regulation and OT Wins
    % Teams(TT).GF  = 0; % Goals For
    % Teams(TT).GA  = 0; % Goals Against
    % Teams(TT).Dif = 0; % Goals For - Goals Against
    % Teams(TT).HR  = [0,0,0]; % Home Record
    % Teams(TT).AR  = [0,0,0]; % Away Record
    % Teams(TT).SOR = [0,0];   % Shootout Record
    % Teams(TT).HGR = 0; % Home Games Remaining
    % Teams(TT).AGR = 0; % Away Games Remaining
    % Teams(TT).TPP = 0; % Total Possible Points
    % Teams(TT).GR  = 0; % Games Remaining
    % Teams(TT).OTR = [0,0];   % Overtime Record
    % Teams(TT).DivRank = 0; % Division Rank
    % Teams(TT).ConRank = 0; % Conference Rank
end

end