library(tidyverse)

n_0 = 1e6
n_1 = 50
n_2 = 25

df_0 = list()
df_1 = list()
df_2 = list()

df_0[[1]] = sample(letters, n_0, replace = T)
df_0[[2]] = sample(c("Y","N","NAN"), n_0, replace = T)
df_0[[3]] = rnorm(n_0)
df_0[[4]] = rbinom(n_0, 6, .5)
df_0[[5]] = rexp(n_0, 1.2)
df_0[[6]] = rpois(n_0, 1.75)
df_0[[7]] = rgamma(n_0, 5, .5)
df_0[[8]] = 0

df_1[[1]] = sample(letters, n_1, replace = T, prob = c(rep(1, 10), 1.5, rep(1, 10), 1.2, rep(1, 4)))
df_1[[2]] = sample(c("Y","N","NAN"), n_1, replace = T, prob = c(1, .9, 1.1))
df_1[[3]] = rnorm(n_1, mean = -.1)
df_1[[4]] = rbinom(n_1, 6, .6)
df_1[[5]] = rexp(n_1, 1.3)
df_1[[6]] = rpois(n_1, 1.8)
df_1[[7]] = rgamma(n_1, 5.5, .5)
df_1[[8]] = 1

df_2[[1]] = sample(letters, n_2, replace = T, prob = c(rep(1, 8), 1.5, rep(1, 8), 1.2, rep(1, 8)))
df_2[[2]] = sample(c("Y","N","NAN"), n_2, replace = T, prob = c(1, .95, 1.2))
df_2[[3]] = rnorm(n_2, mean = .1)
df_2[[4]] = rbinom(n_2, 6, .4)
df_2[[5]] = rexp(n_2, 1.4)
df_2[[6]] = rpois(n_2, 1.55)
df_2[[7]] = rgamma(n_2, 5.75, .5)
df_2[[8]] = 1


synth = bind_rows(as_tibble(df_0,.name_repair = "universal"),
                  as_tibble(df_1,.name_repair = "universal"),
                  as_tibble(df_2,.name_repair = "universal"))

write_csv2(synth, path = "synth.csv")
