A = [1 2; 3 4; 5 6];
B = [11 12; 13 14; 15 16];
C = [1 1; 2 2];

disp(sprintf('A*C: '));
disp(A*C);  % Matrix multiplication as known from linear algebra

disp(sprintf('A .* B: '));
disp(A .* B);  % Elementwise multiplication

% A .^ 2  elementwise squares

v = [1; 2; 3];
disp(sprintf('1 ./ v: '));  % elementwise inverse
disp(1 ./ v);

disp(sprintf('1 ./ A: '));
disp(1 ./ A);

%  log(v), exp(v), abs(v) are other regular expressions

disp(sprintf('increment v by 1: '));
disp(v + ones(length(v), 1));  % or
disp(v + 1);

disp(sprintf("Transpose of A: (type A')"));
disp(A');  % (A')'  returns A

a = [1 15 2 0.5];
val = max(a);

disp(sprintf('max(a): '));
disp(a);

[val, ind] = max(a);

disp(sprintf('max(a) is (value, index): '));
disp([val, ind]);  % the variable 'val' resp. 'ind' can be called separately

disp(sprintf('max of each column of A (max(A)): '));
disp(max(A));

disp(sprintf('Show indices of a where a < 3: '));
disp(find(a < 3));  % a < 3 returns: 1 0 1 1 -- index 1, 3, 4

disp(sprintf('And the element values are: '));
disp(a(a < 3));

A = magic(3);  % help magic for info  -- each row, column and diagonal add to same
disp(A);

[r, c] = find(A >= 7);

disp(sprintf('Row index (r) and column index(c) of elements in A >= 7: '));
disp(sprintf('Row index: '));
disp(r);
disp(sprintf('Col index: '));
disp(c);

disp(sprintf('product of a: '));
disp(prod(a));

disp(sprintf('a rounded up to nearest integer: '));
disp(ceil(a));  % rounds up, use floor() to round down

disp(sprintf('Some random 3x3 matrix: '));
disp(rand(3));

disp(sprintf('Max matrix of two random matrices: '));
disp(max(rand(3), rand(3)));

disp(sprintf('Compare matrix A with empty matrix [], return max of each column (index 1): '));
disp(A);
disp(sprintf('Max of each column of A: '));
disp(max(A, [], 1));  % 1 indicates dimension "column"
disp(sprintf('Max of each row of A: '));
disp(max(A, [], 2));
% default is column wise max -- max(A) does columns

% max(max(A)) shows max element -- max(A(:)) does the same - A(:) turns matrix into column vector
A = magic(9);  % 9x9 matrix 
disp(sprintf('Show matrix A: '));
disp(A);
disp(sprintf('Show column sums of A: '));
disp(sum(A, 1));
disp(sprintf('Show row sums of A: '));
disp(sum(A, 2));

disp(sprintf('Use eye(9) to make a 9x9 identity matrix: '));
I = eye(9);

B = A .* I;  % keep only diagonal elements - check if the diagonal is also 369
disp(sprintf('Check if diagonal of A is same as row and column sums: '));
disp(sum(sum(B)));

disp(sprintf('Check if reverse diagonal is the same as the forward diagonal: '));
disp(sum(sum(A .* flipud(eye(9)))));  % flip[up][down] -- i.e. flipud

% On inverse and transpose
A = magic(3);
disp(sprintf('New A is: '));
disp(A);
disp(sprintf('A inverse is: '));
disp(pinv(A));
temp = pinv(A);
disp(sprintf('Get the identity matrix: I_3 = A * A^-1 : '));
disp(round(abs(temp * A)));