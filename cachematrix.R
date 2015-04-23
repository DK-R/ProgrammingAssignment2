## This pair of functions that cache the inverse of a matrix are written for 
## potential reducing of time-consuming computations, including:
## 1. makeCacheMatrix
## 2. cacheSolve
## Motivation: 
## Matrix inversion is usually a costly computation and there may be
## some benefit to caching the inverse of a matrix rather than compute 
## it repeatedly.
## 
## The first function, makeCacheMatrix, creates a special "matrix", 
## which is actually a list containing a function to
## 1. set - set the value of the matrix
## 2. get - get the value of the matrix
## 3. setinverse - set the value of the inverse matrix
## 4. getinverse - get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() { x }
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" 
## created with the above function. However, it first checks to see if
## the inverse has already been calculated. If so, it gets the inverse 
## from the cache and skips the computation. Otherwise, it calculates the 
## inverse of the data and sets the value of the inverse in the cache via 
## the setinverse function.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        i
    }else {
        data <- x$get()
        message("computing data")
        i <- solve(data, ...)
        x$setinverse(i)
        i
    }
}
