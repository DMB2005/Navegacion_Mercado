import 'package:flutter/material.dart';
import 'package:navmarket/TabsNM/DetailPrdct.dart';
 
void main() => runApp(const MercadoApp());
 
class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Campesino',
      debugShowCheckedModeBanner: false,
      home: DetalleProducto(
        productor: {
          'nombre': 'Finca La Esperanza',
          'vereda': 'Vereda El Retiro · 3.2 km',
          'fotoPortada':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxlJRGxYQTAgR96pZNFECtzyGpV8-0DGML61EC6pDRpQ&s=10',
          'insignias': const ['Agroecológico', '4.9 · 128 reseñas'],
          'productos': const [
            {'nombre': 'Tomate chonto', 'precio': 3200},
            {'nombre': 'Lechuga crespa', 'precio': 1800},
            {'nombre': 'Zanahoria criolla', 'precio': 2100},
            {'nombre': 'Cilantro fresco', 'precio': 1200},
          ],
        },
      ),
    );
  }
}
 