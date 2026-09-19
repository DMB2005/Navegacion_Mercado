import 'package:flutter/material.dart';

class Productor {
  const Productor({
    required this.nombre,
    required this.vereda,
    required this.distanciaKm,
  });

  final String nombre;
  final String vereda;
  final double distanciaKm;
}

const List<Productor> productores = [
  Productor(
    nombre: 'Finca La Esperanza',
    vereda: 'El Retiro',
    distanciaKm: 3.2,
  ),
  Productor(nombre: 'Huerta Doña Rosa', vereda: 'La Ceja', distanciaKm: 5.1),
  Productor(nombre: 'Finca El Manantial', vereda: 'Rionegro', distanciaKm: 4.4),
  Productor(nombre: 'Granja Los Alpes', vereda: 'Guarne', distanciaKm: 6.0),
  Productor(
    nombre: 'Cultivos San Isidro',
    vereda: 'El Retiro',
    distanciaKm: 2.8,
  ),
];

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key, required this.correo});

  final String correo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
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
                    title: Text(productor.nombre),
                    subtitle: Text('Vereda ${productor.vereda}'),
                    trailing: Text('${productor.distanciaKm} km'),
                    onTap: () {
                      // TODO: navegar al detalle del productor.
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
