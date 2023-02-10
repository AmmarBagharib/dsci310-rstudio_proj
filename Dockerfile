# pull the image
# docker build --platform linux/x86_64 --progress=plain --no-cache --tag dsci310-rstudio_proj -f Dockerfile .
# have to add in --platform due to m1 issues
FROM rocker/rstudio 

RUN whoami
RUN pwd
RUN ls -alh
# RUN Rscript -e "install.packages('cowsay', repos='http://cran.us.r-project.org')"
# RUN Rscript -e "install.packages('remotes', repos='http://cran.us.r-project.org')"


# run container in terminal
# docker run -p 8787:8787 -e PASSWORD=asdf dsci310-rstudio_proj

WORKDIR /Users/rstudio

COPY --chown=rstudio:rstudio renv.lock .
COPY --chown=rstudio:rstudio renv renv
COPY --chown=rstudio:rstudio .Rprofile .

RUN ls -alh

USER rstudio
RUN Rscript -e "renv::repair()"
USER root