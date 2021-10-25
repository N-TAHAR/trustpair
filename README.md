# IBAN BANK API
## Installation
<br/>

```
bundle install
```

```
rails db:create
```

```
rails db:migrate
```

```
rails server
```

<br/>

## How to use this API ? 

<br/>

Create an IBAN
```
POST '/ibans', params: { name: 'iban_name' }
```
<br/>

Update an IBAN
```
PUT '/ibans/:iban_name', params: { name: 'new_iban_name' }
```
<br/>

Delete an IBAN

```
DELETE '/ibans/:iban_name'
```
<br/>

GET all IBANs

```
GET '/ibans'
```
<br/>

GET an IBAN

```
GET '/ibans/:iban_name'
```
<br/>

GET a random IBAN

```
GET '/random_iban'
```
<br/>

## Run the tests
<br/>

```
bundle exec rspec spec
```
<br/>

# MetaWeather API

You want to know if it rains in your city tomorrow ?

Paris in this example :
```
rake metaweather_api:tomorrow_rain[paris]
```

zsh console ? Try this instead : 

```
rake metaweather_api:tomorrow_rain\[london\]
```
