for i=1:10,
  v(i) = 2^i;
endfor;
disp(v);

indices = 1:10;
disp(indices);

i = 1;
while i <= 5,
  v(i) = 100;
  i = i + 1;
endwhile;
disp(v);

i = 1
while true,
  v(i) = 999;
  i = i+1;
  if i == 6,
    break;
  endif;
endwhile;
disp(v);

v(1) = 2;
if v(1) == 1,
  disp('The value is one');
elseif v(1) == 2,
  disp('The value is two');
else
  disp('The value is neither one nor two');
endif;

% pwd -> C:\Users\willi\Dropbox\Code\Octave
disp(squareThisNumber(5));  % function exists in current directory

% Octave search path (advanced/optional feature)
% addpath('C:\Users\willi\Dropbox\Code\...')

function [y1, y2] = squareAndCube(x);
  y1 = x^2;
  y2 = x^3;
endfunction;

[y1, y2] = squareAndCube(3);
disp([y1, y2]);


% Cost funtion
X = [1 1; 1 2; 1 3];
y = [1; 2; 3];
theta = [0; 1];

j = costFunctionJ(X, y, theta);
disp(j);  % j = 0 -> we are saying there is no intercept, and then a linear rise

plot(X(:,2), y);

theta = [0; 0];
j = costFunctionJ(X, y, theta);
disp(j);

