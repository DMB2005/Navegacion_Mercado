import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key, required this.correo});

  final String correo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Hola, $correo',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
