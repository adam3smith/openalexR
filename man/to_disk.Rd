% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oa_snowball.R
\name{to_disk}
\alias{to_disk}
\title{Flatten snowball result}
\usage{
to_disk(snowball)
}
\arguments{
\item{snowball}{List result from `oa_snowball`.}
}
\value{
Tibble/data.frame of works with additional columns:
append `citing`, `backward_count`, `cited_by`, `forward_count`, `connection`,
and `connection_count.` For each work/row, these counts are WITHIN one
snowball search, and so `forward_count` <= `cited_by_count`.

Consider the universe of all works linked to a set of starting works, (`oa_input = TRUE`)
for each work/row i:
- citing: works in the universe that i cites
- backward_count: number of works in the universe that i cites
- cited_by: works that i is cited by
- forward_count: number of works in the universe that i is cited by
- connection: works in the universe linked to i
- connection_count: number of works in the universe linked to i (degree of i)
}
\description{
|  id|title |...|cited_by_count| referenced_works   |cited_by |...|
| 100|foo   |...|             1| 98, 99             |101      |...|
| 200|bar   |...|             2| 198, 199           |201, 202 |...|
| 300|wug   |...|             2| 296, 297, 298, 299 |301, 302 |...|
}
\examples{
\dontrun{
flat_snow <- to_disk(oa_snowball(
  identifier = "W1516819724",
  verbose = TRUE
))

flat_snow[, c("id", "connection", "connection_count")]
}
}
