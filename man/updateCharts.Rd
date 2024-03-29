% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lc.R
\name{updateCharts}
\alias{updateCharts}
\title{Update a chart}
\usage{
updateCharts(chartId = NULL, layerId = NULL, updateOnly = NULL)
}
\arguments{
\item{chartId}{ID of the chart to be updated (or vector of IDs). If \code{NULL}, all the
existing charts will be updated.}

\item{layerId}{ID of the layer to be updated (or vector of IDs). If \code{NULL}, all the
layers of the selected charts will be updated. To update only some layers of
multiple charts the lengths of \code{chartId} and \code{layerId} must be the same.}

\item{updateOnly}{To improve performance it may be useful to change only certain
aspects of a chart (e.g. positions of points, colour of heatmap cells,
etc.). This argument can specify which part of chart to update. Possible options are
\code{Elements}, \code{ElementPosition}, \code{ElementStyle}, \code{Axes}, \code{Labels},
\code{Cells}, \code{Texts}, \code{LabelPosition}, \code{CellPosition},
\code{TextPosition}, \code{LabelText}, \code{CellColour}, \code{TextValues},
\code{Canvas}, \code{Size}. See details for more information.}
}
\description{
\code{updateCharts} redraws a chart or a single layer of a chart to make it up
to date with the current state of the environment variables.
}
\details{
Linked charts of the \emph{rlc} package are based on the idea that the variables that are
used to define a chart are not constant, but can change as a result of user's
actions. Each time the \code{updateCharts} function is called, all the properties that were set inside
the \code{\link{dat}} function are re-evaluated and the chart is redrawn in accordance with the
new state.

If this function is called from the R session, changes will be applied
to all currently opened pages. If it is used as a part of any \code{rlc} callback, only the page
that triggered the call will be affected.

This function is a wrapper around method \code{updateCharts} of class \code{\link{LCApp}}.
}
\section{Update types}{

To improve performance you can update only a certain part of a chart (e.g. colours,
size, etc.). This can be done by setting the \code{updateOnly} argument. Here are all
possible values for this argument.

These are valid for all the charts:
\itemize{
\item \code{Size} changes the size of the chart (and consequently position
of all its elements).
\item \code{Title} changes the title of the chart.
\item \code{Canvas} If number of elements is too high the
charts switch to the canvas mode and instead of multiple SVG point or cells
a single Canvas image is generated. This type of update redraws the Canvas
image. \emph{It is not recommended to use this option, since it will be used automatically when necessary.}
}

These can be updated only in heatmaps (\code{\link{lc_heatmap}}):
\itemize{
\item \code{Labels} adds new row and column labels and removes those that are no longer
needed. Also updates \code{Cells}.
\item \code{Cells} adds new cells and removes those that are no longer needed.
Also updates \code{Texts} if necessary.
\item \code{Texts} adds or remove text inside cells where needed.
\item \code{LabelPosition} updates coordinates of all existing row and column labels.
Also updates \code{CellPosition}.
\item \code{CellPosition} updates coordinates of all existing cells. Also
updates \code{TextPosition} if necessary.
\item \code{LabelText} updates text of all existing labels.
\item \code{CellColour} updates colour of all existing cells. Also
updates \code{TextValues} if necessary.
\item \code{TextValues} updates text inside cells to make it up to date with current
data values.
}

These aspects are present in all the charts with axes.
\itemize{
\item \code{Axes} updates axes of a chart and changes position
of its elements (points, lines, etc.) accordingly.
\item \code{Elements} updates (add or removes) all the elements of the layer.
\item \code{ElementPosition} updates positions of all the elements in the layer.
\item \code{ElementStyle} updates the style (colour, opacity, etc.) of all the elements
of the layer.
}
}

\examples{
\dontrun{data(iris)

#store some properties in global variables
width <- 300
height <- 300
colour <- iris$Sepal.Width
#create a chart
lc_scatter(dat(x = iris$Sepal.Length, y = iris$Petal.Length, colourValue = colour,
               width = width, height = height), chartId = "iris")

#change the variables
height <- 400
colour <- iris$Petal.Width

#this will change colour of points and chart height
updateCharts("iris")
#this will change only height
updateCharts("iris", updateOnly = "Size")

#add another property
setProperties(dat(symbolValue = iris$Species), "iris")
#this will change only colour and symbols
updateCharts("iris", updateOnly = "ElementStyle")}

}
