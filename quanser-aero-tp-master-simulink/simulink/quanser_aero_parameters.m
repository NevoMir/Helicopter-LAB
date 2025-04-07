%% Quanser Aero Parameters

%% From the Manufacturer
% Moment of Inertia of helicopter body (kg-m^2)
L_body = 6.5*0.0254; % length of horizontal body (metal tube)
m_body = 0.094; % mass of horizontal body (metal tube) 
J_body = m_body * L_body^2 / 12; % horizontal cylinder rotating about CM

% Moment of Inertia of yoke fork that rotates about yaw axis (kg-m^2)
m_yoke = 0.526; % mass of entire yoke assembly (kg)
% h_yoke = 9*0.0254; % height of yoke assembly (m)
r_fork = 0.04/2; % radius of each fork (approximated as cylinder)
J_yoke = 0.5*m_yoke*r_fork^2;

% Moment of Inertia from motor + guard assembly about pivot (kg-m^2)
m_prop = 0.43; % mass of dc motor + shield + propeller shield
% m_motor = 0.203; % mass of dc motor
r_prop = 6.25*0.0254; % distance from CM to center of pitch axis
J_prop = m_prop * r_prop^2; % using parallel axis theorem

% Equivalent Moment of Inertia about Pitch and Yaw Axis (kg-m^2)
Jp = J_body + 2*J_prop; % pitch: body and 2 props
Jy = J_body + 2*J_prop + J_yoke; % yaw: body, 2 props, and yoke

%% AERO 2: Inertia values hardcoded (disregard previous section)
Jp = 2.32e-2;
Jy = 2.38e-2;

%% From Identification
%% Effects from states
% Stiffness (N-m/rad)[found experimentally] 
Ksp = 0.0023; % Pitch axis

% Viscous damping (N-m-s/rad) [found experimentally]
Dp = 0.0022; % pitch axis
Dy = 0.0084; % yaw axis

%% Effects from controls
% Thrust-torque constant (N-m/V) [found experimentally]
Kpp = 0.00092; % thrust acting on pitch from pitch motor 
Kyy = 0.0016; % thrust acting on yaw from yaw motor
Kpy = 0.0075; % thrust acting on pitch from yaw motor
Kyp = -0.00078; % thrust acting on yaw from pitch motor
