# README

Assuming you have the vagrant box up and running:

Run the usual stuff:


```
cd /vagrant/api-starter/
```

```
$: bundle 
$: db:migrate
$: db:seed
```

After that create a user:
```
$: rails c
> User.create("email": "test@test.com", "password" : "secure_pass", "password_confirmation": "secure_pass")
```
Then run the server, for some reason we have to bind it to 0.0.0.0 'cos we're running inside a Vagrant Box. I'll fix it later:
```
rails s -b 0.0.0.0
```
Then open another console and test the routes from there using Curl. this project uses JWT so first send a POST request with the user credentials to '/authentication'

```
curl -H "Content-Type: application/json" -X POST -d
'{"email":"test@test.com","password":"security"}'
http://localhost:3000/authenticate
```
Then add the token to future requests. Simples.

```
curl -H "Authorization: <auth_token>" http://localhost:3000/items
```
