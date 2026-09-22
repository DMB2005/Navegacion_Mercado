import 'package:flutter/material.dart';
import 'package:navmarket/pantallas/inicio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correo = TextEditingController();
  final _clave = TextEditingController();
  bool _ocultar = true;

  void _iniciarSecion() {
    if (_correo.text.trim().isEmpty || _clave.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese su correo y contraseña')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaInicio(correo: _correo.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //IMAGEN DE PRESENTACION DE LOGIN
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/a/a5/Mercado_dos_Lavradores%2C_Madeira_%2816587278615%29.jpg',
                height: 250,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 24),
              const Text(
                'Bienvenido/a',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              //CORREO ELECTRONICO
              TextField(
                controller: _correo,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
              ),

              //CONTRASEÑA
              const SizedBox(height: 16),
              TextField(
                controller: _clave,
                obscureText: _ocultar,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _ocultar ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _ocultar = !_ocultar;
                      });
                    },
                  ),
                ),
              ),

              //INICIAR SESION
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _iniciarSecion,
                child: const Text('Iniciar Sesion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
