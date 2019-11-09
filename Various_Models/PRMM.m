function str = PRMM(EL,EC)
R = cell(5,5);
R{5,1} = 'Monitor Risks - Concern Level=Green';

R{5,2} = 'Manage and Monitor Risks - Concern Level=Yellow';
R{4,2} = R{5,2};


R{4,1} = 'Risks May Be Worth Accepting. Monitor Risks - Concern Level=Green';
R{2,3} = R{4,1};
R{1,3} = R{4,1};

R{1,4} = 'Risks May not Be Worth Accepting. Monitor Risks - Concern Level=Green';

R{1,1} = 'Accept Risks. No Action Required - Concern Level=Green';
R{1,2} = R{1,1};
R{2,1} = R{1,1};
R{2,2} = R{1,1};
R{3,1} = R{1,1};

R{3,2} = 'Accept but Monitor Risks - Concern Level=Green';

R{4,3} = 'Management Effort Required - Concern Level=Yellow';
R{3,4} = R{4,3};

R{3,3} = 'Management Effort Worthwhile - Concern Level=Yellow';

R{2,4} = 'Must Manage and Monitor Risks - Concern Level=Yellow';
R{2,5} = R{2,4};

R{1,5} = 'Considerable Management Required - Concern Level=Yellow';

R{5,3} = 'Significant Management Effort Required. Raise Flag to Stakeholders - Concern Level=Red';

R{3,5} = 'Must Manage and Monitor Risks Closely. Raise Flag to Stakeholders - Concern Level=Red';

R{5,4} = 'Extensive Management Essential. Raise Flag to Stakeholders - Concern Level=Red';
R{4,4} = R{5,4};
R{4,5} = R{5,4};
R{5,5} = R{5,4};

str = R{round(EL),round(EC)};


end

   