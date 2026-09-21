import 'package:flutter/material.dart';
import 'package:navmarket/TabsNM/DetailPrdct.dart';

class Productor {
  const Productor({
    required this.nombre,
    required this.vereda,
    required this.distanciaKm,
    required this.rutaImagen,
  });

  final String nombre;
  final String vereda;
  final double distanciaKm;
  final String rutaImagen;
}

const List<Productor> productores = [
  Productor(
    nombre: 'Finca La Esperanza',
    vereda: 'El Retiro',
    distanciaKm: 3.2,
    rutaImagen: 'assets/imagenes/finca_la_esperanza.jpg',
  ),
  Productor(
    nombre: 'Huerta Doña Rosa',
    vereda: 'La Ceja',
    distanciaKm: 5.1,
    rutaImagen: 'assets/imagenes/huerta_dona_rosa.jpg',
  ),
  Productor(
    nombre: 'Finca El Manantial',
    vereda: 'Rionegro',
    distanciaKm: 4.4,
    rutaImagen: 'assets/imagenes/finca_el_manantial.jpg',
  ),
  Productor(
    nombre: 'Granja Los Alpes',
    vereda: 'Guarne',
    distanciaKm: 6.0,
    rutaImagen: 'assets/imagenes/granja_los_alpes.jpeg',
  ),
  Productor(
    nombre: 'Cultivos San Isidro',
    vereda: 'El Retiro',
    distanciaKm: 2.8,
    rutaImagen: 'assets/imagenes/cultivos_san_isidro.jpeg',
  ),
];

const List<Map<String, dynamic>> productos = [
  {'nombre': 'Tomate chonto', 'precio': 3200},
  {'nombre': 'Lechuga crespa', 'precio': 1800},
  {'nombre': 'Zanahoria criolla', 'precio': 2100},
  {'nombre': 'Cilantro fresco', 'precio': 1200},
];

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key, required this.correo});

  final String correo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Hola, $correo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productores.length,
              itemBuilder: (context, index) {
                final productor = productores[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        productor.rutaImagen,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.image_not_supported_outlined),
                          );
                        },
                      ),
                    ),
                    title: Text(productor.nombre),
                    subtitle: Text('Vereda ${productor.vereda}'),
                    trailing: Text('${productor.distanciaKm} km'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleProducto(
                            productor: {
                              'nombre': productor.nombre,
                              'vereda': 'Vereda ${productor.vereda}',
                              'productos': productos,
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            label: 'Alertas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Cuenta',
          ),
        ],
      ),
    );
  }
}
