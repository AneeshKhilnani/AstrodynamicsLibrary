function [XDOT] = TwoBodyProb(t,X,mu)
% TwoBodyProb returns position, velocity, and acceleration data of a body
% with respect of another body in an inertial frame.
%
% To run, type the following in the Command Window:
% [tt,X]==ode45(@TwoBodyProb,t,X',options,mu);
%
% Required
% --------
% t: scalar
%   time [sec]
% X: double
%  (6,1) state vector defined as [x,y,z,xd,yd,zd]'. The variables x,y,z
%  represent the inertial coordinates of the relative position of the
%  satellite. The variables xd,yd,zd represent the time
%  derivatives of x,y,z with respect to the inertial frame. 
%  [km,km,km,km/sec,km/sec,km/sec]
% mu: scalar
%   Gravitational Parameter [km^3/sec^2]
%
% Returns
% -------
% Xdot: double
%   time derivative state vector X wrt the inertial frame
%   [km/sec,km/sec,km/sec,km/sec^2,km/sec^2,km/sec^2]
% 
%
% Author: Aneesh Vinod Khilnani
% Email: akhilnan@purdue.edu
% Last updated: 02/14/2023

pos=X(1:3);
vel=X(4:6);
acc=-mu/norm(pos)^3*pos;

XDOT=[vel;acc];
end

