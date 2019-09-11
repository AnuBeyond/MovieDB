<!-- ![](app/assets/images/logo.png) -->

# PASTEUR README

## System Dependencies

**ruby 2.6.0**

**rails 5.2.3**

**PostgreSQL 11.2.1**

## Configurations

Below configurations will guide you to have a running version of this project in your local Environment for testing and further development.

### Cloning the Repository

```
git clone https://github.com/AnuBeyond/MovieDB.git
```

### Install dependencies

```
bundle install
```

### Set Environment Variables

```
EDITOR=vim rails credentials:edit
```

```
development:
  postgres:
   username: ''
   password: ''


production:
  aws:
   access_key_id: ''
   secret_access_key: ''
   region: ''
   bucket: ''


test:
  postgres:
   username: ''
   password: ''
```

### Initialize the database

```
rails db:create db:migrate db:seed (you can skip seeding if you prefer)
```

## Deployment instructions

### With [Heroku](https://www.heroku.com/) (recommended)

* install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) first

* cd into your project folder

```shell
heroku login
```

* create a new heroku app

```shell
heroku create <your app name>
```

* set git remote to your newly created app

```shell
git remote set-url heroku https://git.heroku.com/<your app name>.git
```

* now push your app

```shell
git push heroku master
```

* if you're pushing a branch other than master, use below command

```shell
git push heroku <your branch>:master
```

* now let's migrate the database

```shell
heroku run rails db:create db:migrate db:seed
```
(you can skip seeding if you prefer)


### finally you can visit your project website through this URL

```shell
https://<your app name>.herokuapp.com
```

### you can visit admin & management panel through this URL

```shell
https://<your app name>.herokuapp.com/admin/dashboards
```
