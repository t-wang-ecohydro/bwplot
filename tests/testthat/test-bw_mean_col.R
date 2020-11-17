# default test added upon file creation
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

# custom tests from Assignment 1
test_that("Plot layers match non-function versions", {
  # iris
  expect_is(bw_mean_col(iris, Sepal.Width, Species), "ggplot")
  expect_equal(bw_mean_col(iris, Sepal.Width, Species)$layers, iristest$layers)
  # penguins
  expect_is(bw_mean_col(penguins, bill_depth_mm, island), "ggplot")
  expect_equal(bw_mean_col(penguins, bill_depth_mm, island)$layers, penguintest$layers)
})

test_that("Non-dataframe inputs throw error", {
  # numeric vector
  expect_is(mtcars$hp, "numeric")
  expect_error(bw_mean_col(mtcars$hp, hp, cyl))
  # string
  expect_is("mtcars", "character")
  expect_error(bw_mean_col("mtcars", hp, cyl),
               regexp = '\"mtcars\" must be of class tbl_df.\nYou have provided an object of class: character')

})

test_that("Warning messages appear when appropriate", {
  expect_warning(bw_mean_col(mtcars, c(hp, mpg), cyl),
                 regexp = 'Warning: More than one numerical column has been selected. Please verify your results.')
  expect_warning(bw_mean_col(penguins, bill_length_mm, species, saveplot = 12345),
                 regexp = 'The saveplot input \"12345.png\" has been converted to 12345.png by default')
})

test_that("Secondary arguments get passed down properly", {
  # trim
  expect_is(bw_mean_col(mtcars, mpg, cyl, trim = 0.2), "ggplot")
  expect_equal(bw_mean_col(mtcars, mpg, cyl, trim = 0.2)$layers, mttest$layers)
  # na.rm
  expect_is(bw_mean_col(penguins, bill_depth_mm, island), "ggplot")
  expect_equal(bw_mean_col(penguins, bill_depth_mm, island, na.rm=TRUE)$layers, penguintest$layers)
})


