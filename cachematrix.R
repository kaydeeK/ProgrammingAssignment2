## The purpose of these functions are to cache the inverse of a matrix

## The first function creates a matrix object which is a list containing a function to:
## 1) set the matrix, 2) get the matrix, 3) set the inverse matrix, and 4) get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
}
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## The second function shown below calculates the inverse of the matrix, but first checks if
## if it has already been calculated. If it has, it returns the value from the cache, otherwise, it
## calculates the inverse and sets the inverse in the cache.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if (!is.null(i)) {
      message("getting cached data")
      return(i)
}
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}
