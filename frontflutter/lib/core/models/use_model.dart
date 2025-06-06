class User {
  final String name;
  final String email;
  final String password; // Solo para envío, no se almacena en el modelo de respuesta

  User({required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}

class RegistrationResponse {
  final String message;
  final String userId; // Opcional, si el backend devuelve un ID

  RegistrationResponse({required this.message, required this.userId});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'],
      userId: json['userId'] ?? '', // Manejo si userId no viene
    );
  }
}