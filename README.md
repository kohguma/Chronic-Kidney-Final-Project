# Chronic-Kidney-Final-Project

> Description of the dataset and variables

This dataset contains 400 observations with 25 different variable, including: age, blood pressure, specific gravity, albumin, sugar, red blood cells, pus cell, pus cell clumps, bacteria, blood glucose random, blood urea, serum creatinine, sodium, potassium, hemoglobin, packed cell volume, white blood cell count, red blood cell count, hypertension, diabetes mellitus, coronary artery disease, appetite, pedal edema, anemia, class. All were collected between a 2 month period.

| **Component**                | **Description**                                                                                             |
|-----------------------|-------------------------------------------------|
| `code/01_ckd_output1.R`      | Generates Table 1, Table 2, and a correlation heat map. Saves data as `.rds` files in the `output/` folder. |
| `code/02_render_report.R`    | Renders the `chronic_kidney_module5.Rmd` file into a report.                                                |
| `chronic_kidney_module5.Rmd` | Reads tables and graphs from `code/01_ckd_output1.R`. Creates two summary tables and one heat map.          |
| `Makefile`                   | Contains rules for generating the final report and its HTML version.                                        |
| `renv`                       | Directory containing all installed packages utilized in this project.                                       |
