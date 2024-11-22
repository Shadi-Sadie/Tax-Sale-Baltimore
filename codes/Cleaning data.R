# read data
library(readxl)
#install.packages("openxlsx")
library(openxlsx)
library(dplyr)

feature<-read.table("features.txt", header = FALSE)

com

FBLS20<- 
FBLS18 <- read.xlsx("2018 FBLNs.xlsx")
FBLS16 <- read.xlsx("owner occs receiving FBLNs in all 3 years 2016,2017 and 2018.xlsx", sheet=1)
FBLS17 <- read.xlsx("owner occs receiving FBLNs in all 3 years 2016,2017 and 2018.xlsx", sheet=2)
FBLS182 <- read.xlsx("owner occs receiving FBLNs in all 3 years 2016,2017 and 2018.xlsx", sheet=3)

FBLS189 <- read.xlsx("FBLNS_Owner Occupied_PROPERTIES_IN_BOTH_2018_AND_2019.xlsx")


TS18 <- read.xlsx("Owner Occupieds Liens Sold May 2018.xlsx")
TS19 <- read_excel("2019 tax sale results.xls")
TS182 <- read.csv("bidbaltimore_certificate_sale_results_2018.csv")
TS183 <- read.csv("bidbaltimore_assignment_sale_results_2018.csv")

Data <- read.csv("data/Tax_Lien_Certificate_Sale_Properties.csv")
table(All$TAX_SALE_YEAR)
dat <- read.xlsx("tax_sale_advertised_2021-04-06.xlsx")

load(file="advertised_properties_2021_sf.rda")

#dfs <- list(FBLS24, FBLS23, FBLS22, FBLS21, FBLS19, FBLS18)
#all(sapply(dfs, names) == names(FBLS24))


#colnames_list <- lapply(dfs, names)
#unique_colnames <- unique(unlist(colnames_list))
#col_diff <- sapply(dfs, function(df) setdiff(unique_colnames, names(df)))
#col_diff

#colnames_list
#sum(is.na(FBLS24$LOT))


### Merging 2024 data into one file  ###

# read data 
FBLS24 <- read.xlsx("2024 FBLNs 2-6-24.xlsx").
TS24 <- read.xlsx("2024 Tax Sale Auction Results - FINAL.xlsx")

  # creating key identification variable based on block and lot
    
    FBLS24$key <- paste0(FBLS24$BLOCK,FBLS24$LOT)
    FBLS24$key <- gsub( " ", "", FBLS24$key)

    TS24$key <-paste0(TS24$BLOCK, TS24$LOT)
    TS24$key <- gsub( " ", "", TS24$key)
  # create a dummy variable in FBLS  for houses that ended up in tax sale based on tax sale dataset
    
    FBLS24$For_Sale_in_TaxSale <- FBLS24$key %in% TS24$key
    table(FBLS24$For_Sale_in_TaxSale) # Check if they numbers match the observation
    TS24 <- TS24 %>%  select ("LOT-SIZE" ,"CERT-NUM" , "TOTAL-LIENS",   "AMT-BID", "BALANCE",   "TAXBASE", "BIDDER-TYPE" ,"BIDDER-NUM" ,
                               "BIDDER-NAME"  ,    "BIDDER-ADDR",
                              "BIDDER-CITY"  ,    "BIDDER-STATE",
                              "BIDDER-ZIP-CODE",  "BIDDER-PHONE",
                              "VH-FLAG"      ,    "OCC-FLAG",
                              "RP-ZONE"       ,   "RP-DEED-DATE",
                               "RP-COUN-DIST" ,    "key")
   # now merge the dataset 
    D24 <- merge(FBLS24, TS24, by = "key", all.x = TRUE)
   # create a year variable
    D24$YEAR<- 2024
   # remove un merged data set 
    rm(FBLS24,TS24)
    
### Merging 2023 data into one file  ###

# read data 
    
  FBLS23 <- read.xlsx("all FBLN properties 2023.xlsx")
  TS23 <- read.xlsx("2023 Tax Sale Results-with bidder information.xlsx")
    
  # creating key identification variable based on block and lot
  
    FBLS23$key <- paste0(FBLS23$BLOCK,FBLS23$LOT)
    FBLS23$key <- gsub( " ", "", FBLS23$key)
    
        ## in TS23 the format of Block 00 in the begining dropped needed to be fixed
    library(stringr)
    TS23$BLOCK <- str_pad(TS23$BLOCK, width = 4, side = "left", pad = "0")
    TS23$LOT <- str_pad(TS23$LOT, width = 3, side = "left", pad = "0")
    TS23$key <-paste0(TS23$BLOCK, TS23$LOT)
    
  # create a dummy variable in FBLS  for houses that ended up in tax sale based on tax sale dataset
    FBLS23$For_Sale_in_TaxSale <- FBLS23$key %in% TS23$key
    table(FBLS23$For_Sale_in_TaxSale) 
    
    
    
    #TS23 <- TS23 %>%     
        #rename( BALANCE = Balance  ) %>%
     #   select ("LOT-SIZE", "CERT-NUM" , "TOTAL-LIENS",   "AMT-BID", "BALANCE",   "TAXBASE", "BIDDER-TYPE" ,"BIDDER-NUM" ,
                       #       "BIDDER-NAME"  ,    "BIDDER-ADDR",
                      #        "BIDDER-CITY"  ,    "BIDDER-STATE",
                        #      "BIDDER-ZIP-CODE",  "BIDDER-PHONE",
                        #      "VH-FLAG"      ,    "OCC-FLAG",
                         #     "RP-ZONE"       ,   "RP-DEED-DATE",
                         #     "RP-COUN-DIST" ,    "key")
    # now merge the dataset 
    D23 <- merge(FBLS23, TS23, by = "key", all.x = TRUE)
    # create a year variable
    D23$YEAR<- 2023
    # remove un merged data set 
    rm(FBLS23,TS23)
    
### Merge 2022 data data into one file  ###
    
# read data 
    
FBLS22 <- read.xlsx("2022 TheRecord-20220519.xlsx")
TS22 <- read.xlsx("2022 Tax Sale Results.xlsx")
    
D24<- read.csv("data/D24.csv")
  # creating key identification variable based on block and lot
    FBLS22$key <- paste0(FBLS22$Block,FBLS22$Lot)
    FBLS22$key <- gsub( " ", "", FBLS22$key)
    
    TS22$key <-paste0(TS22$BLOCK, TS22$LOT)
    TS22$key <- gsub( " ", "", TS22$key)
  # create a dummy variable in FBLS  for houses that ended up in tax sale based on tax sale dataset
    FBLS22$For_Sale_in_TaxSale <- FBLS22$key %in% TS22$key
    table(FBLS22$For_Sale_in_TaxSale )
    
  # now merge the dataset 
    D22 <- merge(FBLS22, TS22, by = "key", all.x = TRUE)
  # create a year variable
    D22$YEAR<- 2022
    
  # remove un merged data set 
    rm(FBLS22,TS22)
    
### Merge 2021  data into one file  ###

# read data 
  FBLS21 <- read.xlsx("tax_sale_advertised_2021-03-15.xlsx")
  TS21 <- read.csv("2021_Tax_Sale_List_(With_Exempted_Properties).csv")
    
  # creating key identification variable based on block and lot
  
    FBLS21$key <- paste0(FBLS21$Block,FBLS21$Lot)
    FBLS21$key <- gsub( " ", "", FBLS21$key)
    
    TS21 <- TS21 %>% rename(key = pin) # identification already exist just need to be renamed
    
 # create a dummy variable in FBLS  for houses that ended up in tax sale based on tax sale dataset
    
    FBLS21$For_Sale_in_TaxSale <- FBLS21$key %in% TS21$key
    table(FBLS21$For_Sale_in_TaxSale)
 # now merge the dataset 
    
    D21 <- merge(FBLS21, TS21, by = "key", all.x = TRUE)
    
 # year variable already exist 
 # remove un merged data set 
    rm(FBLS21,TS21)
    
### Merge 2020 data 
    
    
    
    
    
## Check if the 18 and 19 in FBLS files are different?
##     
    FBLS19$key <- paste0(FBLS19$BLOCK,FBLS19$LOT)
    FBLS19$key <- gsub( " ", "", FBLS19$key)
    
     ## numbering in 189 file is different needs to be fixed
    #library(stringr)
    FBLS189$BLOCK <- str_pad(FBLS189$BLOCK, width = 4, side = "left", pad = "0")
    FBLS189$LOT <- str_pad(FBLS189$LOT, width = 3, side = "left", pad = "0")
    FBLS189$key <- paste0(FBLS189$BLOCK,FBLS189$LOT)

    FBLS189$exists_in_19 <- FBLS189$key %in% FBLS19$key
    
    table(FBLS189$exists_in_19)
## Check if the 18 and 18.2 are the same almost or not
## 
    FBLS18$key <- paste0(FBLS18$Block,FBLS18$Lot)
    FBLS18$key <- gsub( " ", "", FBLS18$key)
    
    
    FBLS182$key <- paste0(FBLS182$BLOCK,FBLS182$LOT)
    FBLS182$key <- gsub( " ", "", FBLS182$key)
    
    FBLS18$exists_in_18 <- FBLS18$key %in% FBLS182$key
    
    table(FBLS18$exists_in_1)
    
    
    colnames(FBLS23)
    colnames(D24)
    table(FBLS189$OCCUPIED.IND)
    colnames(FBLS19)
    table(FBLS18$Owner.Occ)
    
    rm(list=ls())
    
    ASSESSED.VALUE
    VACANT.LOT
    NEIGHBORHOOD
    table(D24$NEIGHBORHOOD)
    length(unique(D24$NEIGHBORHOOD))
    length(unique(NBH$Name))
    
    any(is.na(df))
    
    df[!complete.cases(df), ]
    
    sum(is.na(df))
    
    