# Use the Law of Large Numbers to estimate E(X) and Var(X)

The code makes use of Welford's online 
variance method to allow for easy updating.

The file sampling-sim.R contains the main script and calls 
the others.  The user should modify the function 
X() in X.R as necessary to simulate his unique use case.
X() should be modified to return values of your random variable.

