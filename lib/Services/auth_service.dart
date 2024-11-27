import '../models/usuario_model.dart';

class AuthService {
  // Lista de usuarios predefinidos
  final List<Usuario> usuarios = [
    Usuario(
      idUsuario: 1,
      usuario: "admin",
      turno: "M",
      contrasena: "1234",
      nombre: "Administrador",
      telefono: "1234567890",
      rol: "admin",
    ),
    Usuario(
      idUsuario: 2,
      usuario: "empleado1",
      turno: "V",
      contrasena: "password1",
      nombre: "Juan Pérez",
      telefono: "0987654321",
      rol: "empleado",
    ),
  ];

  // Método para validar login
  Usuario? validarLogin(String usuario, String contrasena) {
    for (var user in usuarios) {
      if (user.usuario == usuario && user.contrasena == contrasena) {
        return user; // Retorna el usuario si coincide
      }
    }
    return null; // Retorna null si no coincide
  }
}
