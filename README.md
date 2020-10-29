# TGP - From db to Front
![](https://img.freepik.com/free-vector/pop-art-retro-comic-illustration-woman-whispering-gossip-secret-her-friend-speech-bubble_88813-218.jpg?size=626&ext=jpg)

## Features
* Homepage with the latest gossips heards
* welcome page at /welcome/:name
* User page 
* Gossip page at /gossips/:id
* Team page at /team
* Contact page at /contact
* CRUD a Gossip with restriction by user account
* Like a Gossip with restriction by user account

## How to clone this ?
1. First clone this repo
   ```shell
   $ git clone https://github.com/vanaklay/TGP_db_to_front.git
   ```
2. Run
   ```shell
   $ bundle install
   ```
3. Run
```shell
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```

