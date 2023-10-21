# some convenience functions for making palettes.

library(wesanderson)

# Turn a two-character hex string into a numeric value.
ch2hex <- function(ch) {
  as.numeric(paste0("0x", ch))
}

# Turn an RGB hex string ("#rrggbb") into a color object.
color <- function(s) {
  c(
    r = substr(s, 2, 3),
    g = substr(s, 4, 5),
    b = substr(s, 6, 7)
  ) |>
    sapply(ch2hex)
}

# Turn a color object back into an RGB hex string.
col2str <- function(clr) {
  paste(
    c(
      "#",
      sprintf("%02x", clr)
    ),
    collapse = ""
  )
}

to_color <- function(c) {
  if (is.null(names(c))) {
    color(c)
  } else if (names(c) == c("r", "g", "b")) {
    c
  } else {
    color(c)
  }
}

# Average two RGB hex string colors.
meld <- function(c1, c2) {
  x1 <- color(c1)
  x2 <- color(c2)
  col2str(floor((x1 + x2) / 2))
}

layer <- function(cbelow, cabove, trans) {
  topfrac <- ch2hex(trans) / 255.0
  bottomfrac <- 1.0 - topfrac
  x1 <- color(cbelow)
  x2 <- color(cabove)
  col2str(floor((x1 * bottomfrac) + (x2 * topfrac)))
}

mix2 <- function(col1, w1, col2, w2) {
  totw <- w1 + w2
  c1 <- to_color(col1)
  c2 <- to_color(col2)
  floor(
    ((c1 * w1) + (c2 * w2)) / totw
  ) |>
    col2str()
}

label_pos <- function(n) {
  0:(n-1) + 0.5
}

# Draw a labeled bar graph with the given collections of colors.
disp <- function(...) {
  colorz <- c(...)

  barplot(
    rep(1, length(colorz)),
    col = colorz,
    yaxt="n",
    names.arg = paste0(names(colorz), "\n", colorz)
  )
}
