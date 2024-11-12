#!/bin/bash

# Verifica o argumento passado para definir a URL da API

URL=http://prodfmp.us-east-1.elasticbeanstalk.com

if [ "EVENTO" == "homfmp" ]; then
  export URL=http://homfmp.us-east-1.elasticbeanstalk.com
fi

# Instala as dependências e constrói o projeto
npm install --loglevel=error
- echo "$URL"
REACT_APP_API_URL=$URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client