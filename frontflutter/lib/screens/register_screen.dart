// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:Tendencias-con-IA/services/auth_service.dart';
import 'package:Tendencias-con-IA/utils/app_colors.dart';
import 'package:Tendencias-con-IA/widgets/custom_input_field.dart'; // Tu widget de input
import 'package:Tendencias-con-IA/widgets/custom_button.dart';     // Tu widget de botón

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await AuthService().registerUser(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso!')),
        );
        // Navegar a la pantalla de login o home
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crea tu cuenta',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(height: 40),
                CustomInputField( // Reutiliza este widget
                  controller: _nameController,
                  labelText: 'Nombre',
                  hintText: 'Ingresa tu nombre',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: _emailController,
                  labelText: 'Correo Electrónico',
                  hintText: 'ejemplo@dominio.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Ingresa un correo válido';
                    }
                    return null;
                  },
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: _passwordController,
                  labelText: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                  icon: Icons.lock,
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton( // Reutiliza este widget
                        onPressed: _registerUser,
                        text: 'Registrarse',
                      ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navegar a la pantalla de login
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    '¿Ya tienes una cuenta? Inicia Sesión',
                    style: TextStyle(color: AppColors.primaryBlue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}