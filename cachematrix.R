## a pair of funnctions which enable caching of inverse of a matrix.

## Returns a list of functions which take care of caching

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
	set <- function(y) {
		x <<- y
		inverse <<- NULL
	}
      get <- function() x
	getinverse <- function() inverse
	setinverse <- function(i) inverse <<- i
	list(get = get, set = set, setinverse = setinverse, getinverse = getinverse)
}


## uses the list of functions returned by makeCacheMatrix
## returns the cached inverse or solves the matrix and stores the result in cache

cacheSolve <- function(x, ...) {
	inverseCache <- x$getinverse()
	if(!is.null(inverseCache))
	{
		message("getting cached data.")
		return(inverseCache)
	}
	data <- x$get()
	m <- solve(data)
	x$setinverse(m)
	m	
}
