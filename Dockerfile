FROM rocker/rstudio 

#set working directory for all the content
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project
RUN mkdir code
RUN mkdir output
RUN mkdir data
COPY data data
COPY code code
COPY Makefile Makefile
COPY chronic_kidney_module5.Rmd chronic_kidney_module5.Rmd

#create an renv folder
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

#change the default location of the renv's cache 
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN apt-get update && apt-get install -y libxml2-dev
RUN apt-get update && apt-get install -y zlib1g-dev 


#run R 
RUN R -e "renv::restore()"

CMD ["sh", "-c", "make && mv chronic_kidney_module5.html final_report"]



