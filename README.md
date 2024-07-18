# Cumbúquia

Este projeto é um exemplo de implementação de uma ferramenta de linha de comando em Elixir, que numera reis e rainhas de Cumbúquia conforme os nomes fornecidos pelo usuário.

## Pré-requisitos

Para executar este projeto, será necessário:

1. [Instalar o Elixir](https://elixir-lang.org/install.html) em versão igual ou superior a 1.17.
2. Com o Elixir instalado, você terá a ferramenta de build `mix`.

## Como Buildar o Projeto

Para buildar o projeto, siga os passos abaixo:

1. Clone o repositório ou copie o código para uma pasta local.
2. Navegue até a pasta do projeto.
3. Execute o comando:

```pwsh
mix escript.build
```

Isso irá gerar um binário com o mesmo nome do projeto na pasta. Executando o binário, sua CLI será executada.

## Executando a Ferramenta

Após buildar o projeto, você pode executar a ferramenta da seguinte forma:

```pwsh
./cumbuquia
```

## Funcionalidade

A ferramenta de linha de comando receberá uma lista dos reis e rainhas de Cumbúquia em ordem e retornará os mesmos nomes, cada um com sua devida numeração.

### Instruções de Uso

1. Ao iniciar o binário, ele exibirá uma breve explicação de seu uso.
2. A ferramenta então aguardará o usuário inserir uma lista de nomes.
3. Os nomes serão inseridos um por linha, e a lista será considerada terminada quando for lida uma linha em branco.
4. Após a lista ser finalizada, a ferramenta repetirá os nomes inseridos, porém, os nomes serão acrescidos de um número romano conforme necessário.

### Exemplos de Uso

#### Exemplo 1

Entrada:

```txt
Eduardo
Maria
Daniel
Eduardo
```

Saída:

```txt
Eduardo I
Maria I
Daniel I
Eduardo II
```

#### Exemplo 2

Entrada:

```txt
João
João
João
João
```

Saída:

```txt
João I
João II
João III
João IV
```

Ou seja, cada vez que um nome de um rei se repetir o algarismo romano que se segue ao nome deve ser incrementado em 1 desde o nome anterior.
