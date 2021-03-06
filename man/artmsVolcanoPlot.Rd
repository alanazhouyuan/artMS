% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{artmsVolcanoPlot}
\alias{artmsVolcanoPlot}
\title{Volcano plot (log2fc / pvalues)}
\usage{
artmsVolcanoPlot(mss_results, output_name = "volcano_plot.pdf",
  lfc_upper = 1, lfc_lower = -1, whatPvalue = "adj.pvalue",
  FDR = 0.05, PDF = TRUE, decimal_threshold = 16, verbose = TRUE)
}
\arguments{
\item{mss_results}{(data.frame or file) Selected MSstats results}

\item{output_name}{(char) Name for the output file (don't forget the \code{.pdf}
extension)}

\item{lfc_upper}{(numeric) log2fc upper threshold (positive value)}

\item{lfc_lower}{(numeric) log2fc lower threshold (negative value)}

\item{whatPvalue}{(char) \code{pvalue} or \code{adj.pvalue} (default)}

\item{FDR}{(numeric) False Discovery Rate threshold}

\item{PDF}{(logical) Option to generate pdf format. Default: \code{T}}

\item{decimal_threshold}{(numeric) Decimal threshold for the pvalue.
Default: 16 (10^-16)}

\item{verbose}{(logical) \code{TRUE} (default) shows function messages}
}
\value{
(pdf) of a volcano plot
}
\description{
It generates a scatter-plot used to quickly identify changes
}
\examples{
artmsVolcanoPlot(mss_results = artms_data_ph_msstats_results,
                  whatPvalue = "pvalue",
                  PDF = FALSE)
}
\keyword{plot,}
\keyword{volcano}
