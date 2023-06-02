FROM r-base

LABEL maintainer="LarissaBrito <larissabritobiologia@gmail.com>"

# Atualizar e instalar dependências do sistema
RUN apt-get update \
    && apt-get install -y \
        libssl-dev \
        libcurl4-openssl-dev \
        libxml2-dev

# Instalar dependências do R
RUN R -e "install.packages(c('methods', 'igraph', 'snow', 'ape', 'data.table', 'BiocManager','geneplast.data.string.v91','tidyr'))"

# Instalar o pacote GenePlast do Bioconductor
RUN R -e "BiocManager::install('geneplast')"

# Definir diretório de trabalho
WORKDIR /diretorio
