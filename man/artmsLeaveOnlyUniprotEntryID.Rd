% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotations.R
\name{artmsLeaveOnlyUniprotEntryID}
\alias{artmsLeaveOnlyUniprotEntryID}
\title{Leave only the Entry ID from a typical full Uniprot IDs in a
given column}
\usage{
artmsLeaveOnlyUniprotEntryID(x, columnid)
}
\arguments{
\item{x}{(data.frame) that contains the \code{columnid}}

\item{columnid}{(char) Column name with the full uniprot ids}
}
\value{
(data.frame) with only Entry IDs.
}
\description{
Downloading a Reference Uniprot fasta database includes several
Uniprot IDs for every protein. If the regular expression available in
Maxquant is not activated, the full id will be used in the Proteins,
Lead Protein, and Leading Razor Protein columns. This script leaves only the
Entry ID.

For example, values in a Protein column like this:

\code{sp|P12345|Entry_name;sp|P54321|Entry_name2}

will be replace by

`P12345;P54321``
}
\examples{
# Example of data frame with full uniprot ids and sequences
p <- c("sp|A6NIE6|RN3P2_HUMAN;sp|Q9NYV6|RRN3_HUMAN", 
       "sp|A7E2V4|ZSWM8_HUMAN", 
       "sp|A5A6H4|ROA1_PANTR;sp|P09651|ROA1_HUMAN;sp|Q32P51|RA1L2_HUMAN", 
       "sp|A0FGR8|ESYT2_HUMAN")
s <- c("ALENDFFNSPPRK", "GWGSPGRPK", "SSGPYGGGGQYFAK", "VLVALASEELAK")
evidence <- data.frame(Proteins = p, Sequences = s, stringsAsFactors = FALSE)

# Replace the Proteins column with only Entry ids
evidence <- artmsLeaveOnlyUniprotEntryID(x = evidence, columnid = "Proteins")
}
\keyword{annotation,}
\keyword{ids}
