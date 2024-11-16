#!/bin/bash

echo "Ambiente: $ENVIRONMENT"

if [ $ENVIRONMENT == "prod" ]; then 
export REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
else
export REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
fi

echo "Usando a URL da API: $REACT_APP_API_URL"

# Instala as dependências e constrói o projeto#
npm install --loglevel=error

NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client