here::i_am(
  "code/01_ckd_output.R"
)


#Load the packages needed
library(pacman)
pacman::p_load(rio, 
               dplyr, ggplot2, gtsummary, ggcorrplot)


#read the ckd data
ckd_data <- read.csv(
  file = here::here("data/chronic_kidney_disease_data.csv")
)

# Create summary table with gtsummary
characteristics_summary_kidney <- ckd_data %>%
  filter(target != "ckd\t") %>% #removing this extra ckd observation that was weirdly counted as its own unique observation; it only had 2 observations
  select( rbc, pc, pcc, ba, htn, dm, cad, appet, pe, ane, target) %>%  #filtering all the character variables
  rename(
    `Red Blood Cells` = rbc,
    `Pus Cell` = pc,
    `Pus Cell Clumps` = pcc,
    Bacteria = ba,
    Hypertension = htn,
    Diabetes = dm,
    `Coronary Artery Disease` = cad,
    Appetite = appet,
    `Pedal Edema` = pe,
    Anemia = ane,
    CKD = target
  ) %>% 
  tbl_summary(
    by = CKD,  
    missing = "no"  
  )


saveRDS(
  characteristics_summary_kidney,
  file = here::here("output", "characteristics_summary_kidney.rds")
)


# Numeric variables summary
numeric_summary<- ckd_data %>%
  filter(target != "ckd\t") %>%  #I removed this extra ckd observation that had only 2 observations
  select(age, bp, sg, bgr, bu, sc, sod, pot, hemo, pcv, wbcc, target) %>%
  rename(
    Age = age,
    `Blood Pressure (mm/Hg)` = bp,
    `Specific Gravity` = sg,
    `Blood Glucose Random (mgs/dl)` = bgr,
    `Blood Urea (mgs/dl)` = bu,
    `Serum Creatinine (mgs/dl)` =sc,
    `Sodium (mEq/L)` = sod,
    `Potassium (mEq/L)` = pot, 
    `Hemoglobin (gms)` = hemo,
    `Packed Cell Volume` = pcv,
    `White Blood Cell Count` = wbcc,
    CKD = target
  ) %>% 
  tbl_summary(
    by = CKD,
    missing = "no"
  )


saveRDS(
  numeric_summary,
  file = here::here("output", "numeric_summary.rds")
)


#graph:
#I'm going to make a matrix out of all the correlations
cor_kidney <- cor(ckd_data %>% select(age, bp, bgr, bu, sc, sod, pot, hemo, pcv, wbcc), use = "complete.obs")

#Then, I'm going to make a heatmap out of it.
ckd_plot_corr <- ggcorrplot(cor_kidney, 
           method = "circle",           # Circle method for visualization
           title = "Correlation Heatmap",  # Title
           lab = TRUE,                  # Show correlation coefficients
           lab_size = 3)   

saveRDS(
 ckd_plot_corr,
  file = here::here("output", "ckd_plot_corr.rds")
)
