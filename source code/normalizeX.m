function X = normalizeX(X)
% Row normalize X.

%no = sqrt(sum(X.^2,2));
no = sum(X,2); % Kipf's way of normalization
no(no == 0) = 1;
[r,h]=size(X);
TempA=ones(1,h);
no=no*TempA;
%---------
X = X ./ no;
