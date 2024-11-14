#!/bin/bash

# Verifica o argumento passado para definir a URL da API
if [ "$1" == "prod" ]; then
export REACT_APP_API_URL=https://prod.projeto-aws.com.br 
elif [ "$1" == "hom" ]; then 
export REACT_APP_API_URL=https://hom.projeto-aws.com.br
fi

echo Construindo para o ambiente $ENVIRONMENT

# Instala as dependências e constrói o projeto
npm install --loglevel=error
NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client