
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

### Exercise 1

* Open 'Stan-BernBeta-Script.R' and run the script for the first dataset. 
* Examine the plot of diagnostic measures. Are your chains representative of the posterior? 
* Run the model for the second dataset and compare with the previous estimate. Do these estimated posteriors correspond to what you would expect analytically?  
* Run the model for the first dataset again, this time changing the number of iterations to 50. What changes do you notice in your diagnostic measures? 

### Exercise 2

* Modify 'Stan-BernBeta-Script.R' to include a Beta prior on the Omega parameter of your beta distribution (see graphical model on the slide) and run the the model again. Note the reparametrization on Beta in which we write the shape parameters Alpha and Beta in terms of the mode Omega and concentration K. The higher K is, the more concentrated the draws will be around Omega. 
* Using our Michael Jordan analogy, what does this model correspond to? 

### Exercise 3




### Other resources 

http://mc-stan.org/tutorials.html