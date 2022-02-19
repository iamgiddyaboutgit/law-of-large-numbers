# law-of-large-numbers

Obtain an estimate of the probability of event A using simulation.
Do this by generating a sequence of Bernoulli random variables,  
X1, X2, . . ., Xn, where Xi = 1 if the event A occurs 
and 0 if the event A does not occur.
Use the sample mean of these random variables as an
estimator of P(A). The code makes use of Welford's online 
variance method to allow for easy updating.

The file sampling-sim.R contains the main script and calls 
the others.  The user should modify the function 
is_trial_a_success() as necessary to simulate his unique use case.

