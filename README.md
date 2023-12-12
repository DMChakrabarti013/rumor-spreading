# rumor-spreading
ODEs have been used to simulate the transmission of rumors in a simple scenario. 

In modeling our differential equations, we employ the deSolve package in R. We define a function
called rumorEquations to store our system of differential equations. Convenient access to the
columns of a data frame is facilitated through the use of the with() function.

The vector parameterValues holds the values of beta and alpha. Similarly, the vector initialValues
retains the initial values of H, I, and R at the commencement of the simulation, while timeValues
stores a sequence of points defining the range for the simulation. In our case, this sequence extends
from 0 to 10.

We employ the ode() function to solve the system of differential equations. This function accepts
inputs such as initial values, time points, the rumorEquations function, and the parameter values.
Subsequently, it yields a data frame that encompasses the values of H, I, and R at various time
points. The resultant data is stored in the variable values1.

Finally, we employ the as.data.frame() function to convert the output of values1 into a data
frame, and utilize the plot() function for plotting purposes.
