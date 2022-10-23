function L = bel(f, p, cl, th)
%bel building entry loss according to ITU-R P.2109-1
%   L = bel_p2109(f, p, cl, th)
%
%   This function computes the building entry loss not exceeded for the
%   probability p as defined in ITU-R P.2109 
%
%     Input parameters:
%     f       -   Frequency (GHz): 0.08 <= f <= 100
%     p       -   probability for which the loss is not exceeded (%): 0 < p < 100
%     cl      -   building class (1 - 'traditional', 2 - 'thermally efficient')
%     th      -   elevation angle at the building facade (degrees above the horizontal)
%
%     Output parameters:
%     L       -   Building entry loss not exceeded for the probability p
%
%     Example:
%     L = bel_p2109(f, p, cl, th)

%     Rev   Date        Author                          Description
%     -------------------------------------------------------------------------------
%     v0    01MAY17     Ivica Stevanovic, OFCOM         Initial version

%% Read the input arguments and check them

% Checking passed parameters to the defined limits

if f < 0.08 || f > 100
   warning('Frequency is outside the valid domain [0.08, 100] GHz'); 
end

if th < -90 || th > 90
    warning('Elevation angle is outside the valid domain [-90, 90] degrees'); 
end    


if p <= 0 || p >= 100
    warning('Percentage of locations is outside the valid domain (0, 100) %%'); 
end    

switch cl
    case 1
        % traditional building
        r = 12.64;
        s = 3.72;
        t = 0.96;
        u = 9.6;
        v = 2.0;
        w = 9.1;
        x = -3.0;
        y = 4.5;
        z = -2.0;
        
    case 2
        % thermally efficient building
        r = 28.19;
        s = -3.00;
        t = 8.48;
        u = 13.5;
        v = 3.8;
        w = 27.8;
        x = -2.9;
        y = 9.4;
        z = -2.1;
        
    otherwise
        error('Wrong building class type.');
end

Le = 0.212 * abs(th);  % (10)
Lh = r+s*log10(f)+t*(log10(f)).^2;  %(9)

sigma2 = y + z*log10(f);  %(8)
sigma1 = u + v*log10(f);  %(7)

mu2 = w + x*log10(f);  %(6)
mu1 = Lh + Le;  %(5)
C = -3;  % (4)

B = norminv(p/100, mu2, sigma2);
A = norminv(p/100, mu1, sigma1);

L = 10*log10( 10^(0.1*A) + 10^(0.1*B) + 10^(0.1*C));

return
end
    


