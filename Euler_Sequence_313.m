function [BodyTrans]=Euler_Sequence_313(RAAN,THETA,INC)
%% 3-1-3 Euler Sequence
% Euler_Sequence_313 is a direction cosine matrix to transform coordinates
% in the Hill Frame to the Geocentric-Equatorial Frame (ECI equitorial)
%
% Required
% --------
% RAAN: scalar
%    Right ascension of the ascending node [rad]
% THETA: scalar
%    Angle of spacecraft from the ascending node (reference direction) in
%    the orbit plane [rad]
% INC: scalar
%    orbit inclination: angle between orbit plane and fundamental plane
%    [rad]
%
%
% Author: Aneesh Vinod Khilnani
% Email: akhilnan@purdue.edu
% Last updated: 02/15/2023


%Transformation Matrix
BodyTrans=[cos(RAAN)*cos(THETA)-sin(RAAN)*cos(INC)*sin(THETA),-cos(RAAN)*sin(THETA)-sin(RAAN)*cos(INC)*cos(THETA),sin(RAAN)*sin(INC);
           sin(RAAN)*cos(THETA)+cos(RAAN)*cos(INC)*sin(THETA),-sin(RAAN)*sin(THETA)+cos(RAAN)*cos(INC)*cos(THETA),-cos(RAAN)*sin(INC);
           sin(INC)*sin(THETA),sin(INC)*cos(THETA),cos(INC)];
end