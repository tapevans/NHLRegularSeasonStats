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
    Scores = Scores(:,[1,4:8]);
    Scores = table2struct(Scores);

%% Find the index for each team in scores
    [Teams, Scores, IDX] = setTeamIdx( Teams , Scores );

%% Apply Stats
    [Teams] = getStats(Teams , Scores);

%% Determine Head2Head Matchup
    [H2H] = getH2H(Teams , Scores, IDX);

%% Determine Playoff Status
    [Teams] = getPlayoffStatus(Teams);

%% Display Results
   [Atlantic, Metro , Central, Pacific, subScores] =  sortResults(Teams,Scores,IDX);