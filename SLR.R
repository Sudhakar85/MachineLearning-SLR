#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

SLR <- function(x,y,forcast)
{
  #x <- c(1,2,3,4,5,6,7,8,9,10,11,12)
  #y <- c(600,1550,1500,1500,2400,3100,2600,2900,3800,4500,4000,4900)
  #forcast <- c(13,14,15,16,17)
  
  result <- list(error = character(),
                 indepedentX = vector("numeric"),
                 depedentY = vector("numeric"),
                 a = numeric(),
                 b = numeric(),
                 xy = vector("numeric"),
                 x2 = vector("numeric"),
                 xb = numeric(),
                 yb = numeric(),
                 n = integer(),
                 ySum = numeric(),
                 xSum = numeric(),
                 regressionLine = vector("numeric"),
                 newprediction = vector("numeric"),
                 sdError = numeric(), stringsAsFactors = FALSE)
  result
  
  if(!is.vector(x))
  {
    try(throw("X has to be vector type"))
  }
  if(!is.vector(y))
  {
    try(throw("y has to be vector type"))
  }
  
  result$indepedentX <- x
  result$depedentY <- y
  
  result$n <- length(x)
  
  if(length(x) != length(y))
    try(throw("x and y has to be in same data length"))
  
  result$xy <- round(result$indepedentX * result$depedentY,2)
  
  result$x2 <-   result$indepedentX * result$indepedentX
  
  result$ySum <- sum(result$depedentY)
  result$xSum <- sum(result$indepedentX)
  
  # _               _
  # X = sum (x) / n Y = sum(y) / n
  result$xb <-round(( result$xSum / result$n ),2)
  result$yb <-round(( result$ySum / result$n ),2)
  
  #formula y = a + bx
  
  #find a and b
  
  # b = sum(xy) - n * xb * yb
  #     ----------------------------
  #     sum(squar(X)) - n * square(X)
  
  result$b <-  round( ( sum(result$xy) - (result$n * result$xb * result$yb) ) /
                        ( sum(result$x2) - (result$n *  (result$xb * result$xb )) ), 2)
  
  # a formula
  #     _    _
  # a = Y - bx
  
  
  result$a <- round( (result$yb - ( result$b * result$xb )), 2)
  
  # Regression line formula
  
  # Y = a + bX
  # where x is the future indepedent value
  
  temp <-forcast
  
  result$regressionLine <- lapply(temp, function(x) result$a + (result$b * x)  )
  
  temp <- x
  
  result$newprediction <- lapply(temp, function(x) result$a + (result$b * x)  )
  
  # standared Error or the estimation
  
  # squareroot ( sum(y2) - z * sum(y) - b * sum(x*y)) / n-2 )
  
  result$sdError <- round(sqrt( ( (sum(result$depedentY * result$depedentY) -
                                     (result$a * sum(result$depedentY))  -
                                     (result$b * sum(result$xy)) ) /
                                    (result$n - 2)
  )
  )
  ,2 )
  result
  
}
