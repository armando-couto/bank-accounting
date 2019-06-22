# Bank Accounting

### Desafio

Você deve criar um sistema que gerenciar contas bancárias de clientes, permitindo fazer transferências de um cliente para outro e expor o saldo atual da conta, sempre em reais.

### Requisitos
    
    Rails 5.2.3
    Ruby 2.5.1

### Setup

- git clone https://github.com/armando-couto/bank-accounting.git
- cd bank-accounting
- bundle install
- rake db:create db:migrate db:seed
- rails s

### Autenticação com JWT

O JWT é um meio de transmitir informações seguras.

| URL | MÉTODO | RETORNO |
| --- | ------ | ------- |


### Documantacao da API

    curl -X POST \
      http://localhost:3000/auth/login \
      -H 'Content-Type: application/json' \
      -d '{"email": "<EMAIL-GERADO>", "password": "123456"}'

