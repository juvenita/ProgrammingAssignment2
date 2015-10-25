## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix


#function used to assign the value of matrix ,set the value of inverse of matrix and cache the inverse of matrix
makeCacheMatrix <- function(mat = matrix())
 {
	mi <- NULL              
		#assigning the value of inverse matrix to  null
       setmatrix <- function(y) 
	{ 
         mat <<- y        
		#assigning the values of matrix to object mat using double assignment operator       
         mi <<- NULL      
		#assigning the value of inverse matrix null using double assignment operator 
	}
        getmatrix <- function() mat
		#function used to get the value of matrix

        setmatrix_inverse <- function(mi_v) mi <<- mi_v
		#function used to set the value of inverse matrix using double assignment operator

        getmatrix_inverse <- function() mi           
		#function used to get the values of inverse matrix

        list(setmatrix = setmatrix, getmatrix = getmatrix, 
             setmatrix_inverse = setmatrix_inverse,
             getmatrix_inverse= getmatrix_inverse)
		#functions are stored in as list to make it easier work with group of related functions
}



# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated
cacheSolve <- function(x) 
{
	mi <- x$getmatrix_inverse()
		# mi gets the value of inverse matrix if present 

	if(!is.null(mi)) 
		#checks whether the value of mi is not null
 	{
		message("getting cached data")
		return(mi)
		#returns the value of inverse of matrix

	 }

	data <- x$getmatrix()
		#function getmatrix is called and value of the the matrix is assigned to variable data

	mi <- solve(data)
		# r function solve is used to find inverse of matrix(assuming that the matrix supplied is always invertible)

x$setmatrix_inverse(mi)
mi
	#function set matrix is called to set the value of inverse of matrix 

}

