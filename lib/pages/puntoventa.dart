import 'package:flutter/material.dart';
import './admnprinc.dart';

class PuntoDeVentaPage extends StatelessWidget {
  const PuntoDeVentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Contenido principal
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // AppBar con color café
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
                              builder: (context) => const AdminPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Espacio para acomodar el logo que sobresale
              const SizedBox(height: 50),
              // Título debajo del logo
              const Center(
                child: Text(
                  'El Rincón del Pan',
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'Italianno',
                    color: Color.fromRGBO(96, 60, 30, 1),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Input para buscar pan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre del pan a vender',
                    prefixIcon: const Icon(
                      Icons.bakery_dining, // Icono de pan
                      color: Color.fromRGBO(144, 73, 10, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Botones en la misma fila
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botón Buscar Pan
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para buscar pan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.black, // Borde negro
                            width: 1,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.search, // Icono de lupa
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Buscar Pan',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Botón Ventas del Día
                    ElevatedButton.icon(
                      onPressed: () {
                        // Lógica para ver ventas del día
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.black, // Borde negro
                            width: 1,
                          ),
                        ),
                      ),
                      icon: const Icon(
                        Icons.receipt_long, // Icono para ventas
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Ventas del Día',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Imagen del logo que sobresale
          Positioned(
            top: 30,
            left:
                MediaQuery.of(context).size.width / 2 - 50, // Centrar la imagen
            child: Image.asset(
              'assets/img/logo.png',
              height: 110,
              width: 110,
            ),
          ),
        ],
      ),
    );
  }
}
