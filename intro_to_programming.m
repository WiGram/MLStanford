A = [1 2; 3 4; 5 6];
% disp(size(A));
size(A, 1);
size(A, 2);

V = [1 2 3 4];
% disp(V);

% disp(who);  % shows variable environment
% disp(whos);  % shows variables and size

% save hello.mat V;  % save variable as .mat-file
% save hello.txt V -ascii;  % save as readable text

A([1 3], :);  % Get everything from 1st and 3rd row
A(:, 2);  % Get everything from second column

A(:, 2) = [10; 11; 12];  % reassign column 2

A = [A, [100; 101; 102]];  % Append a new column to A
disp(A);

%  A(:) put all elements of A into a column vector

B = [11 12; 13 14; 15 16];
C = [A B];  % Concatenates A and B next to each other

disp(C);

A = A(:, 1:2);  % subset A
C = [A; B];  % Concatenate on top of each other

disp(C);

%  [A B] == [A, B]  - i.e. provides same result