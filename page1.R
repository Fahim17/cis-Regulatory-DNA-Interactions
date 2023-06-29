# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")


# BiocManager::install(c("Gviz", "GenomicRanges", "rtracklayer"))

# install.packages("devtools")
# devtools::install_github("cole-trapnell-lab/cicero-release", ref = "monocle3")

# library(cicero)


# Code to download (54M) and unzip the file - can take a couple minutes
data_path = 'D:\\Research_2\\Cicero\\kidney_data.txt.gz'
# depending on internet connection:
temp <- textConnection(readLines(data_path))

# read in the data
cicero_data <- read.table(temp)

input_cds <- make_atac_cds(cicero_data, binarize = TRUE)

input_cds

set.seed(2017)
input_cds <- detect_genes(input_cds)
input_cds <- estimate_size_factors(input_cds)
input_cds <- preprocess_cds(input_cds, method = "LSI")
input_cds <- reduce_dimension(input_cds, reduction_method = 'UMAP', preprocess_method = "LSI")

plot_cells(input_cds)

umap_coords <- reducedDims(input_cds)$UMAP
cicero_cds <- make_cicero_cds(input_cds, reduced_coordinates = umap_coords)

data("mouse.mm9.genome")
# use only a small part of the genome for speed
sample_genome <- subset(mouse.mm9.genome, V1 == "chr2")
sample_genome$V2[1] <- 10000000

## Usually use the whole mouse.mm9.genome ##
## Usually run with sample_num = 100 ##
conns <- run_cicero(cicero_cds, sample_genome, sample_num = 2) 
head(conns)

