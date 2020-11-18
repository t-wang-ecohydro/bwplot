
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bwplot

<!-- badges: start -->

<!-- badges: end -->

The goal of bwplot is to …

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("t-wang-ecohydro/bwplot")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
# library(bwplot)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!

# pasted from readme.md

# bwplot [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

This repository contains files for `bwplot`, an R package for producing
`ggplot` graphs with a tidier default theme.

This package is under construction as part of UBC’s STAT 545B course for
the Winter 2020 semester.

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Available functions

Current plotting functions are: 1. `bw_mean_col`: produces a
`geom_col()` plot with the following defaults: - Background:
`theme_bw()` - Gridlines: none - Legend: none - Fill: unique color per
column - Axis labels: default data table column names 2. (to be
completed in later assignments?)
