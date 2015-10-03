## Put comments here that give an overall description of what your
## functions do
## There are two functions in this R file.
## 1. makeCacheMatrix: create a "matrix" object that can cache its inverse.
## 2. cacheSolve: solver the inverse of the above matrix object.

## Write a short comment describing this function
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    set.inv <- function(inv) i <<- inv
    get.inv <- function() i
    list(set = set, get = get,
         set.inv = set.inv,
         get.inv = get.inv)
    
}

## Test code
x <- 0.5 * diag(3)
m <- makeCacheMatrix(x)
m$get()
m$get.inv()

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cachesolve should retrieve the inverse from
## the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$get.inv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$set.inv(m)
    m
}

## Test code
cacheSolve(m)
cacheSolve(m)
