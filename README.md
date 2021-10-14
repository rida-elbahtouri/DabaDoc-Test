# TechStore

This repo includes the back-end of my [DabaDoc](https://github.com/rida-elbahtouri/DabaDoc-FrontEnd) application.

## Project features

#### User Can

- Create an account
- Exolore List of questions based on distance
- Add questions to Favorites list
- Edit/Delete questions from Favorites list
- Answer questions
- Get list of favorites questions
- sign in to his account

## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3
- Desvise
- Jwt
- Docker

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.1

Docker

Rails: v6.0.3

### Clone the Project

```
$ git clone https://github.com/rida-elbahtouri/DabaDoc-Test.git

$ cd DabaDoc-Test
```

### Setup

Build docker image:

```
docker-compose build
```

Setup database with:

```
   docker-compose run web rails db:create
   docker-compose run web rails db:migrate

```

### Usage

Start server with:

```
    docker-compose up

```

### Usage

##### Post your email and password as json to '/users/' to Sign up

###### Json format

```
    {
        "user":{
            "email":email@email.com,
            "password":"password"
        }
    }
```

##### Post your email and password as json to '/users/sign_in' to Sign in, using the same json format

##### Use the giving token as athenticaton header in all the next requests

##### Post to '/questions/',to create questions

###### Json format

```
    {
        "question":{
        "title":"title",
        "content":"content",
        "latitude":11.111111,
        "longitude":-22.222222
    }
    }
```

##### To add questions to favorites list, post question_id to '/favorites/

##### To Delete question from your favorites list, send a delete request with question_id as param

##### To get answers send get request to '/questions.question_id'

## Developer

👤 **Rida Elbahtouri**

- [Github](https://github.com/rida-elbahtouri)
- [Twitter](https://twitter.com/RElbahtouri)
- [Linkedin](https://www.linkedin.com/in/rida-elbahtouri/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the <a href="https://github.com/rida-elbahtouri/DabaDoc-Test/issues" target="_blank">issues page</a>.

## Show your support

Give a ⭐️ if you like this project!
