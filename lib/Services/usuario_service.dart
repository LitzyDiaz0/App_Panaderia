import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/usuario_model.dart';

class UsuarioService {
  static Database? _database;

  // Método para obtener la base de datos
  Future<Database> get _db async {
    if (_database != null) return _database!;
    // Si no existe, la creamos
    _database = await _initDB();
    return _database!;
  }

  // Método para inicializar la base de datos
  Future<Database> _initDB() async {
    // Obtener la ruta de la base de datos
    String path = join(await getDatabasesPath(), 'usuarios.db');
    
    // Crear la base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Crear la tabla de usuarios
        await db.execute('''
          CREATE TABLE usuarios(
            idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
            usuario TEXT,
            turno TEXT,
            contrasena TEXT,
            nombre TEXT,
            telefono TEXT,
            rol TEXT
          )
        ''');
      },
    );
  }

  // Método para agregar un usuario
  Future<void> agregarUsuario(Usuario usuario) async {
    final db = await _db;
    await db.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Si el ID ya existe, reemplazarlo
    );
  }

  // Método para obtener todos los usuarios
  Future<List<Usuario>> obtenerUsuarios() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('usuarios');

    return List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
  }
}
