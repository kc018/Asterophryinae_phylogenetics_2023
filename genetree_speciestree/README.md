# README.md

This directory contains analyses that explore gene tree species tree conflict. 

Several variants of species tree are generated, and compared against single-locus trees through the calculation of concordance factors.

__Gene concordance factors__: describe how many loci are in agreement with the species tree toplogy vs. alternative topologies.

__Site concordance factors__: describe how many sites are in agreement with the species tree toplogy vs. alternative topologies.

It turns out that the single loci are too short to provide any GCF information for the deeper nodes, so species trees were also compared agains nuclear and mitochondrial trees. 

# Inputs are in the Input directory:

-  asterophryinae_20230305.phy  :  DNA alignment
-  asterophryinae_locicodon.nex :  Partitions by locus and codon
-  asterophryinae_loci.nex :       Partitions by locus
-  nuc_mito.nex :                  Partitions by nuclear vs. mitochondrial
-  asterophryinae_dates :          Date file 

# Outputs are in the out directory, with prefix indicating analysis:

# Prefix: Species trees:

1.  locicodon: Species tree partitioned by locus and codon, with best model found by Modelfinder

2.  locicodon.merge: Same as 1 but best model found by Partitionfinder, with merging of partitions.

3.  locispecies: Species tree partitioned by locus, with best model found by Modelfinder for each locus.

# Prefix: Gene trees:

4.  loci: Separate trees for each locus

5.  nucmito: Separate trees for nuclear (SIA+BDNF+NXC1) and mitochondrial (CYTB+ND4) genes.

# Prefix: Concordance calculations:

6. concord: Best species tree (1. locidocon) vs. gene trees (4. loci)

7. concordlocus: Locus-species tree (3. locispecies) vs. gene trees (4. loci)

8. concord_nucmito: Best species tree (1. locicodon) vs. nuclear and mitochondrial trees (5. nucmito)