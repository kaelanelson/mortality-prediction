Mortality Prediction: Predicting United States Annual Mortality within the Medicaid Population

Steps for data gathering, feature engineering, and modeling:

Data Merging:
1. Merg_mortality.R
    a. Mortality files
        - medicare_2011_2016.csv
        - medicare_pop_2011_2016.csv
        
    b. Medicare hospitalizations (ICD 9/10 Codes)
        - medicare_hosp_admin_2011_2016.csv

Data Preprocessing:
1. aggregating_data.ipynb
    a. Aggregates medicare_2011_2016.csv on statcode, zip, and year
        - saved as medicare_aggregated_zip_2011_2016.csv
    b. Aggregates medicare_hosp_admin_2011_2016.csv data on zipcode level; converts ICD9/10 codes
        - saved as hosp_aggregated_zip_2011_2016.csv
    c. Aggregate/drop nan for monthly medicare data
        - saved as medicare_pop_aggregated_2011_2016.csv
2. Merge merdicare summary files and hospitalizations
    a. merge_med_summary_hosp.ipynb
        - merge by zipcode and year
        - saved as medicare_hosp_merged_zip_2011_2016.csv
3. Merge medicare_hosp_merged_zip_2011_2016.csv with environmental data
    a. merge_med_environmental_exposure.ipynb
        - created 4 year rolling average of temperature, humidity, pressure variables 
        - merged with medicare_hosp_merged_zip_2011_2016.csv
        - saved as merged_med_seasonal_2011_2016_v2.csv
4. Shift and aggregate
    a. shift_zip_and_split.ipynb
        - merged in population data from medicare beneficiary file
        - shift outcome by 1 year, so  that models will predict next year's death count 
        - Split into train and test: i.e. 2011-2015, and 2016
        - saved files as zip_train_v2.csv, zip_test_v2.csv
5. EDA / Pre-Analysis

Modeling:
1. Baseline regression models
2. Random Forest and Gradient Boosting
3. RNN and LSTM

