Heat equation in 3D: Temperature evolution of an egg being cooked
====

Description: This code computes the temperature at every point of a 3D grid (size n^3) using the Euler Method as primary tool 
for solving the heat equation in three dimensions. As an example, we solve the heat equation that describes the cooking of a 5 cm radius egg
up to a temperature of 63 degrees Celsius. By running heat_equation_3D.m one produces the figures shown in /plots where the temperature as a function of X and Y is shown,
together with the central temperature of the egg. Moreover, two additional plots show how the computational time behaves as a function of the egg radius and also as a function of
the number of grid size. Simulations are fastest for larger eggs and smaller grids. Simulations are slowest for smaller eggs and larger grids.

## Figures:

![center_egg_heat_equation_3D](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/bc47521c-f90a-4084-a841-b9ab18f388ef)
![egg_heat_equation_3D](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/cba3dcf2-a073-4388-8be3-2b14514c3c7e)
![computational_time_vs_egg_radius](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/c8fe1d90-61f3-4742-9ba8-0b489ea47ff7)
![computational_time_vs_n_grid_size](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/27aba9be-7a99-48d8-921d-a0e9ce7bde67)

## Requirements:

- MATLAB (version 2017 or later)

Moreover, additional MATLAB notebooks diffusion_eqn_2D.m and diffusion_eqn_1D.m are provided to solve the 1D and 2D diffusion equations. This is not directly related to the egg problem above, but also an interesting system 
of equations which share some similarities as far as the numerical implementations and physics are concerned.

![diffusion_1D](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/fb9fbd15-00d6-49d3-91bc-fc8f45e42714)
![diffusion_2D](https://github.com/ianpaga/diffusion_heat_equations/assets/57350668/186529f7-85c4-4417-80ce-a8013d09b5f1)
