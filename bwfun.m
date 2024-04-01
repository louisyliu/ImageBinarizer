function imgBw = bwfun(func, imgOriginal)
%BWFUN convert each image in an image sequence into binzarized image.
%   IMGBW = BWFUN(IMGORIGINAL, FUNC) applies the function FUNC to each image in
%   the 3D image sequence IMGORIGINAL, one image at a time. The output from FUNC
%   is concatenated into the output array IMGBW, such that for the i-th image of
%   IMGORIGINAL, IMGBW(:,:,i) = FUNC(IMGORIGINAL(:,:,i)). 
% 
%   Inputs:
%       - FUNC: Function handle to a function that takes one input image
%               and returns a processed image. The function should have the
%               signature:
%                   IMGOUT = FUNC(IMGIN)
%               where IMGIN is a single input image and IMGOUT is the
%               corresponding processed image.
%       - IMGORIGINAL: 3D array representing an image sequence, where each
%                      slice along the third dimension corresponds to a
%                      single image.
%
%   Output:
%       - IMGBW: 3D array of the same size as IMGORIGINAL, containing the
%                processed images. The output from FUNC is concatenated
%                along the third dimension of IMGBW.
%
%   Note:
%       - The output from FUNC can have any data type, as long as objects of
%         that type can be concatenated.
%       - The function displays a progress bar using the dispbar function to
%         indicate the progress of processing the image sequence.
%
%   Example:
%       % Define a sample function that binarizes an image
%       func = @(img) imbinarize(img);
%       
%       % Create a sample image sequence
%       imgOriginal = repmat(rand(100, 100), [1, 1, 10]);
%       
%       % Apply the binarization function to the image sequence
%       imgBw = bwfun(func, imgOriginal);      

imgBw = false(size(imgOriginal));
nImg = size(imgOriginal, 3);

for i = 1:nImg
    imgBw(:,:,i) = feval(func,imgOriginal(:,:,i));
    dispbar(i, nImg);
end
end
