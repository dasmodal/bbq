# [BBQ](http://grillmeal.ru)
Application for create events and invite people. You can create events, subscribe, add photos and comments. The event includes yandex map with event address. Also, event activity information (new subscriber, photo, comment) to sent by email to event's author and all subscribers.

## Technologies in project

Registration and authentication - Devise

Css style - Bootstrap

Authorization - Pundit

Authentication with use Google or Vk account - Omniauth

Send mail - Maijet

Uploade photos to YandexStorage - ActiveStorage, AwsS3

Localization - i18n

## Run instruction
### Versions
```
ruby '3.1.2'
rails '6.1.6.1'
```

1. Clone the repository to your local computer by typing in the terminal:
```
git clone https://github.com/dasmodal/bbq.git
```
2. Open directory with the app:
```
cd bbq
```
3. Run bundler for install gems dependencies:
```
bundle
```
4. Create a database and roll migrations:
```
bundle exec rails db:create
bundle exec rails db:migrate
```
5. Finally, you can start the app:
```
bundle exec rails s
```
6. For build frontend resources, you need to open a new terminal window, and run the command:
```
bin/webpack-dev-server
```