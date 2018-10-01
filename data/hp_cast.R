library(rvest);
library(magrittr);
library(purrr);

target_url <- "http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1";

scraping_hp <- read_html(target_url);

cast <- scraping_hp %>%
        html_nodes("table") %>%
        .[3] %>%
        html_table(header=FALSE) %>% 
        .[[1]] %>%
        .[,-c(1,3)] %>% 
        .[-1,];

colnames(cast) <- c("Actor", "Character");
cast$Actor %<>% factor;