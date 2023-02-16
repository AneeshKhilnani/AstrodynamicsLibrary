function [Y] = AttitudeODE(t,Y,J,L)
% AttitudeODE returns quaternion and angular rate information of a
% spacecraft over time
%
% To run, type the following in the Command Window:
% [tt,Y]=ode45(@AttitudeODE,t,Y0',options,J,L);
%
% Required
% --------
% t: scalar
%   time [sec]
% Y: double
%  (7,1) state vector defined as [q1,q2,q3,q3,omega_x,omega_y,omega_z]'.The
%  variables q1,q2,q3,q4 represent the spacecraft's quaternion state. 
%  The variables omega_x,omega_y,omega_z represent the angular rate of the
%  spacecraft. [nd,nd,nd,nd,rad/s,rad/s,rad/s]
% J: double
%   (3,3) Inertia tensor [kg-m^2]
% L: double
%   (3,1) Torque acting on the body [N-m]
% Returns
% -------
% Ydot: double
%   time derivative state vector Y 
%   [rad/sec,rad/sec,rad/sec,rad/sec,rad/sec^2,rad/sec^2,rad/sec^2]
% 
%
% Author: Aneesh Vinod Khilnani
% Email: akhilnan@purdue.edu
% Last updated: 02/15/2023

% Initialize quaternion and angulat rate
q=Y(1:4);
omega=Y(5:7);

% Obtain qdot and omega_dot
Iq=[q(4) -q(3) q(2);q(3) q(4) -q(1); -q(2) q(1) q(4); -q(1) -q(2) -q(3)];

qdot=0.5*Iq*omega;
omega_dot=J\(L-cross(omega,J*omega));

% Output state vector
Y=[qdot;omega_dot];
end

