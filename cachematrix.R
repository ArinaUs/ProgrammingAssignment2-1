## Matrix inversion is ususallu a time comsuming computation. 
## One way to speed up the process is by caching the inverse of a matrix,
## instead of computing it over and over. 
## Belowe are the examples that are used to store a matrix and cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinverse <- function(i) inverse <- i
getinverse <- function() inverse
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Below is the function that computes the inverse of the atrix, using the one above. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached inverse")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
  
}
