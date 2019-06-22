# Bank Accounting

### Setup
    
    bundle install
    rake db:create db:migrate db:seed
    rails s

### Documantacao da API

    curl -X POST \
      http://localhost:3000/auth/login \
      -H 'Content-Type: application/json' \
      -d '{"email": "<EMAIL-GERADO>", "password": "123456"}'

