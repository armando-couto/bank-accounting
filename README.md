# Bank Accounting

[![Build Status](https://travis-ci.org/armando-couto/bank-accounting.svg?branch=master)](https://travis-ci.org/armando-couto/bank-accounting)

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
| /api/v1/auth | POST | Retorno JSON |

Exemplo com curl:
```sh
curl -X POST \
  http://localhost:3000/api/v1/auth \
  -H 'Content-Type: application/json' \
  -d '{"email": "armando@empresa.com.br", "password": "123456"}'
```

Exemplo de retorno de json:
```json
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE1NjEyOTY3MjB9.JzmIozEt56ASNeLwwiEJhcMhAmidBX-V5xDDSW7SIzI",
    "exp": "06-23-2019 10:32",
    "name": "Carmelia Blanda"
}
```
      
### Consultando o Saldo da Conta

Nesse método você pode consultar o saldo usando o **id**. 

| URL | MÉTODO | RETORNO |
| --- | ------ | ------- |
| /api/v1/balance/:id | GET | Retorno JSON |

Exemplo com curl:
```sh
curl -X GET \
  http://localhost:3000/api/v1/balance/<ID-GERADO> \
  -H 'Authorization: <TOKEN-GERADO-PELO-JWT>'
```

Exemplo de retorno de json:
```json
{
    "balance": "2205.9256"
}
```
      
### Transação entre Contas 

Nesse método você pode realizar transferências entre contas com os parâmetros **origin_account_id**, **destination_account_id** e **amount**. 

| URL | MÉTODO | RETORNO |
| --- | ------ | ------- |
| /api/v1/transference | POST | Retorno JSON |

Exemplo com curl:
```sh
curl -X GET \
  curl -X POST \
    http://localhost:3000/api/v1/transference \
    -H 'Content-Type: application/json' \
    -H 'Authorization: <TOKEN-GERADO-PELO-JWT>'
    -d '{"origin_account_id": "<ID-CONTA-ORIGEM>", "destination_account_id": "<ID-CONTA-DESTINO>", "amount": "<VALOR>"}'
```

Exemplo de retorno de json:
```json
{
    "message": "Transfer completed successfully."
}
```

Exemplo de retorno de erro com conta de origem não existente:
```json
{
    "error": "Origin account not exist."
}
```

Exemplo de retorno de erro com conta de destino não existente:
```json
{
    "error": "Destination account not exist."
}
```

Exemplo de retorno de erro com valor menor que 0:
```json
{
    "error": "Amount must be greater than 0."
}
```

Exemplo de retorno de erro com o limite inferior para transação:
```json
{
    "error": "Account has not limit, limit disponible: <VALOR-QUE-VARIA>>."
}
```