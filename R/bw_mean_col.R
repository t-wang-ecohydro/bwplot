bw_mean_col <- function(df, x, by, verbose = FALSE, saveplot = "", ...) {
  # check input types
  if (verbose) {
    print("Verifying input...")
  }
  if(!is.data.frame(df)) {
    stop(deparse(substitute(df)), ' must be of class tbl_df.\n',
         'You have provided an object of class: ', class(df)[1])
  }
  if (ncol(df %>% select({{ x }})) != 1) {
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
    group_by({{ by }}) %>%
    summarise(mean = mean({{ x }}, ...)) %>%
    ggplot() +
    geom_col(aes(as.factor({{ by }}), mean, fill = as.factor({{ by }}))) +
    xlab(deparse(substitute(by))) + ylab(deparse(substitute(x))) +
    theme_bw() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          legend.position = "none") +
    ggtitle(paste("Mean", deparse(substitute(x)), "per", deparse(substitute(by))))

  # save to file if applicable
  if (saveplot != "") {
    output + ggsave(paste(saveplot))
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
