# Rumor Spreading Model Simulation
## General Summary
Ordinary Differential Equations have been used to simulate the transmission of rumors in a simple scenario. In modeling our differential equations, we employ the ```deSolve``` package in R. We define a function called ```rumorEquations``` to store our system of differential equations. Convenient access to the columns of a data frame is facilitated through the use of the with() function. The vector ```parameterValues``` holds the values of ```beta``` and ```alpha```. Similarly, the vector ```initialValues``` retains the initial values of H, I, and R at the commencement of the simulation, while ```timeValues``` stores a sequence of points defining the range for the simulation. In our case, this sequence extends from 0 to 10. We employ the ```ode()``` function to solve the system of differential equations. This function accepts inputs such as initial values, time points, the ```rumorEquations``` function, and the parameter values. Subsequently, it yields a data frame that encompasses the values of H, I, and R at various time
points. The resultant data is stored in the variable ```values1```. Finally, we employ the ```as.data.frame()``` function to convert the output of values1 into a data frame, and utilize the ```plot()``` function for plotting purposes.

## Differential Equations
The differential equations for the rumor spreading model are defined in the ```rumorEquations``` function. The equations capture the flow of individuals between the compartments based on the parameters ```alpha``` and ```beta```.
```
dH <- (beta * H * I) - (alpha * H)
dI <- -beta * H * I
dR <- alpha * H
```
## Parameter Exploration
The code explores the impact of different combinations of ```alpha``` and ```beta``` values on the rumor spreading dynamics. It generates a grid of plots, each corresponding to a specific pair of ```alpha``` and ```beta``` values.

## Visualization
For each combination of ```alpha``` and ```beta```, the code initializes the model, solves the ODEs using the ```ode``` function, and plots the evolution of the Ignorant, Active, and Moral compartments over time. Each plot is labeled with the corresponding values of ```alpha``` and ```beta```.

## Usage
Copy and paste the code into your R environment.

Ensure the ```deSolve``` library is installed (```install.packages("deSolve")```).

Execute the code to generate and visualize the rumor spreading model simulations.

## Notes
Adjust the ranges and step sizes of ```alpha_values``` and ```beta_values``` to explore different scenarios.

The code uses a simple grid layout to display multiple plots on a single page for efficient comparison.

## Output
The code produces a series of plots, each illustrating the rumor spreading dynamics for a specific combination of ```alpha``` and ```beta```. The plots provide insights into how different parameters influence the progression of the rumor spreading model.

## Resetting Plot Layout
The code concludes by resetting the plot layout to the default configuration. Adjust the layout as needed for further analysis.
