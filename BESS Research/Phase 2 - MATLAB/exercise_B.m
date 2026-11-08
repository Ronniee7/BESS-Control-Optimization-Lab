% EXERCISE B: RC CHARGING CIRCUIT

clc;
clear;
close all;

% 1. Define circuit parameters
R = 2000;
C = 0.002;
Vin = 24;

% 2. Initial capacitor voltage
Vc0 = 0;

% 3. Calculate time constant
tau = R * C;

fprintf('Time constant = %.2f seconds\n', tau);

% 4. Define differential equation
ode_function = @(t,Vc) (Vin - Vc)/(R*C);

% 5. Define simulation time
tspan = [0 20];

% 6. Solve using ode45
[t, Vc_numerical] = ode45(ode_function, tspan, Vc0);

% 7. Analytical solution
Vc_analytical = Vin * (1 - exp(-t/tau));

% 8. Plot numerical solution
figure;

plot(t, Vc_numerical, 'b-', 'LineWidth', 2);
hold on;

% Plot analytical solution
plot(t, Vc_analytical, 'r--', 'LineWidth', 2);

% Mark one time constant
xline(tau, 'k:', 'One Time Constant');

xlabel('Time (seconds)');
ylabel('Capacitor Voltage (V)');

title('RC Circuit Charging Response');

legend('Numerical (ode45)', ...
    'Analytical', ...
    'Time Constant');

grid on;

% 9. Calculate voltage after one time constant
Vc_at_tau = Vin * (1 - exp(-1));

fprintf('Voltage after one time constant = %.4f V\n', ...
    Vc_at_tau);

% 10. Compare numerical and analytical results
Vc_numerical_tau = interp1(t, Vc_numerical, tau);

fprintf('Numerical voltage at tau = %.4f V\n', ...
    Vc_numerical_tau);

fprintf('Analytical voltage at tau = %.4f V\n', ...
    Vc_at_tau);