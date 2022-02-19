####################################
# See: https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Parallel_algorithm
# 
# Calculate the grand sample mean and sum of squared deviations
# using summary statistics from two independent simple random samples # of the same population.
# input:
# n1: integer. Number of observations in sample 1.
# x1_dot_bar: numeric. Sample mean of sample 1.
# SS1: numeric. Sum of squares for sample 1.
# n2: integer. Number of observations in sample 2.
# x2_dot_bar: numeric. Sample mean of sample 2.
# SS2: numeric. Sum of squares for sample 2.
######
get_grand_mean_and_SS = function(n1, x1_dot_bar, SS1, n2, x2_dot_bar, SS2) {
  n = n1 + n2
  delta = x2_dot_bar - x1_dot_bar
  SS = SS1 + SS2 + delta ** 2 * n1 * n2 / n
  grand_mean = (n1 * x1_dot_bar + n2 * x2_dot_bar) / n
  return(list(grand_mean, SS))
}

######
# This is Welford's online variance method adapted to 
# return just the sum of squares.
# input:
# x: numeric. Next data value.
# M: numeric. From last iteration.
# S: numeric. Sum of Squares from last iteration.
# https://www.johndcook.com/blog/standard_deviation/
# https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#Welford's_online_algorithm

# Start out with no data and hence a count of 0,
# a mean x_bar of 0, and a sum of squares SS of 0.
existing_aggregate = c(0, 0, 0)

# For a new value x, compute the new count, new mean x_bar, the new sum of squares SS.
# x_bar accumulates the mean of the entire dataset
# SS aggregates the squared distance from the mean
# count aggregates the number of samples seen so far
welford = function(x, existing_aggregate) {
  count = existing_aggregate[1]
  x_bar = existing_aggregate[2]
  SS = existing_aggregate[3]
  
  count = count + 1
  delta = x - x_bar
  x_bar = x_bar + delta / count
  delta2 = x - x_bar
  SS = SS + delta * delta2
  
  existing_aggregate = c(count, x_bar, SS)

  return(existing_aggregate)
}



