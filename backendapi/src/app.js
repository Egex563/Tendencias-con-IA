// backend_nodejs/src/app.js
require('dotenv').config(); // Cargar variables de entorno
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors'); // Para permitir peticiones desde Flutter

const authRoutes = require('./routes/authRoutes');
const connectDB = require('./config/db');

const app = express();
const PORT = process.env.PORT || 3000; // Puerto del servidor

// Conectar a la base de datos
connectDB();

// Middleware
app.use(cors()); // Habilita CORS para que Flutter pueda conectarse
app.use(express.json()); // Para parsear el body de las peticiones JSON

// Rutas
app.use('/api/auth', authRoutes); // Prefijo para las rutas de autenticación

// Ruta de prueba
app.get('/', (req, res) => {
  res.send('API de registro de usuarios funcionando!');
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});