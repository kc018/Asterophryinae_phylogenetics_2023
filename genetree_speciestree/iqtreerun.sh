# check if directory out exists, if not, make it
if [ ! -d "$out" ]; then 
	mkdir out
  fi


## Species Trees ##

# infer tree partitioned by locus and codon (modelfinder)
#iqtree2 -s input/asterophryinae_20230305.phy -p input/asterophryinae_locicodon.nex -m TEST --prefix out/locicodon -B 1000 

# infer tree partitioned by locus and codon with merging (partitionfinder) 
#iqtree2 -s input/asterophryinae_20230305.phy -p input/asterophryinae_locicodon.nex -m TEST+MERGE -rcluster 10 --prefix out/locicodon.merge -B 1000

# infer tree paritioned by locus (modelfinder)  
#iqtree2 -s input/asterophryinae_20230305.phy -p input/asterophryinae_loci.nex -m TEST --prefix out/locispecies -B 1000 

## Gene Trees ##

# infer single-locus trees  
iqtree2 -s input/asterophryinae_20230305.phy -S input/asterophryinae_loci.nex -m TEST --prefix out/loci -B 1000 -redo

# infer nuclear vs mitochodrial trees  
iqtree2 -s input/asterophryinae_20230305.phy -S input/nuc_mito.nex -m TEST --prefix out/nucmito -B 1000 

## Concordance factors ## 

# locus by codon, modelfinder species tree vs. single-locus trees 
iqtree2 -t out/locicodon.treefile --gcf out/loci.treefile -s input/asterophryinae_20230305.phy --scf 100 --prefix out/concord -redo

# locus modelfinder species tree vs. single-locus trees 
iqtree2 -t out/locispecies.treefile --gcf out/loci.treefile -s input/asterophryinae_20230305.phy --scf 100 --prefix out/concordlocus -redo

# locus by codon, modelfinder species tree vs. nuclear and mitochondrial trees 
iqtree2 -t out/locicodon.treefile --gcf out/nucmito.treefile -s input/asterophryinae_20230305.phy --scf 100 --prefix out/concord_nucmito
