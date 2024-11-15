## Cleaning data for 2018
TS18 <- read.xlsx("Owner Occupieds Liens Sold May 2018.xlsx")
Cer18 <- read.csv("bidbaltimore_certificate_sale_results_2018.csv")
AS18 <- read.csv("bidbaltimore_assignment_sale_results_2018.csv")
FBLS18 <- read.xlsx("2018 FBLNs.xlsx")
FBLS182 <- read.xlsx("owner occs receiving FBLNs in all 3 years 2016,2017 and 2018.xlsx", sheet=3)

FBLS189 <- read.xlsx("FBLNS_Owner Occupied_PROPERTIES_IN_BOTH_2018_AND_2019.xlsx")

table(Cer18$Removed)
table(Cer18$Removed.Because)
table(Cer18$Winning.Bidder, exclude = NA)
table(AS18$Winning.Bidder, exclude = NA)
