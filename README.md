# Scripts and notebook for analysis of IES nucleosome densities

This repository contains the code for Wang et al. 2022, "A small RNA guided PRC2 complex eliminates DNA as an extreme form of transposon silencing".

Dependencies: awk, hisat2, samtools, bedtools, Jupyter

* `IES_coverage_MAC_DNA.sh` - obtains counts of DNA-seq reads mapped to IESs.
* `IES_coverage_nucleosome_profiling.sh` - obtains counts of DNase-seq reads mapped to IESs.
* `nucleosome_profiling_density_analysis.ipynb` - Jupyter notebook to analyze results from the above scripts.



