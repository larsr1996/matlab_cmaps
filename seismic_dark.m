function cmap = seismic_dark(m)

if nargin == 0
    m = 255; % default step number if m is not provided
else
    if mod(m, 2) == 0
        m = m + 1; % force odd number of steps for symmetry
    end
end


p = [0, 0.25, 0.5, 0.75 ,1]; % percentages at which colors occur
r = [33, 121, 255, 231, 109] / 255; % red values, bottom to top
g = [73, 180, 255, 133, 2] / 255; % green values, bottom to top
b = [117, 213, 255, 106, 32] / 255; % blue values, bottom to top

pq = linspace(0,1,m); % create finer spacing with m steps
method = 'makima'; % interpolation method

% interpolate RGB arrays
rr = interp1(p, r, pq, method);
gg = interp1(p, g, pq, method);
bb = interp1(p, b, pq, method);

cmap = [rr; gg; bb].';
cmap = cmap / max(max(cmap)); % renormalize due to extrapolation
cmap(cmap < 0) = 0; % set negative values to zero

end