function [EA] = KeplersEquationSoln(MA,e,EA0)
% KeplersEquationSoln solves Kepler's equation numerically via Newton
% procedure.
%
% NOTE: Kepler's equation 
%       MA=EA-e*sin(EA)
% Required
% --------
% MA: scalar
%    Mean Anomaly [rad]
% e: scalar
%    Orbit eccentricity [nd]
% EA0: scalar
%    Initial guess for the Eccentric Anomaly [rad]
%
% Returns
% --------
% EA: [3x3]
%   Approximate Eccentric Anomaly [rad]
%
%
% Author: Aneesh Vinod Khilnani
% Email: akhilnan@purdue.edu
% Last updated: 02/15/2023

%Initialize the Eccentric Anomaly, difference, and epsilon varaiables
EA=EA0; 
diff=1;
epsilon=0.01;

%Iterative procedure to approximate EA.  Once the difference of the new and
%previous approximation are less than a epsilon, the loop breaks.
while abs(diff)>=epsilon
    EAnew=EA-(EA-e.*sin(EA)-MA)./(1-e.*cos(EA));
    diff=abs(EAnew-EA);
    EA=EAnew;
end

end

