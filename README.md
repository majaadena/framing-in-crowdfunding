[![DOI](https://zenodo.org/badge/487780427.svg)](https://zenodo.org/badge/latestdoi/487780427)

# framing-in-crowdfunding
Voluntary ‘donations’ versus reward-oriented ‘contributions’: Two experiments on framing in funding mechanisms

# DESCRIPTION OF FILES

The analysis of the data was done with Stata Version 16.1. 
  
The folder Replication Files contains the following folders:

### Data

This folder contains anonymized data from the MTurk experiment:
- mturk_data.dta

Due to data protection rules, the main dataset from the field experiment is not included.
Only one dataset with semi-aggregated data is included in order to replicate Figure 2:
- figure2.dta

### Dofiles

This folder contains the codes to replicate tables and graphs from the paper in separate Stata dofiles.

All dofiles in this folder are listet in:
- 0_main.do 
In 0_main.do the dofiles for the field experiment are commented out since the referenced datatset could not be included.

In order to run the dofiles for the MTurk experiment the following packages must be installed:
- ritest
- radar

```
ssc install ritest
ssc install radar
```

### MTurk programm files
This folder contains the program to run the limesurvey that was used to collect data in the MTurk experiment.

### Output 

Results will be stored in this folder. This folder also includes an Excel file with anonymized data to replicate Figure 3.
