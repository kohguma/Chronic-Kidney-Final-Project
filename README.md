# Chronic-Kidney-Final-Project

> Description of the dataset and variables

This dataset contains 400 observations with 25 different variable, including: age, blood pressure, specific gravity, albumin, sugar, red blood cells, pus cell, pus cell clumps, bacteria, blood glucose random, blood urea, serum creatinine, sodium, potassium, hemoglobin, packed cell volume, white blood cell count, red blood cell count, hypertension, diabetes mellitus, coronary artery disease, appetite, pedal edema, anemia, class. All were collected between a 2 month period.

|                                                                                                                      |
|:-----------------------------------------------------------------------|
| \## Initial code description                                                                                         |
| `code/01_ckd_output1.R`                                                                                              |
| \- generates table 1, table 2, and correlation heat map - saves numbers as a `.rds` object in `output/` folder       |
| `code/02_render_report.R`                                                                                            |
| \- renders `chronic_kidney_module5.Rmd`                                                                              |
| `chronic_kidney_module5.Rmd`                                                                                         |
| \- reads all the tables and graphs generated by `code/01_ckd_output1.R` - makes two summary tables and one heat map. |
