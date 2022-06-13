# MFOS

MFOS:-Evolutionary Approach to Construct Robust Codes for DNA-based Data Storage 

## What is MFOS?

MFOS proposes a computational evolutionary approach based on a synergistic **M**oth-**F**lame **O**ptimizer by levy flight and opposition-based learning mutation **S**trategies to optimize the following problems by constructing computational biology-based reverse-complement constraints:

- The existing evolutionary approaches for DNA sequences generated errors during the encoding process which reduced the lower bounds of DNA coding sets utilized for molecular hybridization and thus decreased the number of DNA codes. 
- In addition, due to the disordered DNA strand, a secondary structure is formed, which is prone to errors during the decoding process. 

The improved MFOS algorithm goal is to achieve global optima solutions with robust convergence and balanced searching abilities to enhance the lower bounds and coding rates of DNA codes by overcoming the above problems. The improved heuristic algorithm is practiced to generate the optimized DNA codewords with GC-content, Hamming distance, no-runlength constraints, and it improved 12–28% lower bounds coding sets than the prior algorithms. Consequently, our approach's shorter sequences can help reduce errors during DNA synthesis and sequencing. Thus, storing a larger file in a shorter DNA sequence is feasible due to the improved lower bounds and coding rates of DNA coding sets. 

# Installation 

Tools and envirnoment 

- Install Anaconda from here https://www.anaconda.com/products/distribution, a leading platform powered by Python 
- Magma V2.25-3 full version from http://magma.maths.usyd.edu.au/magma/download/all/, a computational software
- MATLAB R2018b from https://www.mathworks.com/downloads/web_downloads/download_release?release=R2018b, 


Install the requirements or update system accordingly or Run
```
pip3 install -r requirements.txt
```
1. Firstly train the MFO algorithm with both mutation strategies.
(the parameter and operators settings are given in the manuscript (currently underreview))
2. MFOS is based on 19 benchmark functions 



## Requirements

- NumPy
- SciPy
- sklearn
- pandas
- matplotlib
- fcmaes
- python 3.xx 
- math
- random 
