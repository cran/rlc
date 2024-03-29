# rlc 0.5.0

* The package is now base on the current D3 version (v7.8.5) rather then the outdated one (v4.10.0)

* listen function (a wrapper around `httpuv::service` or `later::run_now`) added to for more convenient use of RLC apps in Jupyter Notebooks.

* Bug with saving plots as png in Firefox fixed.

* Marking behaviour in heatmap changed: consecutive selection of cells now only adds to the list of marked cells.

* Some minor bug fixes.

# rlc 0.4.1

* `lc_input` now has `fontSize`, `nrows` and `ncols` properties, bugs with assigning labels to wrong check boxes/radio buttons fixed.

* `lc_heatmap` now has `valueTextColour` property, also the way how text values are shown (`textValue = TRUE`) is changed.

* in heatmaps, marked cells are now highlighted differently to make them more visible.

* `elements` argument in the `mark` function is now optional.

* RGBA colours are now accepted (for example, in `palette` argument), however the value of alpha is ignored.

* `onlyServer` argument added to the `openPage` function to prevent opening a browser tab.

* A bug that caused restarting a local server multiple times fixed.

* minor styling changes.

# rlc 0.4.0

* A set of properties to control charts' legends added: `legend_width`, `legend_height`, `lgend_sampleHeight`, `legend_ncol`, `legend_container`.

* Property `informText` added. It allows to specify the content of the tooltip text for each element.

* data.frames and lists provided to the `with` argument are no longer re-evaluated automatically. By default, they are considered static. To treat them as dynamic arguments, they should be put inside the `dat` function.

* Some styling changes.

### Bug fixes

* `on_clickPosition` no longer adds extra 1 to the reported values

* `lc_input` values no longer get stuck

* In the table layout, unnecessary D3 data are no longer propagated to the children elements.

* `on_click` for histograms now gets a proper index value.

* NAs values for `lc_input` don't cause problems any more.

* Issue with colour scale get stuck in the legend fixed.


# rlc 0.3.0

* New function `lc_image` added. It can add to the web page a graphic R object or a locally stored image.

* All charts now have a `with` argument, that allows to specify a `data.frame` which columns can be used as variables.

* Charts with axes now have `on_clickPosition` argument. It is a callback function, that receives a position of any click
relative to current axes scales.

* function `mark` now has `clear` argument which, if `TRUE` unmarks all previously marked elements.

* `pacerStep` argument now is also added to lines.

* Legends no longer have default titles.

* Now callback functions can access variables `.chartId` and `.layerId`

* Some changes in stylesheet.

* mouseout event also uses pacer that prevents overqueuing

* Various bugs fixed.


# rlc 0.2.1

* New argument `with` in all the plotting functions. This argument allows to provide a data
table, that will be used to evaluate properties.

* Most legend titles are omitted if not defined.

* Bug with mispositioning a click in newest versions of Firefox fixed... again.

# rlc 0.2.0

* It is possible now to create server apps that can be accessed by multiple users simultaneously. To this end, one should use arguments 
`sessionVars`, `beforeLoad` and `afterLoad` of the `openPage` functions. `sessionVars` defines local variables with their default values
for each client, `beforeLoad` and `afterLoad` are callback functions that are called once for each new web page. Other than that, there are
no differences between creating an `rlc` app locally or on a server.

* `rlc` has been restructured so that the entire app is now stored inside a single `R6` object of class `LCApp` (see man pages for more details).

* Property `axesTitlePos` added for all the charts that have axes. This property allows to place axis labels above or below the x-axis 
(to the left or to the right from the y-axis) and at the end, in the middle or next to the start of the axis.

* Now scatter plots in canvas mode also have ticks that indicate presence of points outside of the current axes range.

* NAs are correctly processed.

* Bug with mispositioning a click in Firefox v.70 fixed.

