import 'package:flutter/material.dart';
import './registro.dart';
import './admnprinc.dart';

class AdministrarUsuariosPage extends StatelessWidget {
  const AdministrarUsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Barra de navegación
          Container(
            height: 80, // Altura del encabezado
            color: const Color.fromARGB(255, 135, 71, 15), // Color café
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0), // Espacio adicional arriba del ícono
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ), // Flecha para volver
                    iconSize: 40, // Tamaño del ícono de la flecha
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AdminPage(), // Asegúrate de que LoginPage esté importado
                        ),
                      ); // Volver a la pantalla anterior
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espacio para separar la barra
          // Imagen personalizada
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Container(
                width: 130, // Ancho del contorno circular
                height: 130, // Alto del contorno circular
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 3, // Grosor del borde
                  ),
                  shape: BoxShape.circle, // Forma circular
                ),
                child: Image.asset(
                  'assets/img/empleados.png', // Ruta de la imagen personalizada
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Título de empleados
          const Text(
            'Empleados',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(96, 60, 30, 1),
            ),
          ),
          const SizedBox(height: 20), // Espacio debajo del título
          // Botón para agregar usuario alineado a la izquierda
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para agregar un nuevo usuario
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RegistroPage(), // Asegúrate de que LoginPage esté importado
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Fondo blanco del círculo
                      shape: BoxShape.circle, // Forma circular
                      border: Border.all(
                          color: Colors.black, width: 2), // Borde negro
                    ),
                    padding: const EdgeInsets.all(
                        2.0), // Espacio alrededor del ícono
                    child: const Icon(
                      Icons.add, // Icono de agregar
                      color: Colors.black,
                    ),
                  ),
                  label: const Text(
                    'Agregar Empleado',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espacio debajo del botón
          // Tabla de empleados
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Permite desplazamiento vertical
              child: SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal, // Permite desplazamiento horizontal
                child: Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Padding para evitar que la tabla toque los bordes
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black), // Borde alrededor de la tabla
                      borderRadius:
                          BorderRadius.circular(8), // Bordes redondeados
                    ),
                    child: DataTable(
                      columnSpacing: 15, // Mayor espacio entre columnas
                      // ignore: deprecated_member_use
                      dataRowHeight: 60, // Más espacio entre las filas
                      columns: const [
                        DataColumn(label: Text('Nombre')),
                        DataColumn(label: Text('Teléfono')),
                        DataColumn(label: Text('Turno')),
                        DataColumn(label: Text('Usuario')),
                        DataColumn(label: Text('Acciones')),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Juan Pérez',
                                style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('555-1234',
                                style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('Mañana', style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('jperez', style: TextStyle(fontSize: 14)),
                          )),
                          DataCell(Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange, // Relleno naranja
                                  borderRadius: BorderRadius.circular(
                                      8), // Esquinas redondeadas
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white, // Ícono blanco
                                  onPressed: () {
                                    // Lógica para editar
                                  },
                                ),
                              ),
                              const SizedBox(width: 8), // Espacio entre íconos
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.pink, // Relleno rosa
                                  borderRadius: BorderRadius.circular(
                                      8), // Esquinas redondeadas
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.white, // Ícono blanco
                                  onPressed: () {
                                    // Lógica para eliminar
                                  },
                                ),
                              ),
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Ana Gómez',
                                style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('555-5678',
                                style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('Tarde', style: TextStyle(fontSize: 14)),
                          )),
                          const DataCell(Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('agomez', style: TextStyle(fontSize: 14)),
                          )),
                          DataCell(Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange, // Relleno naranja
                                  borderRadius: BorderRadius.circular(
                                      8), // Esquinas redondeadas
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white, // Ícono blanco
                                  onPressed: () {
                                    // Lógica para editar
                                  },
                                ),
                              ),
                              const SizedBox(width: 8), // Espacio entre íconos
                              Container(
                                // Tamaño más pequeño
                                decoration: BoxDecoration(
                                  color: Colors.pink, // Relleno rosa
                                  borderRadius: BorderRadius.circular(
                                      8), // Esquinas redondeadas
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.white, // Ícono blanco
                                  onPressed: () {
                                    // Lógica para eliminar
                                  },
                                ),
                              ),
                            ],
                          )),
                        ]),
                        // Puedes agregar más filas aquí
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
