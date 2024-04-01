% Demo script for bwgui app

% Load the sample image stack
load('sample\img.mat', 'img');

% Create an instance of the bwgui app
bwgui(img);

% Perform batch processing using the exported parameters
% bw = bwfun(@(x) getbw(x, bwPara), img);
