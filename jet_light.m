function cmap = jet_light(m)

if nargin == 0
    m = 255; % default step number if m is not provided
else
    if mod(m, 2) == 0
        m = m + 1; % force odd number of steps for symmetry
    end
end


p = linspace(0, 1, 7); % percentages at which colors occur
r = [255, 224, 185, 132, 102, 231, 250] / 255; % red values, bottom to top
g = [255, 217, 187, 212, 224, 238, 7] / 255;  % green values, bottom to top
b = [255, 229, 218, 190, 100, 42, 8] / 255;  % blue values, bottom to top

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