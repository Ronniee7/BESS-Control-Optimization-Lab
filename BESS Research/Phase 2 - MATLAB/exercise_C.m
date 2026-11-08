% EXERCISE C: TWO-STATE RLC ELECTRICAL SYSTEM

clc;
clear;
close all;

% 1. Define circuit parameters
Vin = 24;
R = 20;
L = 0.2;
C = 0.002;

% 2. Define initial conditions
% x(1) = Inductor current
% x(2) = Capacitor voltage

x0 = [0; 0];

% 3. Define simulation time
tspan = [0 0.3];

% 4. Define the two differential equations

ode_function = @(t,x) [
    (Vin - R*x(1) - x(2))/L;
    x(1)/C
    ];

% 5. Solve using ode45
[t, x] = ode45(ode_function, tspan, x0);

% 6. Extract the two state variables

inductor_current = x(:,1);
capacitor_voltage = x(:,2);

% 7. Plot inductor current

figure;

subplot(2,1,1);

plot(t, inductor_current, 'b-', 'LineWidth', 2);

xlabel('Time (seconds)');
ylabel('Current (A)');

title('Inductor Current Response');

grid on;

% 8. Plot capacitor voltage

subplot(2,1,2);

plot(t, capacitor_voltage, 'r-', 'LineWidth', 2);

xlabel('Time (seconds)');
ylabel('Voltage (V)');

title('Capacitor Voltage Response');

grid on;

% 9. Display final values

fprintf('Final inductor current: %.6f A\n', ...
    inductor_current(end));

fprintf('Final capacitor voltage: %.6f V\n', ...
    capacitor_voltage(end));