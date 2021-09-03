function cmap = seismic(m)

if ~exist('m', 'var')
    m = 255; % default step number if m is not provided
else
    if mod(m, 2) == 0
        m = m + 1; % force odd number of steps for symmetry
    end
end

p = [0, 0.5, 1]; % percentages at which colors occur
r = [0, 1, 1]; % red values, bottom to top
g = [0, 1, 0]; % green values, bottom to top
b = [1, 1, 0]; % blue values, bottom to top

pq = linspace(0,1,m); % create finer spacing with m steps
method = 'pchip'; % interpolation method
% method = 'makima'; % alternative interpolation method

% interpolate RGB arrays
rr = interp1(p, r, pq, method);
gg = interp1(p, g, pq, method);
bb = interp1(p, b, pq, method);

cmap = [rr; gg; bb].';
cmap = cmap / max(max(cmap)); % renormalize due to extrapolation

end