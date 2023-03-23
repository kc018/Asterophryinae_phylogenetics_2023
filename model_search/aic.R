dir <- "output_100reps"
outfile <- "best_model_partitionfinder_aic.txt"

summaryaic <- function( dir, outfile) {
	files <- list.files(path=dir)                          # get list of filenames from the directory
	files <- grep("nex.iqtree", files, value=T)  # get files ending in nex.iqtree
	files <- paste(dir, files, sep="/")                # paste the path to the filename
	
	lines <- sapply( files, function(x) {            # for each file 		
					        d <- readLines(x)             # read the lines 
					        d[grepl("^Akaike", d)]       # select lines that start with Akaike 
					      }                                         # lines is a vector lines that start with Akaike
				       ) 
				       
	vals <- gsub(".*?([0-9]+.[0-9]+).*", "\\1", lines)    # for each line, extract the decimal number. 
	runs <- names(vals)                                           # the names hold the run number
	aic <- as.numeric(vals)                                      # coerce to numeric, save as aic
	
	dat <- data.frame( runs=runs, aic=aic)     # make a dataframe from run name and aic score
	dat <- dat[ order(dat$aic), ]                      # sort by aic score

    return(dat)
}


aic1 <- summaryaic(dir="output_100reps", outfile="AIC_partifionfinder_100runs.txt" )
aic2 <- summaryaic(dir="output_nomerge_100reps", outfile="AIC_modelselection_nomerge_100runs.txt" )

aic <- rbind(aic1, aic2)                              # combine the merge and no merge results
aic <- aic[ order(aic$aic), ]	                     # sort by aic score

sink(outfile)                                              # start writing to the output file
	cat("AIC scores of trees from 100 runs after PartitionFinder and tree estimation:\n")
	print(aic)
	cat(paste("delta aic worst - best: ", round(max(aic$aic) - min(aic$aic))))
sink()
