
## Quick intro to RStan
Niv Lab - August 2015

### Installation 

The installation process is OS & version specific, but the main ingredients you will need are: 

* R >= 3.0.2
* RStudio 
* A suitable C++ compiler (on Mac it usually comes with Apple XCode)
* RStan itself 

Here are the starting points for: 

* Mac OSX: https://github.com/stan-dev/rstan/wiki/RStan-Mac-OS-X-Prerequisite-Installation-Instructions
* Windows: https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started — read the overview and then scroll down and follow the link to install Rtools 

If everything was installed correctly, you should be able to run the '8schools_checkpoint.R' script, which will run the sampling algorithm and produce a pretty plot of your posterior (don't worry about model specifics at this point -- this is just to check that everything works).

### Example 1

a. Open 'Stan-BernBeta-Script.R' and run the script for the first dataset. 
b. Examine the plot of diagnostic measures. Are your chains representative of the posterior? 
c. Run the model for the second dataset and compare with the previous estimate. Do these estimated posteriors correspond to what you would expect analytically?  
d. Run the model for the first dataset again, this time changing the number of iterations to 50. What changes do you notice in your diagnostic measures? 

### Example 2




### Other resources 

http://mc-stan.org/tutorials.html