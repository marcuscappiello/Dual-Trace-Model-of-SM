% 2VM model for sensory memory. Each memory trace (SD fine and SD coarse)
% has a weight.
% Althought the start parameters help, the parameters may need to be 
% separated into SDf and SDc after fitting.

function model = DoubleVM()

    model.name = '2VMw';
    model.paramNames = {'sd1','sd2','w'};
	model.lowerbound = [0.01 0.01 0];
% 	model.upperbound = [360 360 1]; %Original (no limit)
	model.upperbound = [150 150 1]; %Set by looking at LL as sd increased comparing uniform and 1VM
%   model.upperbound = [113 113 1]; %Set by looking at BIC thresholded at 2.2 comparing uniform and 1VM

    model.pdf = @(data, sd1, sd2, w) (w.*vonmisespdf(data.errors(:),0,deg2k(sd1)) + (1-w).*vonmisespdf(data.errors(:),0,deg2k(sd2)));
	model.start = [20 10 0.3;  % sd1, sd2, p
                 25 15 0.6;
                 30 20 0.9];
    model.movestd = [0.1, 0.1, 0.02];

end

