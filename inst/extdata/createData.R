# CREATE SAMPLE DATA FILES FOR THE PACKAGE

setwd('~/github/biodavidjm/artMS/')

# GENERATE RANDOM FILE
artms_data_randomDF <- data.frame(replicate(10, sample(0:1, 100, rep = TRUE)))
save(artms_data_randomDF, file = 'data/artms_data_randomDF.RData', 
     compress = 'xz')


#-------------------------------------------------------------------------------
## CREATE THE OFFICIAL PHGLOBAL COMING WITH THE PACKAGE
setwd("~/sourcecode/artms/ph/")

evidence_file <- 'evidence.txt'
keys_file <- 'keys.txt'
contrast_file <- 'contrast.txt'

edf <- read.delim(evidence_file,
                  stringsAsFactors = FALSE,
                  check.names = FALSE)

kdf <- read.delim(keys_file,
                  stringsAsFactors = FALSE,
                  check.names = FALSE)


# Select 2 biological replicates
selectedBR <- c("qx006145", "qx006148", "qx006151", "qx006152")
edfnew <- edf[which(edf$`Raw file` %in% selectedBR), ]
kdfnew <- kdf[which(kdf$RawFile %in% selectedBR),]

# And random sampling lines
n <- round(dim(edfnew)[1] / 9)
edfnew2 <- edfnew[sample(nrow(edfnew), n),]

# print out evidence & keys
write.table(
  edfnew2,
  file = "~/sourcecode/artms/ph/artms_data_ph_evidence.txt",
  quote = FALSE,
  sep = "\t",
  row.names = FALSE,
  col.names = TRUE
)
write.table(
  kdfnew,
  file = "~/sourcecode/artms/ph/artms_data_ph_keys.txt",
  quote = FALSE,
  sep = "\t",
  row.names = FALSE,
  col.names = TRUE
)

#-------------------------------------------------------------------------------
# Reduced version of an Evidence file (generated below)
artms_data_ph_evidence <- read.delim("~/sourcecode/artms/ph/artms_data_ph_evidence.txt",
                                     stringsAsFactors = FALSE)
save(artms_data_ph_evidence, file = '~/github/biodavidjm/artMS/data/artms_data_ph_evidence.RData', 
     compress = 'xz')

# Reduced version of the Keys file (experimental design)
artms_data_ph_keys <- read.delim("~/sourcecode/artms/extdata/artms_data_ph_keys.txt",
                                 stringsAsFactors = FALSE)
  
save(artms_data_ph_keys, file = 'data/artms_data_ph_keys.RData', 
     compress = 'xz')

# Reduced version of the results
artms_data_ph_msstats_results <- read.delim("~/sourcecode/artms/extdata/artms_data_ph_msstats_results.txt",
                                            stringsAsFactors = FALSE)
  
save(artms_data_ph_msstats_results,
     file = 'data/artms_data_ph_msstats_results.RData',
     compress = 'xz')

artms_data_ph_proteinGroups <-
  read.delim("~/sourcecode/artms/ph/proteinGroups.txt",
             stringsAsFactors = FALSE)
save(artms_data_ph_proteinGroups,
     file = 'data/artms_data_ph_proteinGroups.RData',
     compress = 'xz')

# CORUM dataset
artms_data_corum_mito_database <- read.delim("inst/extdata/20170801_corum_mitoT.txt", 
                                             stringsAsFactors = FALSE)
  
save(artms_data_corum_mito_database,
     file = 'data/artms_data_corum_mito_database.RData',
     compress = 'xz')


# CONFIGURATION FILE

# library(yaml)
artms_config <- yaml.load_file("inst/extdata/artms_config.yaml")
save(artms_config, file = 'data/artms_config.RData', compress = 'xz')

# PATHOGENS

message("--- PATHOGEN IN SAMPLES: TB\n")
artms_data_pathogen_TB <- read.delim('~/Box Sync/db/uniprot/uniprot-tr-myctb_tuberculosis_ATCC35801_TMC10-onlyEntryID.fasta',
                                     header = FALSE,
                                     sep = "\t",
                                     quote = "",
                                     stringsAsFactors = FALSE) # pathogen.ids$Entry, "TB",
  
names(artms_data_pathogen_TB) <- c('Entry')
save(artms_data_pathogen_TB, 
     file = '~/github/biodavidjm/artMS/data/artms_data_pathogen_TB.RData', 
     compress = 'xz')

message("--- PATHOGEN IN SAMPLES: LEGIONELLA PNEUMOPHILA")
artms_data_pathogen_LPN <-
  read.delim(
    '~/Box Sync/db/uniprot/uniprot-legionella-proteome_UP000000609.txt',
    header = TRUE,
    sep = "\t",
    quote = "",
    stringsAsFactors = FALSE
  ) # pathogen.ids$Entry, "Lpn",
artms_data_pathogen_LPN <- artms_data_pathogen_LPN[c('Entry')]

save(artms_data_pathogen_LPN,
     file = '~/github/biodavidjm/artMS/data/artms_data_pathogen_LPN.RData',
     compress = 'xz')


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# VIGNETTES

artmsQualityControlEvidenceBasic(evidence_file = artms_data_ph_evidence,
                                 keys_file = artms_data_ph_keys,
                                 prot_exp = "PH")







