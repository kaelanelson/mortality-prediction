devtools::install_github("NSAPH/NSAPHutils", force=TRUE)

library(NSAPHutils)
library(fst)
library(data.table)

f <- list.files("/nfs/nsaph_ci3/ci3_health_data/medicare/mortality/1999_2016/wu/cache_data/merged_by_year_v2",
                pattern = "\\.fst",
                full.names = TRUE)
metadata_fst(f[[1]])

# determine variables to keep 
myvars <- c("zip", "year","qid","sex","race","age","statecode",
"latitude","longitude","dual","death",'dead', "pm25_ensemble","pm25_nn",
"ozone","zcta","poverty","popdensity","medianhousevalue",
"pct_blk", "medhouseholdincome","pct_owner_occ","hispanic","education", 
"smoke_rate","mean_bmi","tmmx","rmax","pr")

#exd <- rbindlist(lapply(f,
#                        read_fst,
#                        columns = myvars,
#                        as.data.table=TRUE))

file<- "c"
dir <- "/nfs/nsaph_ci3/ci3_health_data/medicare/mortality/1999_2016/wu/cache_data/merged_by_year_v2/"
X <- read_data(dir, years=2011:2017, columns=myvars)
names(X)
# full mortality 2010-2011
write.csv(X,"/nfs/nsaph_ci3/ci3_analysis/mortality_prediction/medicare_2011_2016.csv")

#### monthly medicare denominator file
f <- list.files("/nfs/nsaph_ci3/ci3_health_data/medicare/mortality/1999_2016/by_zip_monthly/data",
                pattern = "\\.fst",
                full.names = TRUE)
metadata_fst(f[[1]])

myvars <- c("zip", "statecode", "year", "month","m_count","f_count","mean_age",
            "white_count","black_count","hispanic_count","asian_count","native_count",
            "deaths","population")

file<- "c"
dir <- "/nfs/nsaph_ci3/ci3_health_data/medicare/mortality/1999_2016/by_zip_monthly/data/"
X <- read_data(dir, years=2011:2017, columns=myvars)
names(X)medicare_deaths_monthly_2011_2016.csv
dim(X)
sum(is.na(X))
summary(X)
write.csv(X,"/nfs/nsaph_ci3/ci3_analysis/mortality_prediction/medicare_deaths_monthly_2011_2016.csv")


#### hospital admissions files ###
f2 <- list.files("/nfs/nsaph_ci3/ci3_health_data/medicare/gen_admission/1999_2016/targeted_conditions/cache_data/admissions_by_year", 
                 pattern = "\\.fst", full.names = TRUE)

metadata_fst(f2[[1]])

# determine variables to keep 
myvars2 <- c("QID","ADM_TYPE","ADATE","ICU_DAY","CCI_DAY","DIAG1","DIAG2",
  "DIAG3","YEAR","LOS","Parkinson_pdx2dx_25","Alzheimer_pdx2dx_25", 
  "Dementia_pdx2dx_25","CHF_pdx2dx_25","AMI_pdx2dx_25","COPD_pdx2dx_25", 
  "DM_pdx2dx_25","Stroke_pdx2dx_25","CVD_pdx2dx_25","CSD_pdx2dx_25", 
  "Ischemic_stroke_pdx2dx_25","Hemo_Stroke_pdx2dx_25","zipcode_R")

exd2 <- rbindlist(lapply(f2,
                        read_fst,
                        columns = myvars2,
                        as.data.table=TRUE))

file2<- "c"
dir2 <- "/nfs/nsaph_ci3/ci3_health_data/medicare/gen_admission/1999_2016/targeted_conditions/cache_data/admissions_by_year"
X3 <- read_data(dir2, years=2011:2017, columns=myvars2)
#X4 <- read_data(dir, years=2014:2016, columns=myvars)
dim(X3)
# full mortality 2010-2011
write.csv(X3,"/nfs/nsaph_ci3/ci3_analysis/mortality_prediction/medicare_hosp_admin_2011_2016.csv")
#write.csv(X2,"/nfs/nsaph_ci3/ci3_analysis/mortality_prediction/medicare_hosp_admin_2014_2016.csv")



