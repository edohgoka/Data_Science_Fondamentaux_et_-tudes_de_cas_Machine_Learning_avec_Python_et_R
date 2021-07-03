x <- c(1:5, 10:14)
y <- x + c(-0.5, 0.5)

plot(x,y)

## Models
model1 <- lm(y~x) # simple linear regression
model2 <- lm(y~poly(x, 3)) # polynomial regression of order 3
model3 <- lm(y~poly(x, 9)) # polynomial regression of order 9

## Now let's use the different model to make a prediction
z <- seq(1, 14, length.out=250)
lines(z, predict(model1, data.frame(x = z)), lty = 1, col='blue')
lines(z, predict(model2, data.frame(x = z)), lty = 2, lwd=2, col='green')
lines(z, predict(model3, data.frame(x = z)), lty = 2, col='orange')

legend('bottom', c('classic linear regression',
                   'polynomial regression - order 3',
                   'polynomial regression - order 9',
                   'training data'),
       lty = c(1, 2, 2, NA), lwd = c(1, 2, 1, NA),
       pch = c(NA, NA, NA, 1),
       col=c('blue', 'green', 'orange', 'black'))
