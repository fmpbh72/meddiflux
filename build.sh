#!/bin/bash

# Verifica o argumento passado para definir a URL da API
#if [ "$1" == "prod" ]; then
#    export REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
#else
#    export REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
#fi.

#if [ "$1" == "hom" ]; then 
#export REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
#elif [ "$1" == "prod" ]; then
#export REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
#fi

# Instala as dependências e constrói o projeto
npm install --loglevel=error

if [ "$1" == "prod" ]; then 
NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com SKIP_PREFLIGHT_CHECK=true npm run build --prefix client#export 
elif [ "$1" == "hom" ]; then
NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com SKIP_PREFLIGHT_CHECK=true npm run build --prefix client#export 
fi

echo "Usando a URL da API: $REACT_APP_API_URL"

echo "Ambiente: $ENVIROMENT"


#NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client