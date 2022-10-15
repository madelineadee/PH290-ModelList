
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ModelList

<!-- badges: start -->
<!-- badges: end -->

The goal of ModelList is to create an S3 class ModelList which is a
container of regression or other models. There are methods for summary
and predict that can be used on this class. This was created for HW3 in
PH290 at UCB.

## Installation

You can install this version of ModelList from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("madelineadee/PH290-ModelList")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ModelList)

# create two sets of data
df <- mtcars
sample <- sample(c(TRUE, FALSE), nrow(df), replace=TRUE, prob=c(0.5,0.5))
train  <- df[sample, ]
test   <- df[!sample, ]

mod1 <- lm(mpg ~ cyl, train)
mod2 <- lm(mpg ~ cyl + am, train)

# create the ModelList container of models
mList <- CreateModelList(mod1, mod2)

# summary method for ModelList class
summary(mList)
#> [[1]]
#> 
#> Call:
#> lm(formula = mpg ~ cyl, data = train)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.4458 -1.8354 -0.6653  0.8847  6.1542 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  37.1264     4.1228   9.005  8.5e-06 ***
#> cyl          -2.7201     0.5973  -4.554  0.00138 ** 
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 3.056 on 9 degrees of freedom
#> Multiple R-squared:  0.6973, Adjusted R-squared:  0.6637 
#> F-statistic: 20.74 on 1 and 9 DF,  p-value: 0.001379
#> 
#> 
#> [[2]]
#> 
#> Call:
#> lm(formula = mpg ~ cyl + am, data = train)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.6308 -1.9231 -0.6192  0.8231  5.9692 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)   
#> (Intercept)   32.996      8.160   4.044  0.00372 **
#> cyl           -2.196      1.078  -2.038  0.07592 . 
#> am             2.219      3.733   0.594  0.56863   
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 3.173 on 8 degrees of freedom
#> Multiple R-squared:  0.7101, Adjusted R-squared:  0.6377 
#> F-statistic:   9.8 on 2 and 8 DF,  p-value: 0.007058

# prediction method for ModelList class
predict(mList, test)
#>           [,1]     [,2]
#>  [1,] 20.80556 22.03846
#>  [2,] 20.80556 22.03846
#>  [3,] 20.80556 19.81923
#>  [4,] 15.36528 15.42692
#>  [5,] 15.36528 15.42692
#>  [6,] 26.24583 24.21154
#>  [7,] 26.24583 24.21154
#>  [8,] 20.80556 19.81923
#>  [9,] 15.36528 15.42692
#> [10,] 15.36528 15.42692
#> [11,] 15.36528 15.42692
#> [12,] 26.24583 26.43077
#> [13,] 26.24583 26.43077
#> [14,] 26.24583 24.21154
#> [15,] 15.36528 15.42692
#> [16,] 26.24583 26.43077
#> [17,] 26.24583 26.43077
#> [18,] 26.24583 26.43077
#> [19,] 15.36528 17.64615
#> [20,] 15.36528 17.64615
#> [21,] 26.24583 26.43077
```
