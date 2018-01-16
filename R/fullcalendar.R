#' Generate Calendar
#'
#' Generate calendar
#' @param events data.frame where each row is a event object, see \url{https://fullcalendar.io/docs/event_data/Event_Object/}
#' @param options list of options, see notes
#' @param callbacks list of JavaScript callback functions. Must wrap JavaScript with \code{htmlwidgets::JS}
#' @import htmlwidgets jsonlite
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId Use an explicit element ID for the widget (rather than an automatically generated one). Useful if you have other JavaScript that needs to explicitly discover and interact with a specific widget instance.
#' @export
fullcalendar <- function(events = NULL, options = NULL, callbacks = NULL, width = NULL, height = NULL, elementId = NULL) {
  # create widget
  htmlwidgets::createWidget(
    name = 'fullcalendar',
    x = c(list(events = events), options, callbacks),
    width = width,
    height = height,
    package = 'fullcalendarWidget',
    elementId = elementId
  )
}

#' Shiny bindings for fullcalendar
#'
#' Output and render functions for using fullcalendar within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a fullcalendar
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name fullcalendar-shiny
#'
#' @export
fullcalendarOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'fullcalendar', width, height, package = 'fullcalendarWidget')
}

#' @rdname fullcalendar-shiny
#' @export
renderFullcalendar <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fullcalendarOutput, env, quoted = TRUE)
}
