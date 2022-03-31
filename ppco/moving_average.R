
da <- readr::read_csv('ppco/ex_demand_moving_average.csv')

da |> 
  dplyr::mutate(
    three_week = zoo::rollmean(
      x = demand, 
      k = 3, 
      fill = NA,
      align = 'right'),
    nine_week = zoo::rollmean(
      x  = demand,
      k = 9,
      fill = NA,
      align = 'right'
    )
  ) |> 
  tidyr::pivot_longer(
    cols  = demand:nine_week,
    names_to = 'labels',
    values_to = 'values'
  ) |> 
  ggplot2::ggplot(ggplot2::aes(week, values, color = labels)) +
  ggplot2::geom_line() + 
  ggplot2::theme_bw()
