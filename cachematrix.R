## Perform an inverse matrix and cache the result for performance

## Create an inverse matrix and cache the result
makeCacheMatrix <- function(x = matrix()) {

  # Initialize the inverse matrix
  inverseMat <- NULL

  # Set the matrix and initialize the inverse matrix
  set <- function(y){
    x <<- y
    inverseMat <<- NULL
  }

  # Get the matrix
  get <- function() x

  # Set the inverse matrix
  setinverse <- function(solve) inverseMat <<- solve

  # Get the inverse matrix
  getinverse <- function() inverseMat

  # Return getters and setters for this function
  list(set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse)
}

## Return the cached inverse matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseMat <- x$getinverse()

        #Return the cached matrix if it exists
        if (!is.null(inverseMat)) {
          message("getting cached data")
          return(inverseMat)
        }

        #Otherwise, create it, cache it, then return
        data <- x$get()
        inverseMat <- solve(data,...)
        x$setinverse(inverseMat)
        inverseMat
}
