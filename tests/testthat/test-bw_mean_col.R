test_that("Function produces a ggplot object", {
  # iris dataset
  expect_is(bw_mean_col(iris, Sepal.Width, Species), "ggplot")
  # penguins dataset
  expect_is(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island), "ggplot")
})

test_that("Plot mapping matches provided input", {
  # x (horizontal axis): factorized form of `by` argument
  expect_equal(as.character(bw_mean_col(iris, Sepal.Width, Species)$layers[[1]]$mapping$x[[2]][[2]][[2]]), "Species")
  # y (vertical axis): because of summarise() prior to plotting, we can't  see the original column name
  expect_equal(as.character(bw_mean_col(iris, Sepal.Width, Species)$layers[[1]]$mapping$y[[2]]), "mean")
  # fill: factorized form of `by` argument - indices for "fill" and "x" are extra long because of factorization
  expect_equal(as.character(bw_mean_col(iris, Sepal.Width, Species)$layers[[1]]$mapping$fill[[2]][[2]][[2]]), "Species")
})

test_that("Plot labels match provided input", {
  # Plot title
  expect_identical(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island)$labels$title, "Mean bill_depth_mm per island")
  # y axis label
  expect_identical(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island)$labels$y, "bill_depth_mm")
  # x axis label
  expect_identical(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island)$labels$x, "island")
  # fill label (not displayed in plot)
  expect_identical(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island)$labels$fill, "as.factor(island)")
})

test_that("Plot background is white", {
  expect_equal(bw_mean_col(iris, Sepal.Width, Species)$theme$plot.background$colour, "white")
})

test_that("Plot legend is removed", {
  expect_equal(bw_mean_col(iris, Sepal.Width, Species)$theme$legend.position, "none")
})

test_that("Gridlines are blank instead of the ggplot default", {
  # major gridlines
  expect_equal(bw_mean_col(iris, Sepal.Width, Species)$theme$panel.grid.major, ggplot2::element_blank())
  # minor gridlines
  expect_equal(bw_mean_col(iris, Sepal.Width, Species)$theme$panel.grid.minor, ggplot2::element_blank())
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
  # Multi-column `x` argument - warns to verify data
  expect_warning(bw_mean_col(mtcars, c(hp, mpg), cyl),
                 regexp = 'Warning: More than one numerical column has been selected. Please verify your results.')
  # Non-chr `saveplot` input - informs of conversion to chr
  expect_warning(bw_mean_col(palmerpenguins::penguins, bill_length_mm, species, saveplot = 12345),
                 regexp = 'The saveplot input \"12345.png\" has been converted to 12345.png by default')
})

test_that("Secondary arguments get passed down to mean()", {
  # trim
  expect_equal(bw_mean_col(mtcars, mpg, cyl, trim=0.2)$data,
               mtcars %>%
                 group_by(cyl) %>%
                 summarise(mean = mean(mpg, trim=0.2)))
  # na.rm
  expect_equal(bw_mean_col(palmerpenguins::penguins, bill_depth_mm, island, na.rm=TRUE)$data,
               palmerpenguins::penguins %>%
                 group_by(island) %>%
                 summarise(mean = mean(bill_depth_mm, na.rm=TRUE)))
})

