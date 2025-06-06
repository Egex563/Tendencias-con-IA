// backend_nodejs/src/controllers/authController.js
const User = require('../models/User');
const jwt = require('jsonwebtoken'); // Para JWT (si implementas login)

// Generar un token JWT (opcional, para después del login)
const generateToken = (id) => {
  return jwt.sign({ id }, process.env.JWT_SECRET, { expiresIn: '1h' });
};

// @desc    Registrar un nuevo usuario
// @route   POST /api/auth/register
// @access  Public
exports.registerUser = async (req, res) => {
  const { name, email, password } = req.body;

  try {
    let user = await User.findOne({ email });

    if (user) {
      return res.status(400).json({ message: 'El usuario ya existe con este correo electrónico.' });
    }

    user = new User({
      name,
      email,
      password,
    });

    await user.save();

    res.status(201).json({ message: 'Usuario registrado exitosamente.' });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Error del servidor');
  }
};

// @desc    Autenticar usuario y obtener token
// @route   POST /api/auth/login
// @access  Public
exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({ message: 'Credenciales inválidas.' });
    }

    const isMatch = await user.comparePassword(password);

    if (!isMatch) {
      return res.status(400).json({ message: 'Credenciales inválidas.' });
    }

    // Si las credenciales son correctas, genera un token
    const token = generateToken(user._id);

    res.json({ token, user: { id: user._id, name: user.name, email: user.email } });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Error del servidor');
  }
};