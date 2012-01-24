\title{Estimates PET neuroreceptor occupancies}
\name{occ}
\alias{occ}
\alias{occ.ols}
\alias{occ.ref}
\alias{occ.reml}
\alias{plot.occ}
\alias{print.occ}
\alias{print.summary.occ}
\alias{summary.occ}
\keyword{maximum likelihood estimation}
\keyword{neuroreceptor}
\keyword{neuroreceptor occupancy}
\keyword{occupancy}
\keyword{occupancy plot}
\keyword{PET}
\keyword{positron emission tomography}
\keyword{receptor}
\keyword{receptor occupancy}
\keyword{reference region}
\keyword{restricted maximum likelihood estimation}
\description{This package provides a generic function for estimating positron emission tomography (PET) neuroreceptor occupancies from the total volumes of distribution (VT) of a set of regions of interest (ROI). Fittings methods include the simple 'reference region' ("ref") and 'ordinary least squares' ("ols", sometimes known as occupancy plot) methods, as well as the more efficient 'restricted maximum likelihood' estimation ("reml").}
\usage{occ(VT, method = "reml")}
\arguments{
  \item{VT}{matrix of total volumes of distribution (VT). Each row must have the VT values of a ROI. The first column must have the baseline VT values, the second column the first-postdose VT values, the third column the second-postdose VT values, etcetera. See "occ.example" example below.}
  \item{method}{one of either "ref" (reference region), "ols" (ordinary least squares) or "reml" (restricted maximum likelihood estimation). Please read the assumptions of each method below in Details.}
}
\details{
Reference region ("ref") method assumes that: a) neuroreceptor occupancy is different in each ROI; b) non-displaceable volume of distribution (VND) is different in each scan; c) specific volumes of distribution (VS) are the same in all scans; d) VS of the first ROI is null; and e) all measurement errors are negligible. Note that assumptions d) and e) may be unrealistic in many cases.

Ordinary least squares ("ols") method assumes that: a) neuroreceptor occupancy is the same in all ROIs; b) VND is different in each postdose scan; c) baseline VND is equal to all postdose VND; d) VS are different in each postdose scan; e) baseline VS are equal to all postdose VS; f) measurement errors are different in each scan; and g) measurement error of baseline scan is null. Note that assumptions c) and e) may lead to multiple (i.e. mathematically impossible) baseline estimates in studies with more than one postdose scan. Also, note that assumption g) may be unrealistic in many cases.

Restricted likelihood estimation ("reml") method assumes that: a) neuroreceptor occupancy is the same in all ROIs; b) VND is the same in all scans; c) VS are the same in all scans; and d) measurement error is the same in all scans. This method is recommended above other methods because it has shown higher statistical efficiency.
}
\value{
An object of class \code{occ}, basically a list including the following elements:
\item{VT}{the observed total volumes of distribution}
\item{coefficients}{the neuroreceptor occupancy coefficients}
\item{VND}{the non-displaceable volumes of distribution of each scan}
\item{VS}{the specific volumes of distribution}
\item{sigma}{the measurement error in each scan}
\item{fitted.values}{the fitted VT}
\item{residuals}{the residuals, that is, observed VT minus fitted VT}
}
\references{Radua J, Bullich S, Lopez N and Catafau AM. Restricted maximum likelihood estimation of PET neuroreceptor occupancy in the absence of a reference region. Medical Physics 2011;38:2558.

Doi: 10.1118/1.3578606 ( http://dx.doi.org/10.1118/1.3578606 )}
\author{Joaquim Radua}
\examples{
## Total volumes of distribution (VT) from a simulated PET study
## including a baseline scan, as well as two other scans after
## administration of a drug. Note that each row in the matrix
## represents a ROI, whilst each column represents a scan.

data(occ.example)
occ.example

#                  Baseline 1st postdose 2nd postdose
# Cerebellum           0.39         0.28         0.30
# Frontal cortex       0.72         0.35         0.47
# Occipital cortex     0.96         0.43         0.62
# Parietal cortex      0.75         0.34         0.50
# Temporal cortex      0.44         0.26         0.31


## Default REML fitting of these simulated data:

m = occ(occ.example)

print(m)     # Prints the neuroreceptor occupancy coefficients

summary(m)   # Also prints the non-displaceable volume of
             # distribution (VND), the specific volumes of
             # distribution (VS) and the measurement error

fitted(m)    # Prints the fitted values

residuals(m) # Prints the residuals

plot(m)      # Plots the estimated and observed volumes of
             # distribution
}

