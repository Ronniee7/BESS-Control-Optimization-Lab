% EXERCISE A: EXPONENTIAL DECAY

clc;
clear;
close all;

% 1. Define initial conditions
y0 = 20;
tspan = [0 10];

% 2. Define the differential equation
ode_function = @(t,y) -0.5*y;

% 3. Solve numerically using ode45
[t, y_numerical] = ode45(ode_function, tspan, y0);

% 4. Calculate analytical solution
y_analytical = 20 * exp(-0.5*t);

% 5. Plot both solutions
figure;

plot(t, y_numerical, 'b-', 'LineWidth', 2);
hold on;

plot(t, y_analytical, 'r--', 'LineWidth', 2);

xlabel('Time (seconds)');
ylabel('Quantity y');

title('Exponential Decay');

legend('Numerical Solution (ode45)', ...
    'Analytical Solution');

grid on;

% 6. Display final values
fprintf('Numerical final value: %.6f\n', y_numerical(end));
fprintf('Analytical final value: %.6f\n', y_analytical(end));