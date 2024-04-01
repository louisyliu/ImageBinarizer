function img = getbw(img, bwPara)
%GETBW Binarizes image stack.
%   BW = GETBW(IMG, BWPARA) applies a series of image processing steps to
%   binarize the input image stack IMG. The function first applies a 
%   bandpass filter using the same algorithm as the bandpass filter in ImageJ.
%   The filtered image is then further processed by a Gaussian filter and
%   finally thresholded using adaptive binarization.
%
%   Inputs:
%   - IMG: Input image stack or image to be binarized.
%   - BWPARA: Struct containing binarization parameters.
%       - invert: Logical flag indicating whether to invert the input image.
%       - isbp: Logical flag indicating whether to apply bandpass filter.
%       - bpmin: Minimum wavelength for bandpass filter (if isbp is true).
%       - bpmax: Maximum wavelength for bandpass filter (if isbp is true).
%       - gaussSigma: Standard deviation of the Gaussian filter. Set to 0 to
%                     skip Gaussian filtering.
%       - binarize: Logical flag indicating whether to perform binarization.
%       - sensitivity: Sensitivity parameter for adaptive binarization.
%       - areaopenSize: Minimum area size for removing small objects after
%                       binarization.
%
%   Output:
%   - BW: Binarized image or movie.

if bwPara.invert
    img = imcomplement(img);
end

if bwPara.isbp
    [img, ~] = bandpassfilt(img, bwPara.bpmin, bwPara.bpmax);
end
if bwPara.gaussSigma ~= 0
    img = imgaussfilt(img, bwPara.gaussSigma);
end
if bwPara.binarize
    img = imbinarize(img, 'adaptive', 'ForegroundPolarity','bright', 'Sensitivity',bwPara.sensitivity);
    img = bwareaopen(img, bwPara.areaopenSize);
end

end