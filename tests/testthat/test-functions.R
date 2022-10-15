

# create sample dataset to use for testing
df <- mtcars
sample <- sample(c(TRUE, FALSE), nrow(df), replace=TRUE, prob=c(0.5,0.5))
train  <- df[sample, ]
test   <- df[!sample, ]

mod1 <- lm(mpg ~ cyl, train)
mod2 <- lm(mpg ~ cyl + am, train)


# test ModelList creation ==============================================================

test_that("CreateModelList works", {

  mList <- CreateModelList(mod1, mod2)
  expect_equal(length(mList), 2)
  expect_s3_class(mList, "ModelList")

})


# test summary method ==================================================================

test_that("summary.ModelList works", {

  mList <- CreateModelList(mod1, mod2)
  s <- summary(mList)
  expect_equal(length(s), 2)
  expect_type(s, "list")
  expect_output(summary(mList))

})


# test predict method ==================================================================

test_that("predict.ModelList works", {

  mList <- CreateModelList(mod1, mod2)
  m <- predict(mList, test)
  expect_equal(nrow(m), nrow(test))
  expect_equal(class(m)[1], "matrix")

})

