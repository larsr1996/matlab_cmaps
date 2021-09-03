# matlab_cmaps
This is a small collection of some colormaps that I created myself for scientific plots in Matlab.

Simply put the files in your working directory and change the colormap as usual, e.g. `colormap(gca, seismic)`.
By default, all colormaps have 255 different color values. If you want, you can also specify the amount of values, e.g. `colormap(gca, seismic(8))`.
In the case of an even amount of levels specified, the scripts will add one additional level such that the colormap is symmetric.

The scripts are mostly based on [this question/answer from Stack Overflow](https://stackoverflow.com/questions/30851050/how-to-create-an-interpolated-colormap-or-color-palette-from-two-colors).

![alt text](https://github.com/larsr1996/matlab_cmaps/blob/main/overview_cmaps.png "overview_cmaps.png")

