t = [0:0.01:0.98];  % make a vector from 0 to (including) 0.98, step size of 0.01
y1 = sin(2*pi*4*t);
% plot(t, y1);
y2 = cos(2 * pi * 4 * t);
% plot(t, y2);

plot(t, y1);
hold on;  % Octave can now plot on top of another function
plot(t, y2, 'r')  % red colour
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('my plot');
% cd 'C:\Users\willi\Dropbox\Code\Octave'  % Change directory
print -dpng 'myPlot.png'  % Save as file
% help plot
close;
figure(1); plot(t, y1);
figure(2); plot(t, y2);
close;

subplot(1, 2, 1);  % (X, Y, Z) are XxY grid (1x2), and Z means manipulate element Z
% i.e. the next plot goes into space 1 of the (1x2) grid
plot(t, y1);
subplot(1, 2, 2);  % manipulate the second element
plot(t, y2);
axis([0.5 1 -1 1]);  % sets X-range to 0.5 to 1, Y-range to -1 to 1
close;
% help axis  % for help on axis command

A = magic(5);
imagesc(A);  % heat map of A
imagesc(A), colorbar, colormap gray;  % colorbar next to graph, and changes colorscale

% comma-chaining:
% a=1, b=2, c=3  % sets a, b, c and prints them
% a=1; b=2; c=3  % sets a, b, c, does not print out