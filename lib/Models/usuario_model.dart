class Usuario {
  final int? idUsuario;
  final String usuario;
  final String turno;
  final String contrasena;
  final String nombre;
  final String telefono;
  final String rol;

  Usuario({
    this.idUsuario,
    required this.usuario,
    required this.turno,
    required this.contrasena,
    required this.nombre,
    required this.telefono,
    required this.rol,
  });

  // Método para convertir un Usuario a un Map (para insertar en la base de datos)
  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'usuario': usuario,
      'turno': turno,
      'contrasena': contrasena,
      'nombre': nombre,
      'telefono': telefono,
      'rol': rol,
    };
  }

  // Método para crear un Usuario a partir de un Map (para cuando obtienes datos de la base de datos)
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuario: map['idUsuario'],
      usuario: map['usuario'],
      turno: map['turno'],
      contrasena: map['contrasena'],
      nombre: map['nombre'],
      telefono: map['telefono'],
      rol: map['rol'],
    );
  }
}
