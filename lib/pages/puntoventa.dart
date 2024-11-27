import 'package:flutter/material.dart';
import './admnprinc.dart';

class PuntoDeVentaPage extends StatelessWidget {
  const PuntoDeVentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 73, 10, 1), // Color café
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Flecha para volver
          onPressed: () {
            // Navegar hacia atrás
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminPage(),
              ),
            );
          },
        ),
        title: Image.asset(
          'assets/img/logo.png', // Logo en el centro
          height: 40,
        ),
        centerTitle: true,
        toolbarHeight: 80, // Aumentar la altura para diseño
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título debajo del encabezado
            const Text(
              'El Rincón del Pan',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'Italianno',
                color: Color.fromRGBO(144, 73, 10, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Input para buscar pan
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del pan a vender',
                prefixIcon: const Icon(
                  Icons.bakery_dining, // Icono de pan
                  color: Color.fromRGBO(144, 73, 10, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Botones en la misma fila
            Row(
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
          ],
        ),
      ),
    );
  }
}
