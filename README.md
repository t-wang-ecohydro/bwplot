# bwplot [![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

This repository contains files for `bwplot`, an R package for producing `ggplot` graphs with a tidier default theme. 

This package is under construction as part of UBC's STAT 545B course for the Winter 2020 semester.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[![GitHub tag](https://img.shields.io/github/tag/Naereen/StrapDown.js.svg)](https://GitHub.com/Naereen/StrapDown.js/tags/)

[![GitHub commits](https://img.shields.io/github/commits-since/Naereen/StrapDown.js/v1.0.0.svg)](https://GitHub.com/Naereen/StrapDown.js/commit/)

## Available functions

Current plotting functions are:
1. `bw_mean_col`: produces a `geom_col()` plot with the following defaults:
  - Background: `theme_bw()`
  - Gridlines: none
  - Legend: none
  - Fill: unique color per column
  - Axis labels: default data table column names
2. (to be completed in later assignments?)
