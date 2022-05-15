library(lubridate)

source("stats-playground.R")
source("X.R")

######################################################
# Run the below code according to your patience.
# Do not collapse or code could magically disappear!
current_time = Sys.time()
wait = seconds(1) # change according to patience level

# Perform 10,000 simulations over and over
# until your patience has expired.
while (Sys.time() < current_time + wait) {
  for(i in seq_len(1e4)) {
    existing_aggregate = welford(X(), existing_aggregate)
  }
}

# Based on the current sample mean and its
# standard error, construct a CI for the population mean.

conf_level = 0.99 #change according to desire

n = existing_aggregate[1]
xn_bar = existing_aggregate[2]
SS = existing_aggregate[3]

standard_error_of_mean = sqrt(SS/(n - 1)) / sqrt(n)

margin_of_error = qt(p = mean(conf_level, 1), 
                     df = n - 1) * standard_error_of_mean

# Uncomment and modify these to match the known
# support of the random variable X.
# known_LB = 0
# known_UB = 1
if (exists("known_LB")) {
  LB = max(known_LB, xn_bar - margin_of_error)
} else {
  LB = max(xn_bar - margin_of_error)
}

if (exists("known_UB")) {
  UB = min(known_UB, xn_bar + margin_of_error)
} else {
  UB = min(xn_bar + margin_of_error)
}

if (exists("xn_bar_data")) {
  xn_bar_data = rbind(xn_bar_data[seq.int(max(1, nrow(xn_bar_data) - 28L), nrow(xn_bar_data)), ], cbind(n, xn_bar, conf_level, LB, UB))
} else {
  xn_bar_data = cbind(n, xn_bar, conf_level, LB, UB)
}

print(xn_bar_data)

matplot(x = xn_bar_data[, "n", drop = FALSE], y = xn_bar_data[, colnames(xn_bar_data) %in% c("LB", "UB"), drop = FALSE], type = "l", main = "Estimation of E(X)", xlab = "n", ylab = "xn_bar")

