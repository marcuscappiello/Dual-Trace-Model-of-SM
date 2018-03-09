% 2VM model for sensory memory. Each memory trace (SD fine and SD coarse) is equally weighted
function model = DoubleVM_noPm()

    model.name = '2VM';
    model.paramNames = {'sd1','sd2'};
	model.lowerbound = [0 0];
% 	model.upperbound = [360 360]; %Original (no limit)
	model.upperbound = [150 150]; %Set by looking at LL as sd increased comparing uniform and 1VM
%   model.upperbound = [113 113]; %Set by looking at BIC thresholded at 2.2

    model.pdf = @(data, sd1, sd2) (0.5*vonmisespdf(data.errors(:),0,deg2k(sd1)) + 0.5*vonmisespdf(data.errors(:),0,deg2k(sd2)));
	model.start = [10 20;  % sd1, sd2
                 15 25;
                 20 30];
    model.movestd = [0.1, 0.1];

end


