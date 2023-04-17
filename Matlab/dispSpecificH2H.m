function dispSpecificH2H(desiredTeamIDX , opposingTeamIDX , Teams, H2H)
    desired_str  = Teams(desiredTeamIDX).name;
    opposing_str = Teams(opposingTeamIDX).name;
    record = H2H{desiredTeamIDX , opposingTeamIDX};
    disp([desired_str  ' have a record of ' num2str(record(1)) '-' num2str(record(2)) '-' num2str(record(3)) ' against the ' opposing_str])
    record = H2H{opposingTeamIDX , desiredTeamIDX};
    disp([opposing_str ' have a record of ' num2str(record(1)) '-' num2str(record(2)) '-' num2str(record(3)) ' against the ' desired_str])
    disp(newline)
end