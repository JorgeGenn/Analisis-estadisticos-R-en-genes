# 1. Use the official RStudio base image on Ubuntu (Linux)
FROM rocker/rstudio:4.4.1

# 2. Install system dependencies required for bioinformatics libraries
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 3. Create and set the working directory inside the container
WORKDIR /home/rstudio/proyecto_transcriptomica

# 4. Copy environment files first to leverage Docker layer caching
COPY renv.lock .
COPY .Rprofile .
COPY renv/activate.R renv/

# 5. Restore R libraries (Will download Posit Package Manager binaries)
RUN Rscript -e "install.packages('renv', repos = 'https://cloud.r-project.org'); renv::restore(prompt = FALSE)"

# 6. Copy the rest of the code and data (.Rmd, HTML, data/ directory)
COPY . .

# 7. Grant permissions to the RStudio user
RUN chown -R rstudio:rstudio /home/rstudio/proyecto_transcriptomica

# 8. Expose the default RStudio Server port
EXPOSE 8787