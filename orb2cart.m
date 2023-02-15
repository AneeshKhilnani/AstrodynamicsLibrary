function [r,v] = orb2cart(SMA,e,INC,RAAN,AOP,TA,mu)
% orb2cart converts six orbital (keplerian) elements to the
% Geocentric-Equatorial Frame (ECI) 
%
% Required
% --------
% SMA: scalar
%    semi-major axis of orbit [km]
% e: scalar
%    eccentricity of orbit [nd]
% INC: scalar
%    orbit INClination: angle between orbit plane and fundamental plane
%    [rad]
% RAAN: scalar
%    Right ascension of the ascending node [rad]
% AOP: scalar
%    Argument of periapsis [rad]
% TA: scalar
%    True Anomaly [rad]
% mu: scalar
%    Gravitational parameter [km^3/sec^2]
%
% Returns
% --------
% r: [1x3]
%   Position vector in ECI frame [km]
% v: [1x3]
%   Velocity vector in ECI frame [km/sec]
%
% Author: Aneesh Vinod Khilnani
% Email: akhilnan@purdue.edu
% Last updated: 02/15/2023


%Compute position and velocity norms
r_mag=SMA*(1-e^2)/(1+e*cos(TA));
v_mag=sqrt(2*(mu/r_mag-mu/(2*SMA)));

%Compute flight path angle
FPA=acos(sqrt(mu*SMA*(1-e^2))/(r_mag*v_mag));

%Quadrant check for FPA
if (TA>180 && FPA>0)||(TA<180 && FPA<0)
    FPA=-1*FPA;
end    

%Compute DCM
THETA=TA+AOP;
DCM=Euler_Sequence_313(RAAN,THETA,INC);

%Compute r and v in the hill frame first
v_hill=v_mag*[sin(FPA),cos(FPA),0]; %[r-hat, theta-hat, h-hat]
r_hill=[r_mag,0,0]; %[r-hat, theta-hat, h-hat]

%Convert r_hill and v_hill to the ECI
r=(r_hill(1)*DCM(:,1))'; %[x-hat,y-hat,z-hat] 
v=(v_hill(1)*DCM(:,1)+v_hill(2)*DCM(:,2))'; %[x-hat,y-hat,z-hat]
end

