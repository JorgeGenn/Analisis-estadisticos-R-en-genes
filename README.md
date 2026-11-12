# Statistical Analysis of Gene Expression Data in R

[![Language](https://img.shields.io/badge/Language-R%20(Bioconductor)-blue)](#)
[![Method](https://img.shields.io/badge/Method-Transcriptomics%20%26%20Clinical-orange)](#)
[![Context](https://img.shields.io/badge/Context-UNIR%20Master's%20Project-green)](#)

## 📌 Overview
This repository contains a reproducible computational pipeline for the statistical analysis of transcriptomic and clinical datasets, developed as a technical biostatistics project for the Master's in Bioinformatics at UNIR.

The workflow focuses on a first-principles approach, rigorously evaluating empirical statistical distribution assumptions prior to test selection, and applying predictive modeling and dimensionality reduction to extract significant biological features from high-dimensional genomic data.

## 🛠️ Tech Stack & Methodology
- **Statistical Framework:** Empirical evaluation of data distributions and **Multivariate Logistic Regression** to correlate clinical variables with the expression matrix.
- **Data Preprocessing:** Exploratory Data Analysis (EDA) using **Principal Component Analysis (PCA)** to assess sample variance and underlying dataset structure.
- **Data Visualization:** High-quality scientific plotting integrated directly into the compiled interactive report.
- **Reproducible Environment:** 
  - Scripting and narrative via **RMarkdown** in an **RStudio** environment.
  - Dependency management via `renv` utilizing **Posit Package Manager** for stable binary packages.
  - System-level isolation using **Docker** running an **Ubuntu Linux** base image to handle system libraries and command-line toolchains.

## 📁 Project Files & Deliverables
- **`AnalisisgenR.html`**: The primary reference file. This is a self-contained, interactive HTML report rendered from RMarkdown (using Pandoc and jQuery). It compiles all source code, statistical outputs, and graphical visualizations of the entire pipeline.
- **`AnalisisgenR.Rmd`**: The source code containing the raw R scripts and markdown narrative.
- **`data/`**: Directory containing raw expression counts and clinical metadata.

## 📊 Key Results
- **Non-Parametric Validation:** Empirical data distribution assessments demonstrated a lack of normality, validating a strict non-parametric statistical framework (Median and Interquartile Range) for descriptive analyses.
- **Pathological vs. Pharmacological Drivers:** Tumor extension, rather than pharmacological intervention, is the primary biological factor driving the drastic downregulation of *AQ_actb*, *AQ_gapdh*, and *AQ_b2m*. The identical collapse of expression toward basal levels in both drug and placebo groups indicates significant therapeutic resistance driven by natural pathological progression.
- **Age-Independent Global Transcriptome:** The overall tumor gene expression profile remains remarkably stable and independent of chronological age (28 out of 30 analyzed genes showed $p > 0.05$). Statistically significant age-linked variations are strictly isolated to specific tumor suppression and apoptotic pathways (*AQ_pten*, $p = 0.02$; *AQ_casp3*, $p < 0.01$).
---
**Author**: Jorge Hurtado Soriano  
**Date**: September 11, 2026


## 🚀 How to Run & Reproduce

### Option 1: Local R Environment

Clone this repository:

   ```bash

git clone https://github.com/JorgeGenn/Anlisis-estadisticos-R-en-genes.git


1. Open the project in RStudio and restore dependencies:

  R. renv::restore()

2. Render the RMarkdown report:

  rmarkdown::render("AnalisisgenR.Rmd")
```
### Option 2: Docker Container 

```bash
git clone https://github.com/JorgeGenn/Anlisis-estadisticos-R-en-genes.git

1. Build the Docker image:

  sudo docker build -t biostats-unir .

2. Run the container and access RStudio Server at http://localhost:8787:

   sudo docker run -d -p 8787:8787 --name analisis_genes -e PASSWORD=docker biostats-unir

   Password: docker
   name: analisis_genes

```
