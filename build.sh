#!/bin/bash

# Verifica o argumento passado para definir a URL da API
if [ "$1" == "prod" ]; then
  export REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
else
  export REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
fi

# Instala as dependências e constrói o projeto
RUN npm install --loglevel=error
RUN REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client