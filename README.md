# Flutter_Web_Api

 Este projeto é fruto do curso de 'Flutter com WebAPI: integrando sua aplicação' da plataforma ALURA


  ## Introdução

  Foi reaproveitado um projeto criado na primeira implementação, que focava na integração entre o aplicativo e o banco de dados e cuja única funcionalidade era uma lista de contatos. 

   Adição de novas features/funcionalidades, que são:

- Alteração de "lista de contatos" para "Transfer" no qual é possível fazer transferências para os contatos

- Inclusão de "Transaction Feed", no qual são listadas as transferências a partir das informações armazenadas na Web API
 
- Reutilização do comportamento de feature dentro de um novo widget onde foi implementada a técnica do callback no clique. 
 
- Comunicação com a Web API, com o auxílio do pacote http do Dart. 

obs: subimos a Web API onde foram testadas as requisições com o navegador e o Postman 


Tambem, como o intuito de se ter feedback das chamadas, foi utilizado um interceptador do HTTP (http_interceptor, outro pacote do Dart).  

Tambem foi utilizada a conversão direta dentro do próprio modelo utilizando os conversores fromJson(), toJson()

Em relação ao HTTP, foi visto que é possível configurar a requisição de modo a atender as necessidades, seja com o GET para buscar informações, seja com o POST para enviarmos dados (headers, body, e assim por diante).

Foram simualdos alguns problemas comuns na comunicação externa, como se ter o endereço errado, uma Web API indisponível, entre outras situações.

Nas lista de transferências, foi utilizado o FutureBuilder para tornarmos as informações mais atraentes ao usuário. Por exemplo, incluímos um timeout que entra em ação quando o endereço errado é acessado, encerrando a busca e indicando ao usuário que não existe nenhum dado a ser exibido.

  ## Apresentação do projeto

 ![servidor web api](info/bb_transact_server.gif)
 

 ## Configurações do Ambiente

- Instalação do Flutter: Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Siga as instruções na documentação oficial do Flutter.

- Instalação das dependências: No diretório raiz do projeto, execute o comando flutter pub get para instalar as dependências necessárias, como http, http_interceptor, entre outras.


- Configuração da Web API: trata-se de um servidor Spring Boot que atua como uma API. Para simular o ambiente de API:

   - Escolha uma pasta no seu sistema e coloque o arquivo server.jar nela.
   - Abra o Prompt de Comando (ou Terminal no macOS/Linux).
   - Navegue até a pasta onde está o server.jar.
   - Execute o seguinte comando:

``` 

> java -jar server.jar --host 192.168.0.64

```
 
Isso configurará o servidor para rodar na rede local, usando o endereço IP especificado. Nota: Certifique-se de que o endereço IP é o da sua máquina local.



 <img src="info/servidor%20local.png" alt="local servidor web api" width="300"/>

 
 ### Tópicos abordados no curso

- Integração com Web API: Como integrar uma aplicação Flutter com uma Web API utilizando o pacote http.

- Gerenciamento de estado: Uso de FutureBuilder para lidar com chamadas assíncronas e apresentar resultados de forma dinâmica e atraente.
- Manipulação de erros: Simulação e tratamento de erros comuns em requisições HTTP, como endpoints incorretos ou APIs indisponíveis.
- Interceptação de requisições HTTP: Utilização de http_interceptor para adicionar logs e manipular requisições/respostas HTTP.
- Serialização e desserialização de dados: Implementação dos métodos fromJson() e toJson() para converter dados entre modelos Dart e JSON.
- Timeout e feedback visual: Implementação de timeout em requisições e utilização de feedback visual para melhorar a experiência do usuário em casos de erro.

  ### Funcionalidades estudadas no projeto

- Lista de Contatos: A funcionalidade de listar contatos foi adaptada para permitir a - realização de transferências financeiras para os contatos.
- Transferências e Transações: Implementação da funcionalidade de transferências, com exibição de um feed de transações realizadas.
- Comunicação com Web API: Uso de métodos GET e POST para buscar e enviar dados para uma Web API, incluindo configuração de cabeçalhos e corpo da requisição.
- Interceptador HTTP: Implementação de interceptadores para adicionar tratamento adicional às requisições e respostas HTTP.
- Tratamento de Erros e Timeouts: Inclusão de mecanismos de tratamento de erros e timeouts nas requisições, com feedback visual para o usuário.
- Interface Amigável: Utilização de FutureBuilder para garantir que as informações sejam carregadas de forma eficiente e informativa, melhorando a experiência do usuário.


