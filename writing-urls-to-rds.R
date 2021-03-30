ids <- c("1GK4XzyTv-ZpfYaxbtCIrVdczoho7r_AK", "1CogUjvnfByj2bDPj3SO6Jnpp4UGqlVjA", "1cdUcr0c9GJBDPirJK9lZvQWnImGWtm3f", "1I962LjSL2Z3d7IiHMOVq6L4XxwMyelXE",
         "1g_al0Boo7wutOyRVUZSpBMbAGjyZX9fx")
  
files <- c("ball_indentation_1_panel.svg", "batted-ball-density-2020-1.svg",
"brosnan-survey-gmax-values-1.svg", "daish_fig_9.2_redraw.svg", 'corkboard-concept')

args <- tibble(
  x= ids
)

imgs <- tibble(
  x = files,
  url= flatten_chr(map(args, build_drive_url))
)

imgs <- transpose(imgs) %>% 
  set_names(nm= stringr::str_remove(imgs$x, "\\.svg")) %>% 
  map('url')

readr::write_rds(imgs, 'google-drive-image-refs.rds')

