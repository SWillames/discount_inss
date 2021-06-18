# README

This README would normally document whatever steps are necessary to get the
application up and running.

Api em Ruby on Rails criada para a busca de cep. Essa aplicação utiliza o Postgresql como banco de dados, está dockerizada, caso a pessoa que irá instalar não tenha ruby on rails instalado em sua maquina.

Clone o repositório em sua máquina local: 
```bash
git clone git@github.com:SWillames/interview_api.git
cd backend-api
```
## Instalação
Faça a instalação do docker e docker-compose caso não tenha instalado em sua maquina.
**Usando Docker & docker-compose**

Construindo a image do projeto com o comando build:  
```bash 
docker-compose build
```
Execute a task para criar o usuario default da Aplicação:  
```bash 
docker-compose run --rm app bundle exec rails dev:setup
```

**Sem Docker** 
### Versão Utilizada
* Ruby 2.7.1
* Rails 5.2.0

para instalar as dependencias.
```bash 
bundle install
```

Crie e popule o banco com o usuario default da Aplicação:
```bash 
rails dev:setup
```

## Utilização

A aplicação utiliza o devise_token_auth, e em todas as requests precisam das seguintes informações nos headers:
``` bash
email: john.doe@example.com
password: 123456 
```

Para rodar a aplicação: 
**Com Docker**
```bash
docker-compose up
```

**Sem Docker**
```bash
rails s
```

## Rodando os testes
**Com Docker**
``` bash 
docker-compose run --rm app bundle exec rspec
```
**Sem Docker**
```bash
rails s
```
