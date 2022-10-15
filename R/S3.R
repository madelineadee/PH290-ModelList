#' @export

# summary method for ModelList

summary.ModelList <- function(ml, ...){

  invisible(capture.output(temp <- purrr::map(ml, function(x) summary(x))))
  print(temp)
  invisible(temp)

}

#' @export
#'
# predict method for ModelList

predict.ModelList <- function(ml, newdata){

  # check to see number of models in list
  col <- length(ml)
  # predict with map
  temp <- purrr::map(ml, ~as.vector(predict(.x, newdata)))
  # unlist and convert to matrix
  v <- unlist(temp)
  m <- matrix(v, ncol = col)

  return(m)

}


