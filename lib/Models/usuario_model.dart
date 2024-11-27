class Usuario {
  final int idUsuario; // ID del usuario
  final String usuario; // Nombre de usuario
  final String turno; // Turno (M o V)
  final String contrasena; // Contraseña
  final String nombre; // Nombre completo
  final String telefono; // Teléfono
  final String rol; // Rol (admin o empleado)

  Usuario({
    required this.idUsuario,
    required this.usuario,
    required this.turno,
    required this.contrasena,
    required this.nombre,
    required this.telefono,
    required this.rol,
  });
}
