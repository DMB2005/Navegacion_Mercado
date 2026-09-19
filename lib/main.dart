import 'package:flutter/material.dart';
import 'package:navmarket/layout/LoginScreen.dart';

void main() => runApp(const MercadoApp());

class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 53, 192, 120),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/inicio': (context) {
          final correo = ModalRoute.of(context)?.settings.arguments as String?;
          return Scaffold(
            appBar: AppBar(title: const Text('Inicio (temporal)')),
            body: Center(child: Text('Correo recibido: $correo')),
          );
        },
      },
    );
  }
}
