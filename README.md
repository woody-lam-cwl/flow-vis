# Flow Visualisation ExA - CFD

In creating geometry from _deltagen_, the simulation name provided will store all generated files in a separate path, e.g. _./results/<simulation_name>_.

When creating new simulations, make sure the new simulation name is different from any existing dataset. The same literal content in different casings is considered the same name on git so it should be avoided.

## Getting started

The Fortran files may be updated anytime. When you pull for the latest master, always rebuild the Fortran file with `make`.

To configure new simulation, run `./deltagen` and follow the prompts.

To run simulation, run `./tblock < ./results/<simulation_name>/delta-tblock.dat`

All results can be found under directory _./results/<simulation_name>_.

## TODOs

Feel free to add new TODOs here for any features to improve simulation pipeline.

*TODO: Create workflow to configure new simulation in a single command line prompt*

*TODO: Implement script for sweeping parameters in simulation*

*TODO: Graph convergence of simulation*

*TODO: Implement convergence detection and auto-stop*
