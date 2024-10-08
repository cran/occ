\title{Total volumes of distribution (VT) from a simulated PET study}
\name{occ.example}
\alias{occ.example}
\keyword{occ.example}
\description{The data represent the total volumes of distribution (VT) from a simulated PET study, including a baseline scan and two other scans after administering a drug.}
\usage{occ.example}
\format{A matrix of total volumes of distribution (VT) with five rows (ROIs) and three columns (scans).}
\examples{
data(occ.example)
occ.example

#                  Baseline 1st postdose 2nd postdose
# Cerebellum           0.39         0.28         0.30
# Frontal cortex       0.72         0.35         0.47
# Occipital cortex     0.96         0.43         0.62
# Parietal cortex      0.75         0.34         0.50
# Temporal cortex      0.44         0.26         0.31


## Find the neuroreceptor occupancy in each scan:

summary(occ(occ.example))


## Plot the estimated and observed volumes of distribution:

plot(occ(occ.example))
}

