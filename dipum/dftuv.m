function [U, V] = dftuv(M, N)
%DFTUV Compute meshgrid frequency matrices.  
%   [U,V] = DFTUV(M,N) computes meshgrid frequency matrices U and
%   V.  U and V are useful for computing frequency-domain filter
%   functions that can be used with DFTFILT.  U and V are both
%   M-by-N and of class single.

% Set up range of variables.
u = single(0:(M-1));
v = single(0:(N-1));

% Compute the indices for use in meshgrid.
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;

% Compute the meshgrid arrays.
[V, U] = meshgrid(v, u);