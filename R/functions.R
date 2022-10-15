
#' Use S3 class as container for model objects (ModelList)
#'

#' `CreateModelList()` takes multiple models as input and creates an S3
#' ModelList class as a container of models that can be used for predicting and summarizing.

#' @param
#' ... all generated models that you want to add to the class, separated by a comma
#'
#' @returns
#' an S3 class ModelList that contains each model input as a parameter
#'
#' @export CreateModelList
#'
#'
#' @importFrom utils capture.output
#' @importFrom purrr map
#'

# generator function to create an S3 ModelList class that is a container of models

CreateModelList <- function(...){

  x <- list(...)
  class(x) <- "ModelList"
  return(x)

}



