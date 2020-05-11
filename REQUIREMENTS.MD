# Teste de Dev Backend usando Ruby!

O objetivo deste teste Ã© avaliar a organizaÃ§Ã£o do seu cÃ³digo, e como vocÃª estrutura uma soluÃ§Ã£o simples e eficiente baseada em requisitos simples.

## Caso

O Delivery Center estÃ¡ em plena expansÃ£o de suas operaÃ§Ãµes pelo Brasil, com planos audaciosos de operar nas maiores capitais ainda em 2019.
Um dos passos dessa expansÃ£o Ã© ampliar a captaÃ§Ã£o de pedidos de diversos canais, sejam eles de `food`, `goods`, `FMCG`, `services`, entre outros.
O mais recente movimento para alcanÃ§ar este objetivo Ã© a integraÃ§Ã£o a um dos maiores marketplaces do paÃ­s. Esta integraÃ§Ã£o permitirÃ¡ captar pedidos dos nossos lojistas que operam neste canal
e operÃ¡-los em nossa estrutura logÃ­stica, entregando pedidos em `same hour / same day`.

Para viabilizar esta integraÃ§Ã£o, um dos passos importantes Ã© realizar o `parsing` dos dados que vÃªm da API deste canal para a nossa estrutura, garantindo que
a nossa operaÃ§Ã£o irÃ¡ receber de forma correta e clara as informaÃ§Ãµes necessÃ¡rias para entregar o pedido na casa do cliente, no endereÃ§o correto, para o cliente correto,
com clareza dos valores a serem pagos, formas de pagamento, entre outras informaÃ§Ãµes.

Vale ressaltar que sem as informaÃ§Ãµes corretas a operaÃ§Ã£o do Delivery Center pode ter prejuÃ­zos no envio, gerando custos extras de envio e insatisfaÃ§Ã£o do cliente.

## InformaÃ§Ãµes Complementares

O `JSON` a seguir representa um payload com dados fictÃ­cios de um pedido de compra de alguns produtos por um cliente.

- Utilizar a linguagem Ruby, mas pode escolher qualquer framework / libs (gems) que quiser para auxiliar no desenvolvimento, como, por exemplo: Rails, Sinatra, Padrino, etc. Se preferir, pode nÃ£o usar nenhum. Essa escolha nÃ£o irÃ¡ influenciar na avaliaÃ§Ã£o.
- Fazer um parse do **Payload** abaixo.
- Enviar para uma API REST (https://delivery-center-recruitment-ap.herokuapp.com/), no formato descrito no item **Processamento**, que farÃ¡ algumas validaÃ§Ãµes e retornarÃ¡ o resultado.
- Enviar com o Header 'X-Sent' com a data/hora atual no formato: 09h25 - 24/10/19.
- **(Opcional)** Registrar os dados do pedido em um banco de dados
  - Nesse caso vocÃª deve tambÃ©m incluir no seu cÃ³digo o schema do banco de dados (se utilizar Rails, o arquivo `schema.rb` Ã© suficiente).
- Deixar o cÃ³digo disponÃ­vel em algum repositÃ³rio pÃºblico (github, bitbucket, etc...)
- Enviar o link do repositÃ³rio para o e-mail **testes.tech@deliverycenter.com**

## Payload

```json
{
  "id": 9987071,
  "store_id": 282,
  "date_created": "2019-06-24T16:45:32.000-04:00",
  "date_closed": "2019-06-24T16:45:35.000-04:00",
  "last_updated": "2019-06-25T13:26:49.000-04:00",
  "total_amount": 49.9,
  "total_shipping": 5.14,
  "total_amount_with_shipping": 55.04,
  "paid_amount": 55.04,
  "expiration_date": "2019-07-22T16:45:35.000-04:00",
  "total_shipping": 5.14,
  "order_items": [
    {
      "item": {
        "id": "IT4801901403",
        "title": "Produto de Testes"
      },
      "quantity": 1,
      "unit_price": 49.9,
      "full_unit_price": 49.9
    }
  ],
  "payments": [
    {
      "id": 12312313,
      "order_id": 9987071,
      "payer_id": 414138,
      "installments": 1,
      "payment_type": "credit_card",
      "status": "paid",
      "transaction_amount": 49.9,
      "taxes_amount": 0,
      "shipping_cost": 5.14,
      "total_paid_amount": 55.04,
      "installment_amount": 55.04,
      "date_approved": "2019-06-24T16:45:35.000-04:00",
      "date_created": "2019-06-24T16:45:33.000-04:00"
    }
  ],
  "shipping": {
    "id": 43444211797,
    "shipment_type": "shipping",
    "date_created": "2019-06-24T16:45:33.000-04:00",
    "receiver_address": {
      "id": 1051695306,
      "address_line": "Rua Fake de Testes 3454",
      "street_name": "Rua Fake de Testes",
      "street_number": "3454",
      "comment": "teste",
      "zip_code": "85045020",
      "city": {
        "name": "Cidade de Testes"
      },
      "state": {
        "name": "SÃ£o Paulo"
      },
      "country": {
        "id": "BR",
        "name": "Brasil"
      },
      "neighborhood": {
        "id": null,
        "name": "Vila de Testes"
      },
      "latitude": -23.629037,
      "longitude": -46.712689,
      "receiver_phone": "41999999999"
    }
  },
  "status": "paid",
  "buyer": {
    "id": 136226073,
    "nickname": "JOHN DOE",
    "email": "john@doe.com",
    "phone": {
      "area_code": 41,
      "number": "999999999"
    },
    "first_name": "John",
    "last_name": "Doe",
    "billing_info": {
      "doc_type": "CPF",
      "doc_number": "09487965477"
    }
  }
}
```

## Processamento

Abaixo um exemplo do payload esperado, casando com os dados informados no payload acima.

- **Todos os campos sÃ£o obrigatÃ³rios**:
- Caso ocorra algum erro, os mesmos deverÃ£o ser tratados.
- NÃ£o Ã© necessÃ¡rio o desenvolvimento de uma interface grÃ¡fica.

```JSON
{
        "externalCode": "9987071",
        "storeId": 282,
        "subTotal": "49.90",
        "deliveryFee": "5.14",
        "total": "55.04",
        "country": "BR",
        "state": "SP",
        "city": "Cidade de Testes",
        "district": "Bairro Fake",
        "street": "Rua de Testes Fake",
        "complement": "galpao",
        "latitude": -23.629037,
        "longitude":  -46.712689,
        "dtOrderCreate": "2019-06-27T19:59:08.251Z",
        "postalCode": "85045020",
        "number": "0",
        "customer": {
            "externalCode": "136226073",
            "name": "JOHN DOE",
            "email": "john@doe.com",
            "contact": "41999999999",
        },
        "items": [
            {
                "externalCode": "IT4801901403",
                "name": "Produto de Testes",
                "price": 49.9,
                "quantity": 1,
                "total": 49.9,
                "subItems": []
            }
        ],
        "payments": [
            {
                "type": "CREDIT_CARD",
                "value": 55.04
            }
        ]
    }
```
