## Preprocessing for HW5 Shiny App

retweets <- read_csv("data/retweets_congress_115th.csv.gz", 
                     col_types = cols("tweet_id_str" = "character",
                                      "created_at" = col_datetime("%a %b %d %H:%M:%S %z %Y"))) |>
  drop_na(full_text)

members <- group_by(retweets, user_screen_name) |>
  summarize(chamber = first(chamber),
            party = first(party),
            gender = first(gender),
            state = first(state),
            birthday = first(birthday),
            max_followers = max(user_followers_count),
            median_rt_follower = median(rt_followers_count))

tags <- str_match_all(retweets$full_text, "\\#[a-zA-Z0-9]+")
tags_ids <- map2_dfr(retweets$tweet_id_str, tags, function(id, ts) { tibble(tweet_id_str = id, hashtag = ts[,1])})

select(retweets, created_at, chamber, party, gender, state, tweet_id_str) |>
  inner_join(tags_ids) -> retweets_tags

save(file = "homework5_shiny_data.rda", retweets_tags)
