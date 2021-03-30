library(tidyverse)

library(googledrive)

svgs <- list.files(path = '.', pattern = '\\.svg$')
svgs

wanted <- svgs[!str_detect(svgs, 'baseball-')]

args <- tibble(
  media = wanted,
  path = "shareable-content/images/stock-presentation-images/",
  )


pwalk(args, drive_upload)

shareit <- map(args$media, drive_find) %>% 
  reduce(rbind) %>% 
  rename(file = media)

class(shareit)

drive_share(shareit, role = 'reader', type = 'anyone')
