const express = require('express');

const OngController = require('./controllers/OngController');
const IncidentsController = require('./controllers/IncidentController');
const ProfileController = require('./controllers/ProfileController');
const SessionController = require('./controllers/SessionController')

const routers = express.Router();

routers.post('/sessions', SessionController.create);

routers.get('/ongs', OngController.index);
routers.post('/ongs', OngController.create);

routers.get('/profile', ProfileController.index);

routers.post('/incidents', IncidentsController.create);
routers.get('/incidents', IncidentsController.index);
routers.delete('/incidents/:id', IncidentsController.delete);

module.exports = routers;