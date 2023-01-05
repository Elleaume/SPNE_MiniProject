
# __Scientific programming for neuroeconomic experiments__   
### __Mini Project - January 2023__  
### __Camille Elleaume__

## Installation
 
This project requires the use of Psychtoolbox.

## Purpose of the experiment

The participants are presented with one grid linking symbols to single-digit integers and a second grid containing only the symbols. They are then asked to indicate the numbers attached to each of the symbols in the second grid using the first one as a key. This test is used in neuropsychology as it is sensitive to age, brain damage, dementia etc. [1]

## What to expect
The experiment is supposed to run as follows after some explanations given at the beginning of the experiment (press enter to move from one page to the next) :
- A reference table will be displayed at the top of the screen for the entire duration of the test containing the key code to use.
- A second table containing only the symbols is displayed below.  
- The participant must enter from left to right the numbers corresponding to the shapes using the first table.  
- When a table is completed it is replaced by another one re-shuffled.  
- The participant must complete as many tables as possible within a minute. 
- The scores are saved and store in the results folder.

## Usage

run the __main.m__ file in Matlab to lunch the experiment.

- You will be ask to first enter some information about the subject in the CommandWindow of Matlab.
- Then a Psychtoolbox window will appear.
- Let yourself be guided by the instructions.

## References

This test is supposed to mimic the symbol digit substitution experiment conducted in the UK BioBank and introduced in 2016 at the Imaging Clinics, on which I rely in my PhD work. 
More information about this test here : https://biobank.ndph.ox.ac.uk/ukb/refer.cgi?id=5021. 

 [[1]](#1).

## References
<a id="1">[1]</a> 
Hoyer William (2004). 
Adult Age and Digit Symbol Substitution Performance: A Meta-Analysis.
Psychology an aging.
