% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities-sensitivity-analysis.R
\name{analyzeCoreSensitivity}
\alias{analyzeCoreSensitivity}
\title{analyzeCoreSensitivity}
\usage{
analyzeCoreSensitivity(
  simulation,
  parametersToPerturb = NULL,
  variationRange = 0.1,
  resultsFilePath = paste0(getwd(), "sensitivityAnalysisResults.csv"),
  numberOfCoresToUse = NULL
)
}
\arguments{
\item{simulation}{simulation class object}

\item{parametersToPerturb}{paths of parameters to be analyzed}

\item{variationRange}{variation range for sensitivity analysis}

\item{resultsFilePath}{Path to file storing results of sensitivity analysis}

\item{numberOfCoresToUse}{Number of cores to use on local node.  This parameter should be should be set to 1 when parallelizing over many nodes.}
}
\value{
Save sensitivity analysis results as CSV in path given by resultsFilePath.
}
\description{
Run a sensitivity analysis for a single individual, perturbing only the set of parameters parametersToPerturb
}
