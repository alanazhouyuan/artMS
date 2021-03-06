% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{artmsQuantification}
\alias{artmsQuantification}
\title{Relative quantification using MSstats}
\usage{
artmsQuantification(yaml_config_file, verbose = TRUE)
}
\arguments{
\item{yaml_config_file}{(char) The yaml file name and location}

\item{verbose}{(logical) \code{TRUE} (default) shows function messages}
}
\value{
The relative quantification of the conditions and comparisons
specified in the keys/contrast file resulting from running MSstats, in
addition to quality control plots (if selected)
}
\description{
Relative quantification using MSstats including:
\itemize{
\item plots
\item quantifications (log2fc, pvalues, etc)
\item normalized abundance values
}
}
\examples{
\donttest{
artmsQuantification("artms-ab-config.yaml")
}
}
\keyword{driver,}
\keyword{function}
\keyword{main,}
