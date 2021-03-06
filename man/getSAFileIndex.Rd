% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities-sensitivity-analysis.R
\name{getSAFileIndex}
\alias{getSAFileIndex}
\title{getSAFileIndex}
\usage{
getSAFileIndex(
  pkParameterResultsFilePath,
  quantileVec,
  resultsFileFolder,
  resultsFileName,
  popSAResultsIndexFile
)
}
\arguments{
\item{pkParameterResultsFilePath}{path to pk parameter results CSV file}

\item{quantileVec}{quantiles of distributions of pk parameter results for a population.  The individual in the population that yields a pk parameter closest to the quantile is selected for sensitivity analysis.}

\item{resultsFileFolder}{path to population sensitivity analysis results CSV files}

\item{resultsFileName}{root name of population sensitivity analysis results CSV files}

\item{popSAResultsIndexFile}{name of CSV file that will store index that identifies name of sensitivity analysis results file for each sensitivity analysis run}
}
\description{
Function to build and write to CSV a dataframe that stores all sensitivity analysis result files that will be output by a population sensitivity analysis.
}
