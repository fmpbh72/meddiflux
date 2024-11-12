FROM public.ecr.aws/docker/library/node:21-slim
RUN npm install -g npm@latest --loglevel=error

# Instalar o curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --loglevel=error
#Zebra
COPY . .

# Copie o script de construção para o contêiner
COPY build.sh .

# Dê permissão de execução ao script
RUN chmod +x build.sh

# Execute o script de construção
RUN ./build.sh $ENVIRONMENT  
# Usando a variável de ambiente

RUN npm install --loglevel=error

RUN REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client

RUN mv client/build build
RUN rm -rf client/*
RUN mv build client/

EXPOSE 8080

CMD ["npm", "start"]