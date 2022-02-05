
![image](https://user-images.githubusercontent.com/32438113/152626454-5b032cc6-05fa-4e2f-be1a-f3811da3f8cd.png)


# Agile Kronos

Sistema de gerenciamento de projetos ágeis.

## Instalação do Ruby

```bash
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
​
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
[Saída no terminal]

Your Gemfile lists the gem sqlite3 (>= 0) more than once.
You should probably keep only one of them.
Remove any duplicate entries and specify the gem only once.
While it's not a problem now, it could cause errors if you change the version of one of them later.
Using rake 13.0.6
Using concurrent-ruby 1.1.9
Using i18n 1.9.1
Using minitest 5.15.0
Using tzinfo 2.0.4
Using zeitwerk 2.5.4
Using activesupport 6.1.4.4
Using builder 3.2.4
Using erubi 1.10.0
Using racc 1.6.0
Using nokogiri 1.12.5 (x86_64-linux)
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.13.0
Using rails-html-sanitizer 1.4.2
Using actionview 6.1.4.4
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 6.1.4.4
Using nio4r 2.5.8
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.5
Using actioncable 6.1.4.4
Using globalid 1.0.0
Using activejob 6.1.4.4
Using activemodel 6.1.4.4
Using activerecord 6.1.4.4
Using marcel 1.0.2
Using mini_mime 1.1.2
Using activestorage 6.1.4.4
Using mail 2.7.1
Using actionmailbox 6.1.4.4
Using actionmailer 6.1.4.4
Using actiontext 6.1.4.4
Using net-ssh 6.1.0
Using net-scp 3.0.0
Using sshkit 1.21.2
Using airbrussh 1.4.0
Using execjs 2.8.1
Using autoprefixer-rails 10.4.2.0
Using bcrypt 3.1.16
Using popper_js 2.9.3
Using method_source 1.0.0
Using thor 1.2.1
Using railties 6.1.4.4
Using ffi 1.15.5
Using sassc 2.4.0
Using sprockets 4.0.2
Using sprockets-rails 3.4.2
Using tilt 2.0.10
Using sassc-rails 2.1.2
Using bootstrap 5.1.3
Using bundler 2.2.29
Using byebug 11.1.3
Using capistrano 3.16.0
Using capistrano-bundler 2.0.1
Using capistrano-passenger 0.2.1
Using capistrano-rails 1.6.1
Using capistrano-rbenv 2.2.0
Using chronic 0.10.2
Using coderay 1.1.3
Using coffee-script-source 1.12.2
Using coffee-script 2.4.1
Using coffee-rails 5.0.0
Using daemons 1.4.1
Using orm_adapter 0.5.0
Using responders 3.0.1
Using warden 1.2.9
Using devise 4.8.1
Using diff-lcs 1.5.0
Using eventmachine 1.2.7
Using faker 2.19.0
Using figaro 1.2.0
Using mini_magick 4.11.0
Using ruby-vips 2.1.4
Using image_processing 1.12.1
Using jbuilder 2.11.5
Using jquery-rails 4.4.0
Using json 1.8.6
Using kaminari-core 1.2.2
Using kaminari-actionview 1.2.2
Using kaminari-activerecord 1.2.2
Using kaminari 1.2.2
Using rails 6.1.4.4
Using kaminari-i18n 0.3.2
Using libv8 3.16.14.19 (x86_64-linux)
Using notifications 1.1.0
Using pry 0.13.1
Using pry-byebug 3.9.0
Using pundit 2.1.1
Using rails-i18n 7.0.1
Using rdoc 4.3.0
Using ref 2.0.0
Using rspec-support 3.9.4
Using rspec-core 3.9.3
Using rspec-expectations 3.9.4
Using rspec-mocks 3.9.1
Using rspec-rails 3.9.1
Using sass-rails 6.0.0
Using sdoc 0.4.2
Using spring 3.1.1
Using sqlite3 1.4.2
Using therubyracer 0.12.3
Using thin 1.8.1
Using tinymce-rails 5.10.2
Using turbolinks-source 5.2.0
Using turbolinks 5.2.1
Using uglifier 4.2.0
Using whenever 1.0.0
Bundle complete! 34 Gemfile dependencies, 109 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```
Criando a base dados, migração e populando tabelas e usuários
```bash
rails db:drop db:create db:migrate db:seed

Saída no terminal:

Dropped database 'db/development.sqlite3'
Dropped database 'db/test.sqlite3'
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
== 20210128133035 CreateFunctions: migrating ==================================
-- create_table(:functions, {})
   -> 0.0032s
== 20210128133035 CreateFunctions: migrated (0.0034s) =========================

== 20210128133036 CreateProjects: migrating ===================================
-- create_table(:projects, {})
   -> 0.0025s
== 20210128133036 CreateProjects: migrated (0.0026s) ==========================

== 20210128133038 CreateThemes: migrating =====================================
-- create_table(:themes, {})
   -> 0.0042s
== 20210128133038 CreateThemes: migrated (0.0043s) ============================

== 20210128133040 CreateReleases: migrating ===================================
-- create_table(:releases, {})
   -> 0.0025s
== 20210128133040 CreateReleases: migrated (0.0026s) ==========================

== 20210128133042 CreateSprints: migrating ====================================
-- create_table(:sprints, {})
   -> 0.0070s
== 20210128133042 CreateSprints: migrated (0.0121s) ===========================

== 20210128133044 CreateUserStories: migrating ================================
-- create_table(:user_stories, {})
   -> 0.0082s
== 20210128133044 CreateUserStories: migrated (0.0084s) =======================

== 20210128133047 CreateTasks: migrating ======================================
-- create_table(:tasks, {})
   -> 0.0099s
== 20210128133047 CreateTasks: migrated (0.0101s) =============================

== 20210128133051 DeviseCreateUsers: migrating ================================
-- create_table(:users, {})
   -> 0.0035s
-- add_index(:users, :email, {:unique=>true})
   -> 0.0011s
-- add_index(:users, :reset_password_token, {:unique=>true})
   -> 0.0012s
== 20210128133051 DeviseCreateUsers: migrated (0.0061s) =======================

== 20210128133055 CreateFunctionUserProjects: migrating =======================
-- create_table(:function_user_projects, {})
   -> 0.0129s
== 20210128133055 CreateFunctionUserProjects: migrated (0.0130s) ==============

== 20210128133846 AddTableUsersTasks: migrating ===============================
-- create_table(:tasks_users, {})
   -> 0.0046s
== 20210128133846 AddTableUsersTasks: migrated (0.0048s) ======================

== 20210523142142 CreateParticipants: migrating ===============================
-- create_table(:participants, {})
   -> 0.0053s
== 20210523142142 CreateParticipants: migrated (0.0187s) ======================

== 20210523213456 CreateUsersTasks: migrating =================================
-- create_table(:users_tasks, {})
   -> 0.0030s
== 20210523213456 CreateUsersTasks: migrated (0.0031s) ========================

== 20210525193105 CreateNotifications: migrating ==============================
-- create_table(:notifications, {})
   -> 0.0015s
-- add_index(:notifications, [:user_id, :notify_type])
   -> 0.0020s
-- add_index(:notifications, [:user_id])
   -> 0.0008s
== 20210525193105 CreateNotifications: migrated (0.0049s) =====================

== 20211020025041 CreateKinds: migrating ======================================
-- create_table(:kinds)
   -> 0.0020s
== 20211020025041 CreateKinds: migrated (0.0021s) =============================

== 20211023044239 CreatePriorities: migrating =================================
-- create_table(:priorities)
   -> 0.0018s
== 20211023044239 CreatePriorities: migrated (0.0026s) ========================

== 20211106231446 CreateActiveStorageTables: migrating ========================
-- create_table(:active_storage_blobs, {})
   -> 0.0030s
-- create_table(:active_storage_attachments, {})
   -> 0.0025s
-- create_table(:active_storage_variant_records, {})
   -> 0.0014s
== 20211106231446 CreateActiveStorageTables: migrated (0.0074s) ===============

== 20220114022257 CreateComments: migrating ===================================
-- create_table(:comments)
   -> 0.0072s
== 20220114022257 CreateComments: migrated (0.0075s) ==========================

creating administrator...
user: admin@email.com
pswd: admin
creating functions...
creating Kinds...
creating Priorities...
done!
``

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

https://user-images.githubusercontent.com/32438113/152627930-8f60045b-6308-44cc-b7d1-3360f2e12802.mp4

## Criando User Stories

## Criando tarefas

## Acessando board kanban








