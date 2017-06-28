# MachineLearning-SLR
Simple Linear Regression Algorithm using R program

# Formula
    Creaetd the package for SLR algorithum using below formula
    
    Y = ax + b
  
    where x is the future independent value
    
        sum(xy) - n   * xb  * yb
    b = ---------------------------------
        sum(square(x)) - n * square(x)
        
        _   __
    a = Y - bx
    
    formula to find Standard error on the estimation
    
    squareroot ( sum(y2) - z * sum(y) - b * sum(x*y)) / n-2 )
    
    
    
# Sample code to analysis cognizant quarter result analysis

    // Quarter Number
    x <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)

    // Earning Result
    y <- c(1371,1485,1600,1663,1711,1795,1891,1948,2020,2161,2305,2355,2422,2517,2581,2742,2911,3085,3187,3232,3202,3369,3453)

    // Forcast for next 5 quarter
    forcast <- c(24,25,26,27,28)

    result <- SLR(x = x,y=y,forcast = forcast)

    result$regressionLine

    // Find standard deviation error.
    result$sdError

    // Plot the grap
    plot(x,y, xlab = "quarter",ylab = "sale")
    abline(a=result$a,b=result$b)

    ![Preference](/Result.png?raw=true "Result")

# result$regressionLine
    This line list the outcome of next possible earining result for the 5 quarter 

    > result$regressionLine
    [[1]]
    [1] 3548.49

    [[2]]
    [1] 3644.9

    [[3]]
    [1] 3741.31

    [[4]]
    [1] 3837.72

    [[5]]
    [1] 3934.13

# Standard error in the prediciton 
    if the error in the prediction is very less that means the prediction probability is very high
    > result$sdError
    [1] 63.22
    
    
