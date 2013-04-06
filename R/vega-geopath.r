#' Vega geopath
#' 
#' Create a geopath visualization
#' 
#' @export
vega_geopath <- function(
    data, 
    labels = names(data),
    width = 500, 
    height = 400, 
    font = "Helvetica Neue", 
    font_size = 14, 
    fill_color = "pink", 
    hover_color = "lightblue", 
    padding = c(0, 0, 0, 0)
    ) {
    
    # Create Vega object
    rVega:::Vega$new(
        list(
            width = width,
            height = height,
            viewport = c(960, 500),
            data = list(
                list(
                    name = "world",
                    url = "data/countries.geo.json",
                    format = list(
                        type = "json",
                        property = "features"
                    )
                )
            ),
            marks = list(
                list(
                    type = "path",
                    from = list(
                        data = "world",
                        transform = list(
                            type = "geopath",
                            value = "data",
                            projection = "winkel3",
                            scale = 300,
                            translate = c(960, 500)
                        )
                    ),
                    properties = list(
                        enter = list(
                            stroke = list(value = "#fff"),
                            path = list(field = "path")
                        ),
                        update = list(fill = list(value = fill_color)),
                        hover = list(fill = list(value = hover_color))
                    )
                )
            )
        )
    )
}