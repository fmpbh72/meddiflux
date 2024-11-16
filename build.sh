#!/bin/bash

if [ $ENVIRONMENT == "prod" ]; then 
REACT_APP_API_URL=http://prodfmp.us-east-1.elasticbeanstalk.com
else
REACT_APP_API_URL=http://homfmp.us-east-1.elasticbeanstalk.com
fi

# Exibe a URL

echo "A URL para o ambiente $ENVIRONMENT é: $REACT_APP_API_URL"

# Instala as dependências e constrói o projeto

npm install --loglevel=error

NODE_OPTIONS=--openssl-legacy-provider REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client