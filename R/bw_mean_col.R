#' Title
#'
#' @param df A dataframe.
#' @param x The data column within `df` for which means are to be calculated.
#' @param by The data column within `df` containing the variable by which the columns are grouped.
#' @param verbose Optional argument that, when `TRUE`, prints information on the function's progress.
#' @param saveplot Optional argument to be used to save the output to file. It is the name the file should be saved as.
#' @param ... Optional arguments for the mean calculation - see `mean()` for more information.
#'
#' @return A `ggplot` object containing a bar graph of mean `x` per `by` with specialized theme settings.
#' @export
#'
#' @examples
#' bw_mean_col(iris, Sepal.Width, Species)
#' bw_mean_col(mtcars, mpg, cyl, trim = 0.2)
#'
#' @import dplyr
#' @import ggplot2
#' @importFrom magrittr "%>%"
#'
bw_mean_col <- function(df, x, by, verbose = FALSE, saveplot = "", ...) {
  # check input types
  if (verbose) {
    print("Verifying input...")
  }
  if(!is.data.frame(df)) {
    stop(deparse(substitute(df)), ' must be of class tbl_df.\n',
         'You have provided an object of class: ', class(df)[1])
  }
  if (ncol(df %>% dplyr::select({{ x }})) != 1) {
    warning('Warning: More than one numerical column has been selected. Please verify your results.')
  }

  if(!is.character(saveplot)) {
    saveplot <- paste(as.character(saveplot), ".png", sep = "")
    warning('The saveplot input ', deparse(substitute(saveplot)), ' has been converted to ', saveplot, ' by default.')
  }

  # create plot
  if (verbose) {
    print("Producing graph...")
  }

  output <- df %>%
    dplyr::group_by({{ by }}) %>%
    dplyr::summarise(mean = mean({{ x }}, ...)) %>%
    ggplot2::ggplot() +
    ggplot2::geom_col(aes(as.factor({{ by }}), mean, fill = as.factor({{ by }}))) +
    ggplot2::xlab(deparse(substitute(by))) + ggplot2::ylab(deparse(substitute(x))) +
    ggplot2::theme_bw() +
    ggplot2::theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = "none") +
    ggplot2::ggtitle(paste("Mean", deparse(substitute(x)), "per", deparse(substitute(by))))

  # save to file if applicable
  if (saveplot != "") {
    output + ggplot2::ggsave(paste(saveplot))
    if (verbose) {
      print("Plot saved as", saveplot)
    }
  }

  #finish
  if (verbose) {
    print("Complete!")
  }
  output

}
