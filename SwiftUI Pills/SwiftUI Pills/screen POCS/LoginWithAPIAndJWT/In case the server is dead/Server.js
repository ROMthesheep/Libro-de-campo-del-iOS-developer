// server bastante guarro, funciona tho

const express = require("express");
const app = express();
const jwt = require('jsonwebtoken')

app.use(express.json())

const users = [
  {username: "manolito", password: "gafotas"}
]

const accounts = [
  {name: 'manolito 1', balance: 5000},
  {name: 'manolito 2', balance: 2130},
  {name: 'manolito 4', balance: 5000},
  {name: 'manolito 5', balance: 2130},
  {name: 'manolito 6', balance: 5000},
  {name: 'manolito 7', balance: 2130},
  {name: 'manolito 8', balance: 5000},
  {name: 'manolito 9', balance: 2130},
  {name: 'manolito 10', balance: 5000},
  {name: 'manolito 11', balance: 2130},
  {name: 'manolito 12', balance: 5000},
  {name: 'manolito 13', balance: 2130},
  {name: 'manolito 14', balance: 5000},
  {name: 'manolito 15', balance: 2130},
  
]

function auth(request, response, next) {
  const headers = request.headers['authorization']
  if (headers) {
    if (headers) {
      const token = headers.split(' ')[1]
      const decoded = jwt.verify(token, 'SECRET')
      const username = decoded.username

      const persistedUser = users.find(user => user.username == username.toLowerCase())

      if (persistedUser) {
        next()
      } else {
        response.json({message: 'Acceso denegado'})
      }
    } else {
      response.json({message: 'Acceso denegado'})
    }
  } else {
    response.json({message: 'Acceso denegado'})
  }
}

app.get('/accounts', auth, (request, response) => {
  response.json(accounts)
})

app.post("/login", (request, response) => {
  const username = request.body.username
  const password = request.body.password
  
  const authUser = users.find(user => user.username == username.toLowerCase() && user.password == password.toLowerCase())
  
  if (authUser) {
    const token = jwt.sign({username: username}, "SECRET")
    if (token) {
      response.json({token: token})
    } else {
      response.json({message: "Authentication failed, cagaste", success: false})
    }
  } else {
    response.json({message: "Authentication failed, cagaste", success: false})
  }
})

// listen for requests :)
const listener = app.listen(process.env.PORT, function() {
  console.log("Your app is listening on port " + listener.address().port);
});
