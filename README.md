
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

This is a basic example which shows you how to use the package:

Setup and run models.

``` r
library(ModelList)

# create two sets of data
df <- mtcars
sample <- sample(c(TRUE, FALSE), nrow(df), replace=TRUE, prob=c(0.5,0.5))
train  <- df[sample, ]
test   <- df[!sample, ]

mod1 <- lm(mpg ~ cyl, train)
mod2 <- lm(mpg ~ cyl + am, train)
```

Create the ModelList container of models.

``` r

mList <- CreateModelList(mod1, mod2)
```

Summary method for ModelList class.

``` r

summary(mList)
#> [[1]]
#> 
#> Call:
#> lm(formula = mpg ~ cyl, data = train)
#> 
#> Residuals:
#>      Min       1Q   Median       3Q      Max 
#> -2.11429 -1.05952  0.00476  0.79048  2.29524 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  30.1762     1.5537  19.422 5.50e-11 ***
#> cyl          -1.8452     0.2364  -7.806 2.92e-06 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 1.37 on 13 degrees of freedom
#> Multiple R-squared:  0.8242, Adjusted R-squared:  0.8106 
#> F-statistic: 60.93 on 1 and 13 DF,  p-value: 2.923e-06
#> 
#> 
#> [[2]]
#> 
#> Call:
#> lm(formula = mpg ~ cyl + am, data = train)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -2.0576 -0.7530 -0.3121  0.7515  2.5788 
#> 
#> Coefficients:
#>             Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)  29.2121     1.6898  17.287 7.59e-10 ***
#> cyl          -1.7318     0.2468  -7.018 1.40e-05 ***
#> am            1.1909     0.9234   1.290    0.221    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 1.337 on 12 degrees of freedom
#> Multiple R-squared:  0.8456, Adjusted R-squared:  0.8198 
#> F-statistic: 32.85 on 2 and 12 DF,  p-value: 1.356e-05
```

Predict method for ModelList class.

``` r

predict(mList, test)
#>           [,1]     [,2]
#>  [1,] 19.10476 20.01212
#>  [2,] 15.41429 15.35758
#>  [3,] 22.79524 22.28485
#>  [4,] 15.41429 15.35758
#>  [5,] 15.41429 15.35758
#>  [6,] 15.41429 15.35758
#>  [7,] 22.79524 23.47576
#>  [8,] 22.79524 23.47576
#>  [9,] 22.79524 23.47576
#> [10,] 15.41429 15.35758
#> [11,] 15.41429 15.35758
#> [12,] 22.79524 23.47576
#> [13,] 22.79524 23.47576
#> [14,] 22.79524 23.47576
#> [15,] 15.41429 16.54848
#> [16,] 15.41429 16.54848
#> [17,] 22.79524 23.47576
```
