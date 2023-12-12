library(deSolve)

# Define your differential equations
rumorEquations <- function(time, variables, parameters) {
  with(as.list(c(variables, parameters)), {
    dH <- (beta * H * I) - (alpha * H)
    dI <- -beta * H * I
    dR <- alpha * H
    return(list(c(dH, dI, dR)))
  })
}

# Create a range of alpha and beta values
alpha_values <- seq(0, 1, by = 0.5)
beta_values <- seq(0, 1, by = 0.5)

# Set up the layout for multiple plots on a single page
num_alpha <- length(alpha_values)
num_beta <- length(beta_values)
num_plots <- num_alpha * num_beta
layout_matrix <- matrix(1:num_plots, ncol = num_beta, byrow = TRUE)
par(mfrow = c(num_alpha, num_beta))

# Loop through the values of alpha and beta
for (alpha in alpha_values) {
  for (beta in beta_values) {
    parameterValues <- c(beta = beta, alpha = alpha)
    
    initialValues <- c(H = 1, I = 199, R = 0)
    
    timeValues <- seq(0, 10)
    
    values1 <- ode(
      y = initialValues,
      times = timeValues,
      func = rumorEquations,
      parms = parameterValues
    )
    
    values1 <- as.data.frame(values1)
    
    with(values1, {
      plot(time, I, type = "l", col = "blue",
           xlab = "time", ylab = "Number of People", ylim = c(0, 200))
      lines(time, H, col = "red")
      lines(time, R, col = "green")
    })
    
    legend("right", c("Ignorant", "Active", "Moral"),
           col = c("blue", "red", "green"),
           lty = 1,
           bty = "n")
    
    title(paste("Alpha =", alpha, "Beta =", beta))
  }
}

# Reset the plot layout to default
par(mfrow = c(1, 1))
