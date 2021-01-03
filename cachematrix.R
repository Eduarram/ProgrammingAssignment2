## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## the first function calculate the inverse of matrix
## and save this into the sub environment in cache shaped.  

## create a matrix object 
makeCacheMatrix <- function(x = matrix()) {
  #create a empty object m cache 
  m <- NULL
  ## set the y function to 
  set <- function(y) {
    x <<- y 
    ## assing the array input y to variable x 
    ## in parent enviroment 
    
##re-initialize m in the parent environment to null  
    m <<- NULL  

  }
  get <- function() x #return the matrix 
  setinverse <- function(solve) m <<- solve ## set the
  ## cache m equal 
  getinverse <- function() m ## return the cache inverse of x 
## now this especial function create a new list 
## with four columns : set the value of matrix 
## and value of the inverse, get the value of matrix  
## and value of the inverse.
  list(set = set, get= get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## the second function calculate the special matrix, but if 
## the first function didn't make the inverse matrix,
## the second function calculate the inverse matrix, this evaluation
## you see in the line [39] and the calculus you see in the line[44].

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,  ...)
  x$setinverse(m)
  m
}

## the next code create a matrix and evaluate the functions. 

m <- matrix(data = rnorm(9, mean = 0, sd = 0.98), ncol = 3, nrow = 3)

pollo <- makeCacheMatrix(m)

cacheSolve(pollo)
