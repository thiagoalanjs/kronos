

![image](https://user-images.githubusercontent.com/32438113/152629100-f6a2ce34-0923-4fae-a68e-028f433a38dd.png)
![image](https://user-images.githubusercontent.com/32438113/152626454-5b032cc6-05fa-4e2f-be1a-f3811da3f8cd.png)


# Agile Kronos

TCC de projeto de Sistema de gerenciamento de projetos ágeis - Curso Engenharia de Software PUC MINAS EAD

Aplicação criada usando a stack do Ruby

![image](https://user-images.githubusercontent.com/32438113/152666643-2d3a1bc8-d32c-40e2-9bb5-2e288a56a263.png)


## Instalação do Ruby no Windows & MAC

http://guides.railsgirls.com/guides-ptbr/install

## Instalação do Ruby no Ubuntu

```bash
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libf
```
Instalação da versão do projeto via RVM
```bash
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.5.8
$ ruby -v
ruby 2.5.8p224 (2020-03-31 revision 67882) [x86_64-linux]
```

Instalação do bundle

```bash
gem install bundler
```

Instalando o Ruby On Rails

```bash
Rails 6.1.4.4
```

Configuração do git

Vamos usar o Git para nosso sistema de controle de versão, então vamos configurá-lo de acordo com nossa conta Github. Se você ainda não tem uma conta no Github, certifique-se de se registrar.

1 – Rode no console substituindo o “YOUR NAME” pelo seu nome e o “YOUR@EMAIL.com” pelo seu e-mail do GitHub.

```bash
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

```

2 – A próxima etapa é pegar a chave SSH recém-gerada e adicioná-la à sua conta do Github. Você deve copiar e colar a saída do comando a seguir neste link.

```bash
cat ~/.ssh/id_rsa.pub
```

3 – Depois de fazer isso verifique seu deu certo rodando:

```bash
ssh -T git@github.com
```

4 – Você deve receber uma mensagem semelhante a essa

```bash
Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.
```

Clonar o projeto do Agile Kronos

```bash
git clone https://github.com/thiagoalanjs/kronos.git
```

Instalando as dependencias via bundle
```bash
bundle install

$ bundle
```

Criando a base dados, migração e populando tabelas e usuários
```bash
rails db:drop db:create db:migrate db:seed
```

Startando o servidor

```bash
$ rails s


=> Booting Thin
=> Rails 6.1.4.4 application starting in development http://localhost:3000
=> Run `bin/rails server --help` for more startup options
2022-02-04 22:53:53 -0300 Thin web server (v1.8.1 codename Infinite Smoothie)
2022-02-04 22:53:53 -0300 Maximum connections set to 1024
2022-02-04 22:53:53 -0300 Listening on localhost:3000, CTRL+C to stop

```

Acessando a aplicação https://localhost:3000

![image](https://user-images.githubusercontent.com/32438113/152626433-80fa93c1-42fe-4d71-946f-dca9742a0dfc.png)


Autenticação com dados abaixo
```bash
User - admin@email.com
Pass - admin

```

## Criando Projetos

https://user-images.githubusercontent.com/32438113/152626975-d8de95b6-855d-4bb4-a67e-1ec756469693.mp4

## Criando Usuários 

https://user-images.githubusercontent.com/32438113/152627737-7c7871c9-526f-4239-abb7-a2fbb2b5b8d6.mp4

## Criando Sprints

https://user-images.githubusercontent.com/32438113/152627930-8f60045b-6308-44cc-b7d1-3360f2e12802.mp4```bash

## Criando User Stories

https://user-images.githubusercontent.com/32438113/152628252-db7429da-bd8f-4a33-9430-f942f2f3a968.mp4


## Criando tarefas

https://user-images.githubusercontent.com/32438113/152628384-1b358640-7b6d-4b97-9495-e7354878c2e2.mp4


## Acessando board kanban

https://user-images.githubusercontent.com/32438113/152628613-85f44e44-0f59-48c7-ba72-4549ea7a6c0a.mp4







