function cmap = bone(m)

if nargin == 0
    m = 255; % default step number if m is not provided
else
    if mod(m, 2) == 0
        m = m + 1; % force odd number of steps for symmetry
    end
end


p = [0, 0.25, 0.75, 1]; % percentages at which colors occur
r = [255, 47, 47, 47] / 255; % red values, bottom to top
g = [255, 149, 47, 47] / 255; % green values, bottom to top
b = [255, 185, 116, 47] / 255; % blue values, bottom to top

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