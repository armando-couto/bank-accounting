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
| /api/v1/auth | POST | Retorno JSON |

Exemplo com curl:
```sh
curl -X POST \
  http://localhost:3000/api/v1/auth \
  -H 'Content-Type: application/json' \
  -d '{"email": "<EMAIL-GERADO>", "password": "123456"}'
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

Nesse método você pode consultar o saldo usando o **id** ou **number**. 

| URL | MÉTODO | RETORNO |
| --- | ------ | ------- |
| /api/v1/balance | POST | Retorno JSON |

Exemplo com curl:
```sh
curl -X POST \
  http://localhost:3000/api/v1/balance \
  -H 'Authorization: <TOKEN-GERADO-PELO-JWT>' \
  -H 'Content-Type: application/json' \
  -d '{"id": <ID-GERADO>}'
```

```sh
curl -X POST \
  http://localhost:3000/api/v1/balance \
  -H 'Authorization: <TOKEN-GERADO-PELO-JWT>' \
  -H 'Content-Type: application/json' \
  -d '{"number": <NUMBER-CONTA-GERADO>}'
```

Exemplo de retorno de json:
```json
{
    "balance": "2205.9256"
}
```