library(fs)
library(tidyverse)

code_generated_figs <- list.files(path = "~/PSU2019-present/A_inf_soils_PhD/drafts/ball_response_popular_article/Mascitti-McNitt_inf_ball_response_STMA_2021-01-26_files/figure-docx/", pattern = '.svg|.png', full.names = T, recursive = T)

all_code_figs <- list.files(path = 'C:/Users/ecm200/OneDrive - The Pennsylvania State University/PSU2019-present/A_inf_soils_PhD/drafts/ball_response_popular_article/', pattern = "(svg)", full.names = T, recursive = T)

repeated_code_figs <- all_code_figs[str_detect(all_code_figs, pattern = 'figure-docx')]

desired_code_figs <-  repeated_code_figs[!str_detect(repeated_code_figs, 'STMA_2021-01-26')]

link_create(desired_code_figs, basename(desired_code_figs), symbolic = F)

################


# Figures generated in Illustrator 

all_stma_illustrator_figs <- list.files(path = 'C:/Users/ecm200/OneDrive - The Pennsylvania State University/PSU2019-present/A_inf_soils_PhD/drafts/ball_response_popular_article/', pattern = "(\\.png|\\.svg)$", full.names = T, recursive = T)

desired_stma_illustrator_figs <- all_stma_illustrator_figs[str_detect(all_stma_illustrator_figs, '(daish.*.svg)|(corkboard)')]

link_create(desired_stma_illustrator_figs, basename(desired_stma_illustrator_figs), symbolic = F)

#######################

proposal_illustrator_fig <- list.files(path = "C:/Users/ecm200/OneDrive - The Pennsylvania State University/PSU2019-present/A_inf_soils_PhD/drafts/phd-thesis-proposal/images/illustrations/ball_indentation/", pattern = "ball_indentation_1_panel.png", full.names = T)

link_create(proposal_illustrator_fig, basename(proposal_illustrator_fig), symbolic = F)


##########################


# for the actual baseball image 

library(googledrive)
library(tidyverse)

# list.files(path = "C:/Users/ecm200/OneDrive - The Pennsylvania State University/PSU2019-present/A_inf_soils_PhD/drafts/phd-thesis-proposal/images/illustrations/ball_indentation",  pattern = '(white).*\\.(png|svg)', full.names = T) %>%
#   fs::link_create(basename(.), symbolic = F)


# upload to google drive 

# create folders first 
# imgdrib <- drive_get('images/')
#(stock <- drive_mkdir(name = 'stock-presentation-images', path =  imgdrib) )


list.files(pattern = 'baseball') %>% 
  map(~drive_upload(media =., path = 'shareable-content/images/stock-presentation-images/', overwrite = T))

list.files(pattern = 'baseball') %>% 
  map(drive_share, role = 'reader', type = 'anyone')

whitebg <- drive_find('baseball-white-bg.png') %>% 
  as_id()

img_link <- paste0('https://drive.google.com/uc?id=', whitebg)

img_link
