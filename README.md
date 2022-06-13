# MFOS

MFOS:-Evolutionary Approach to Construct Robust Codes for DNA-based Data Storage 

## What is MFOS?

MFOS proposes a computational evolutionary approach based on a synergistic **M**oth-**F**lame **O**ptimizer by levy flight and opposition-based learning mutation **S**trategies to optimize the following problems by constructing computational biology-based reverse-complement constraints:

- The existing evolutionary approaches for DNA sequences generated errors during the encoding process, which reduced the lower bounds of DNA coding sets utilized for molecular hybridization and thus decreased the number of DNA codes. 
- In addition, due to the disordered DNA strand, a secondary structure is formed, which is prone to errors during the decoding process. 

The improved MFOS algorithm goal is to achieve global optima solutions with robust convergence and balanced searching abilities to enhance the lower bounds and coding rates of DNA codes by overcoming the above problems. The improved heuristic algorithm is practiced to generate the optimized DNA codewords with GC-content, Hamming distance, no-runlength constraints, and it improved 12–28% lower bounds coding sets than the prior algorithms. Consequently, our approach's shorter sequences can help reduce errors during DNA synthesis and sequencing. Thus, storing a larger file in a shorter DNA sequence is feasible due to the improved lower bounds and coding rates of DNA coding sets. 

# Installation 

>Tools and environment 

- Install Anaconda from here https://www.anaconda.com/products/distribution, a leading platform powered by Python 
- Magma V2.25-3 full version from http://magma.maths.usyd.edu.au/magma/download/all/, a computational software
- MATLAB R2018b from https://www.mathworks.com/downloads/web_downloads/download_release?release=R2018b 


>Install the requirements or update the system accordingly or Run
```
pip3 install -r requirements.txt
```
1. Firstly, train the MFO algorithm (or any other) with both mutation strategies.
(the parameter and operators settings are given in the manuscript (currently under review))
2. MFOS is based on 19 benchmark functions. *Algorithms performances* folder contains the *Optimizer.py* file, in which all algorithms configuration is available by selecting the following operations with your requirements:
   - Select optimizer
   ```
    optimizer=["MFO","GWO"]
   ``` 
   - Select benchmark function 
   ```
    objectivefunc=["F5","F10"] 
   ``` 
   - Select the number of repetitions/runs
   ```
    NumOfRuns=30 
   ``` 
   - select other parameters and export results 
   ```
    params = {'PopulationSize' : 50, 'Iterations' : 500}
    export_flags = {'Export_avg':True, 'Export_details':True, 'Export_convergence':True, 'Export_boxplot':True}
   ``` 
3. The output will be received in *experiment_details.csv*, which can be summarized based on average and standard deviation metrics to assess the optimizer performance for each different function.
4. Based on functions' best performance with different magnitude and variances, Matlab codes are executed to analyze the qualitative performance with a 3D representation of search space and search history of each optimizer.
5. Convergence curves are received by using corresponding functions of 3D representation in Python codes. 

## Implementation of MFOS for DNA codes

1. After the MFOS assessments, train this algorithm in Magma software with GC-content, no-runlength, and Hamming distance DNA coding constraints for C<sup>GC, NL</sup>(*n,W,d*) constraints. The software will generate *.cod* files with all possible DNA codes. 
2. Similarly, run again the MFOS algorithm in Magma with GC-content, no-runlength, Hamming distance, and RC constraints for C<sup>GC, NL, RC</sup>(*n,W,d*) constraints.

   - The results received in *.cod* files have been summarized in Tables 6 and 7 of a manuscript (under review)).


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

# Citation

A related paper is under review...
