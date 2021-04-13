const express = require('express');
const cors = require('cors');
const {errors} = require('celebrate');
const routers = require('./routers');
const app = express();

app.use(cors());
app.use(express.json());  
app.use(routers);
app.use(errors());

app.listen(3333);

/**
 * video 2 - parada: 1:30:38min
 */

/**
 * Banco de dados:
 * npm install knex - iniciar o pacote npx knex init
 * npm install sqlite3
 */

/**
 * Rota / recurso
 */

/**
 * Métodos http:
 * 
 * GET: Buscar uma informação do back-end
 * POST: Criar uma informação no back-end
 * PUT: Alterar uma informação no back-end
 * DELETE: Deletar uma informação no back-end
 */

/**
 * Tipos de parâmetros
 * 
 * Query: Parâmetros nomeados enviados na rota após "?" (Filtros, Paginação)
 * Router Params: Parâmetros utilizados para identificar reursos
 * Request Body: Corpo da requisição utilizado para criar ou alterar recursos
 */

/**
 * nodemon - monitora o status do servidor node
 * Apartir do script: "start": "nodemon index.js"
 */