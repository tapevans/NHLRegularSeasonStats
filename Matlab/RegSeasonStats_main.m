%% Regular Season Stats
clear all; close all; clc

%% File structure
    currentFolder = pwd;
    idx = find(currentFolder == filesep,1,'last');
    score_dir = currentFolder(1:idx-1);
    score_filename = 'nhl-202223-asplayed.csv';

%% get Teams
    [Teams] = getTeams;

%% Get Scores
    Scores = readtable([score_dir filesep score_filename ]);
    Scores = Scores(:,[1,4:8]); % .csv columns 2 and 3 are game start time, don't want to include those
    Scores = table2struct(Scores);

%% Find the index for each team in scores
    [Teams, Scores, IDX] = setTeamIdx( Teams , Scores );

%% Apply Stats
    [Teams] = getStats(Teams , Scores);

%% Determine Head2Head Matchup
    [H2H] = getH2H(Teams , Scores, IDX); 

%% Determine Current Division Rank
    [Teams] = getDivisionRank(Teams);

%% Determine Current Conference Rank
    [Teams] = getConferenceRank(Teams);

%% Determine Playoff Status
    [Teams] = getPlayoffStatus(Teams);

%% Sort Results
   [Atlantic, Metro , Central, Pacific, Eastern, Western, subScores] =  sortResults(Teams,Scores,IDX);

%% Record Against Playoff Teams
    [Teams] = getRecordAgainstPlayoffTeams(Teams , H2H);

%% Display Record Against Playoff Teams
    dispRecordsAgainstPlayoffTeams(Teams)

%% Display 2 teams H2H
    % desiredTeamIDX = 6;
    % opposingTeamIDX = 13;
    % dispSpecificH2H(desiredTeamIDX , opposingTeamIDX , Teams, H2H)

