file <- "asterophryinae_15partitions.nex.iqtree"
dirs <- grep("output", list.files(), value=T)

# Find one value:
file1 <- paste(dirs[1], file, sep="/")
dat <- readLines(file1)
dat[grepl("^Akaike", dat)]

files <- sapply(dirs, function(x) paste(x, file, sep="/"))
lines <- sapply( files, function(x) {
				        d <- readLines(x)
				        d[grepl("^Akaike", d)] 
				      }  
			       ) 
			       
vals <- gsub(".*?([0-9]+.[0-9]+).*", "\\1", lines)
runs <- names(vals)
aic <- as.numeric(vals)

dat <- data.frame( runs=runs, aic=aic)
dat <- dat[ order(dat$aic), ]

sink("trees_from_partitionfinder_models_aic.txt")

cat("AIC scores of trees from 20 runs after PartitionFinder and tree estimation:\n")
print(dat)
cat(paste("delta aic worst - best: ", round(max(dat$aic) - min(dat$aic))))
sink()
