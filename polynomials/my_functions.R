library(polynom)

polynomial<-function(coefficients,x){
  return(coefficients[1]*x**2+coefficients[2]*x+coefficients[3])
}

print_polynomial<-function(coefficients){
  return(
    paste("<b>",round(coefficients[1],1),"</b>x^2 + ",
          "<b>",round(coefficients[2],1),"</b>x + ",
          "<b>",round(coefficients[3],1),
          sep = "")
  )
}


x <- c(0, 1,2)
y <- c(1,0,-1)

dat <- data.frame(cbind(x, y))

library(polynom)
poly.calc(x,y)
