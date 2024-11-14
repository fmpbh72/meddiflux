#!/bin/bash

# Verifica a variável de ambiente ENVIRONMENT para definir a URL da API
if [ "$ENVIRONMENT" == "prod" ]; then
  export REACT_APP_API_URL=https://hom.projeto-aws.com.br
else
  export REACT_APP_API_URL=https://prod.projeto-aws.com.br
fi

# Exibe a URL para confirmação
echo "Usando a URL da API: $REACT_APP_API_URL"

# Instala as dependências e constrói o projeto
npm install --loglevel=error
REACT_APP_API_URL=$REACT_APP_API_URL SKIP_PREFLIGHT_CHECK=true npm run build --prefix client