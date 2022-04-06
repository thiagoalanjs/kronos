<p align="center">
  <img width="200" height="200" src="https://user-images.githubusercontent.com/32438113/152666921-8b2fc7b9-dc52-4269-b6e3-00380c281c31.png">
</p>

# Sistema de gerenciamento de projetos

TCC de projeto de sistema de gerenciamento de projetos ágeis - Curso Pós-graduação em Engenharia de Software PUC MINAS VIRTUAL

## Aluno

- Thiago Alan de Jesus Silva

 <a href="https://www.linkedin.com/in/thiago-alan-65629465/" target="_blank"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a>

## Orientador(a)

- Eveline Alonso Veloso

## Documentação dos pontos de função

 <a href="https://github.com/thiagoalanjs/kronos/tree/main/function_points" target="_blank">Acesse o README</a>
 
## Vídeo explicando algumas funcionalidades do protótipo no FIGMA

Acesse o link do repositório abaixo para ver as telas de protótipos do figma: 

 <a href="https://github.com/thiagoalanjs/kronos/blob/main/presentation_tcc/README.md">Vídeo do protótipo</a>

## Tecnologias usadas

Aplicação criada usando a stack mesclando Ruby + JS 

![image](https://user-images.githubusercontent.com/32438113/152725798-6f003dc1-fc08-4ee7-b847-7c6a6f3faa0f.png)

## Instalação do Ruby no Windows & MAC

http://guides.railsgirls.com/guides-ptbr/install

## Instalação do Ruby no Ubuntu (utilização como base do projeto)

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

Criar o arquivo application.yml com a configurações locais para envio de email:

```bash

development:

  host:           'http://localhost:3000'
  user_name:      '<EMAIL>'
  password:       '<SENHA>'
  domain:         '<DOMAIN>'
  address:        '<SMPT>'
  port:           '<SMTP_PORT>'

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

## Aplicação em produção:

Acessar a URL http://agilekronos.online/
```bash
User - puc@mailinator.com
Pass - 12345678
```
## Resoluções

Abaixo alguns exemplos de comportamento de telas aleatórias da aplicação em resoluções diferentes:

Desktop padrão

![image](https://user-images.githubusercontent.com/32438113/161894891-3c46eb60-c65c-4b4b-a49f-3b764392ad6e.png)

![image](https://user-images.githubusercontent.com/32438113/161895428-a14542c1-b1ec-4673-a89e-edd6bd527647.png)

![image](https://user-images.githubusercontent.com/32438113/161895561-02646bf0-725a-46f8-afd7-28994cebf2ab.png)



Mobile

![image](https://user-images.githubusercontent.com/32438113/161894947-324fce33-6310-42e6-a271-44935f36f011.png) ![image](https://user-images.githubusercontent.com/32438113/161894987-b21008c3-79ac-4fa0-9c6d-a5afc44cd42c.png)


