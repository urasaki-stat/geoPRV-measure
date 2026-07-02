# geoPRV-measure: Geometric Mean Type of Proportional Reduction in Variation Measure

This repository provides an R implementation of the geometric mean type of proportional reduction in variation (geoPRV) measure for two-way contingency tables, as proposed in the following paper.

> Urasaki, W., Wada, Y., Nakagawa, T., Tahata, K., and Tomizawa, S. (2024).  
> **Geometric Mean Type of Proportional Reduction in Variation Measure for Two-Way Contingency Tables.**  
> *Sankhyā B: The Indian Journal of Statistics*, **86**, 139–163.  
> https://doi.org/10.1007/s13571-023-00320-w

The `geoPRV()` function calculates the geoPRV measure for a two-way contingency table, together with its approximate standard error and 95% confidence interval.

## Files

- `geoPRV.R`: Implements the `geoPRV()` function.
- `Example.R`: Contains the example dataset (`cannabis.dat`) and numerical examples presented in the paper.

## Usage

Load the `geoPRV()` function into R:

```r
source("geoPRV.R")
```

## Example

Using the example dataset `cannabis.dat` in `Example.R`:

```r
# Example with lambda = 1
f_lambda <- expression((x^(a + 1) - x) / a)
geoPRV(cannabis.dat, f_lambda, 1)

# Limiting case as lambda approaches 0
f_lambda0 <- expression(x * log(x))
geoPRV(cannabis.dat, f_lambda0, 0)
```
