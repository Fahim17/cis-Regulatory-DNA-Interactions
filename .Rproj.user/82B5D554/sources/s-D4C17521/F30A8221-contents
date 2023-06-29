chia_conns <-  data.frame(Peak1 = c("chr2_3005100_3005200", "chr2_3004400_3004600", 
                                    "chr2_3004900_3005100"), 
                          Peak2 = c("chr2_3006400_3006600", "chr2_3006400_3006600", 
                                    "chr2_3035100_3035200"))
head(chia_conns)

#                  Peak1                Peak2
# 1 chr2_3005100_3005200 chr2_3006400_3006600
# 2 chr2_3004400_3004600 chr2_3006400_3006600
# 3 chr2_3004900_3005100 chr2_3035100_3035200

conns$in_chia <- compare_connections(conns, chia_conns)

head(conns)

conns$in_chia_100 <- compare_connections(conns, chia_conns, maxgap=100)

head(conns)

chia_conns <-  data.frame(Peak1 = c("chr2_3005100_3005200", "chr2_3004400_3004600", 
                                    "chr2_3004900_3005100"), 
                          Peak2 = c("chr2_3006400_3006600", "chr2_3006400_3006600", 
                                    "chr2_3035100_3035200"),
                          coaccess = c(1, 1, 1))

plot_connections(conns, "chr2", 3004000, 3040000, 
                 gene_model = gene_anno, 
                 coaccess_cutoff = 0,
                 connection_width = .5,
                 comparison_track = chia_conns,
                 comparison_connection_width = .5,
                 nclude_axis_track = FALSE,
                 collapseTranscripts = "longest") 
