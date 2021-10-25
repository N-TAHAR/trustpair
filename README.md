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
