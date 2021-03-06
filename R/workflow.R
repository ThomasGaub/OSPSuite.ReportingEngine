#' @title Workflow
#' @description R6 class representing Reporting Engine generic Workflow
#' @field reportingEngineInfo R6 class object with relevant information about reporting engine
#' @field simulationSets list of `MeanModelSet` R6 class objects
#' @field observedData list of observed `data` and `metaData`
#' @field reportFolder path where report and logs are saved
#' @field resultsFolder path where results are saved
#' @field figuresFolder path where figure are saved
#' @import tlf
#' @import ospsuite
Workflow <- R6::R6Class(
  "Workflow",
  public = list(
    reportingEngineInfo = ReportingEngineInfo$new(),
    simulationStructures = NULL,
    workflowFolder = NULL,
    observedData = NULL,
    reportFolder = NULL,
    resultsFolder = NULL,
    figuresFolder = NULL,

    #' @description
    #' Create a new `Workflow` object.
    #' @param simulationSets names of pkml files to be used for simulations
    #' @param observedDataFile name of csv file to be used for observations
    #' @param observedMetaDataFile name of csv file to be used as dictionary for observed data
    #' @param reportFolder name of folder where reports and logs are saved
    #' @param resultsFolder name of folder where results are saved
    #' @param figuresFolder name of folder where figures are saved
    #' @return A new `Workflow` object
    initialize = function(simulationSets,
                          workflowFolder = file.path(getwd(), defaultFileNames$workflowFolder()),
                          reportFolderName = defaultFileNames$reportFolder(),
                          resultsFolderName = defaultFileNames$resultsFolder(),
                          figuresFolderName = defaultFileNames$figuresFolder()) {
      logInfo(message = self$reportingEngineInfo$print())

      workflowFolderCheck <- checkExisitingPath(workflowFolder, stopIfPathExists = TRUE)
      if (!is.null(workflowFolderCheck)) {
        logDebug(message = workflowFolderCheck)
      }
      self$workflowFolder <- workflowFolder

      reportFolder <- file.path(workflowFolder, reportFolderName)
      reportFolderCheck <- checkExisitingPath(reportFolder, stopIfPathExists = TRUE)
      if (!is.null(reportFolderCheck)) {
        logDebug(message = reportFolderCheck)
      }
      self$reportFolder <- reportFolder

      resultsFolder <- file.path(workflowFolder, resultsFolderName)
      resultsFolderCheck <- checkExisitingPath(resultsFolder, stopIfPathExists = TRUE)
      if (!is.null(resultsFolderCheck)) {
        logDebug(message = resultsFolderCheck)
      }
      self$resultsFolder <- resultsFolder

      figuresFolder <- file.path(workflowFolder, figuresFolderName)
      figuresFolderCheck <- checkExisitingPath(figuresFolder, stopIfPathExists = TRUE)
      if (!is.null(figuresFolderCheck)) {
        logDebug(message = figuresFolderCheck)
      }
      self$figuresFolder <- figuresFolder

      # Create workflow output structure
      createFolder(self$workflowFolder)
      createFolder(self$reportFolder)
      createFolder(self$resultsFolder)
      createFolder(self$figuresFolder)

      self$simulationStructures <- list()
      # Check of Workflow inputs
      for (i in 1:length(simulationSets)) {
        self$simulationStructures[[i]] <- SimulationStructure$new(
          simulationSet = simulationSets[[i]],
          workflowResultsFolder = self$resultsFolder
        )
      }
    }
  )
)
