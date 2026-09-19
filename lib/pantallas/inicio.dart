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
  Productor(nombre: 'Luis Martínez', vereda: 'La Esperanza', distanciaKm: 2.5),
  Productor(nombre: 'Rosa Pérez', vereda: 'El Salitre', distanciaKm: 4.8),
  Productor(nombre: 'Carlos Gómez', vereda: 'Buenavista', distanciaKm: 6.2),
  Productor(nombre: 'Marta Rodríguez', vereda: 'San Isidro', distanciaKm: 7.5),
  Productor(nombre: 'Jorge Castillo', vereda: 'La Palma', distanciaKm: 9.1),
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
    );
  }
}
