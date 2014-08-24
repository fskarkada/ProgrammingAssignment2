## Functions for inverted matrices with caching 

## Creates cacheable matrix for inputting to cacheSolve() funtion which sets and gets the cached values

makeCacheMatrix <- function(original.matrix = matrix()) {
# To see if we have correct value
if (!is.matrix(original.matrix)) {
	stop(" give a matrix")
   }
   invertd.matrix <- NULL
   set <- funtion(y) {
    original.matrix <<- y
    inverted.matrix <<- NULL
    }
  # funtion for setting getting and setting cached inv. matrix value
  get <- funtion() original.matrix
  # Inversing the matrix using solve() function in R
set.inverse <- function(solve) inverted.matrix <<- solve
get.inverse <- function() inverted.matrix

list( 
set = set,
get = get,
set.inverse = set.inverse
get.inverse = get.inverse)
}

## Computes the inverse of the cacheable matrix returned by makeCacheMatrix()
## If the inverse has already been calculated and there's no change in the matrix
## then the cacheSolve() returns the cached inverse

  cacheSolve <- function(cacheable.matrix, ...) {
inverted.matrix <- cacheable.matrix$get.inverse()
# To check if we have cached matrix available
if(!is.null(inverted.matrix)) {
message("Getting cached inverse matrix")
return(inverted.matrix)
}

# To create inverted matrix in case there's no cached matrix available.
matrix.to.inverse <- cacheable.matrix$get()
inverted.matrix <- solve(matrix.to.inverse)
cacheable.matrix$set.inverse(inverted.matrix)
inverted.matrix
}