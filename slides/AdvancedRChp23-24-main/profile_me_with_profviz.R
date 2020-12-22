dontdothis2 <- function(size){
  res <- c()
  for (i in seq(size)) {
    res <- c(res, i)
  }
  return(res)
}
dothis2<-function(size){
  res <- vector(length = size)
  for (i in seq(size)) {
    res[i] <- i
  }
  return(res)
}
