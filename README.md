# api develop basic structure (for future projects)

### Observaçes

#### ESTRUTURA
 - Há duas APPS no modelo django, contendo um banco de dados diferente em cada uma
 - O app chamado 'api' faz todas as regras de negócio especificadas
 - O app chamado 'data' faz a autenticaço de login e as regras relacionadas ao banco de dados de senhas e tokens
 - Todas as URLs disponíveis podem ser encontradas em apitech/apitech/urls.py

#### AUTENTICAÇÃO
 - Checar os comentários do arquivo data/views.py para melhor entendimento do processo de token
    O usuário utiliza-se de um token recebido para gerar uma combinaço de cookie+communication token
    A cada nova requisição esses dois são verificados, caso estejam incorretos ou tenha estourado o timeout, o usuário é deslogado do sistema (removendo a combinação do banco de dados)
    
#### BANCO DE DADOS
 - A comunicação com o banco foi feita exclusivamente pela interface do próprio Django. Isso pode ser observado em apitech/settings, no qual os dois bancos, usuários e senhas foram especificados.
 - Para o ambiente de testes, foram usadas duas máquinas apier para simular as duas aplicações (api e data) com os ips 172.17.0.2 e 172.17.0.3 respectivamente
 - Para popular o banco de dados com transações aleatórias foi usado o script db_populate.py, que gera um número 'n' de transações fictícias
 - Após popular o banco, fiz um dump.sql para poder recriar o mesmo ambiente na máquina de testes. Esse arquivo dump criado encontra-se em api_mysql.sql
  

### TODO (ideias que tive durante o processo, mas não implementei)

- Criação de uma coluna last_login_device na tabela Pessoa, no qual cadastra-se qual o user-agent do último equipamento acessado pelo cliente. Assim, assegura-se que o cliente usará somente um aparelho conhecido e cadastrado para comunicação com api
- Transaçes de entrada e saída. A organização pode ser feita por transações de entrada e saída, limitando assim o fluxo de cada conta, ajudaria tambem a poupar o processamento na busca dos dados.
- Protocolos GET utilizados: Pela limitação de usar o curl junto com a verificação CSRF do django, resolvi fazer a grande maioria por HTTP GET, porém, fiz o teste de SQLInjection usando SQLMap justamente para isso. Demonstrando que mesmo utilizando GET, não há manipulação de parâmetros da URL para extração de nenhum dado em nenhuma aplicação.
- Implementação correta do decorator que fará a validação de cookie e timout antes de cada request da views do app 'api'. Quando um usuário faz uma requisição, ela passa primeiro pela regra de negócio informada pelo decorator, que valida seu cookie+token_comunicação.
- ROLLBACK: Em toda transação que altera o banco de dados, fazer um rollback caso tenha alguma excessão. Garantindo a integridade do banco e mantendo o procedimento como um bloco só, não permitindo que apenas metade do trecho do código seja executada.


## EXEMPLOS DE USO
Criação de uma conta:
```
curl -X GET "localhost:8000/v1/conta/create/ID_PESSOA/"
```

Depósito em uma conta:
```
curl -X GET "localhost:8000/v1/transacoes/deposito/ID_CONTA/?v=VALOR_DEPOSITO&s=TIPO_MOEDA"
```

Consulta de saldo:
```
curl -X GET "localhost:8000/v1/conta/info_saldo/ID_CONTA/"
```

Saque em uma conta:
```
curl -X GET "localhost:8000/v1/transacoes/saque/ID_CONTA/?v=VALOR_SAQUE&s=TIPO_MOEDA"
```

Bloqueio de uma conta:
```
curl -X GET "localhost:8000/v1/conta/block/ID_CONTA/
```

Desbloqueio de uma conta:
```
curl -X GET "localhost:8000/v1/conta/unblock/ID_CONTA/
```

Extrato de transações de uma conta:
```
curl -X GET "localhost:8000/v1/transacoes/extrato/ID_CONTA/
```

Extrato de transações de uma conta por período:
```
curl -X GET "localhost:8000/v1/transacoes/extrato/ID_CONTA/?begin=EPOCH_INICIO&end=EPOCH_FIM"
curl -X GET "localhost:8000/v1/transacoes/extrato/4324/?begin=1546359924&end=1577809574"
```




