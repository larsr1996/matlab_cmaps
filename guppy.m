function cmap = guppy(m)

if ~exist('m', 'var')
    m = 255; % default step number if m is not provided
else
    if mod(m, 2) == 0
        m = m + 1; % force odd number of steps for symmetry
    end
end

% p = [0, 0.5, 1]; % percentages at which colors occur
% r = [250, 88, 30] / 255; % red values, bottom to top
% g = [144, 8, 203] / 255; % green values, bottom to top
% b = [79, 114, 191] / 255; % blue values, bottom to tops

p = [0, 0.25, 0.5, 0.75, 1]; % percentages at which colors occur
r = [250, 250, 88, 57, 30] / 255; % red values, bottom to top
g = [144, 33, 8, 105, 203] / 255; % green values, bottom to top
b = [79, 23, 114, 233, 191] / 255; % blue values, bottom to top

pq = linspace(0,1,m); % create finer spacing with m steps
method = 'makima'; % interpolation method
% method = 'makima'; % alternative interpolation method

% interpolate RGB arrays
rr = interp1(p, r, pq, method);
gg = interp1(p, g, pq, method);
bb = interp1(p, b, pq, method);

cmap = [rr; gg; bb].';
cmap = cmap / max(max(cmap)); % renormalize due to extrapolation

end