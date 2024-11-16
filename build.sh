#!/bin/bash

#echo "Ambiente: $ENVIRONMENT"

#if [ $ENVIRONMENT == "prod" ]; then 
#export REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
#else
#export REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
#fi

# Verifica se o argumento foi passado
if [ -z "$1" ]; then
  echo "Uso: $1 "
  exit 1
fi

# Define a variável de ambiente
ENVIRONMENT=$1

# Define a URL com base no ambiente
if [ "$ENVIRONMENT" == "hom" ]; then
export REACT_APP_API_URL="http://homfmp.us-east-1.elasticbeanstalk.com"
elif [ "$ENVIRONMENT" == "prod" ]; then
export REACT_APP_API_URL="http://prodfmp.us-east-1.elasticbeanstalk.com"
else
  echo "Ambiente inválido. Use 'hom' ou 'prod'."
  exit 1
fi

# Exibe a URL
echo "A URL para o ambiente $ENVIRONMENT é: $REACT_APP_API_URL"

# Instala as dependências e constrói o projeto
npm install --loglevel=error

NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client