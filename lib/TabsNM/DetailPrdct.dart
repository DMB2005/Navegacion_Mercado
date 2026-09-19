import 'package:flutter/material.dart';
 
/// Estructura esperada de [productor]:
/// {
///   'nombre': 'Finca La Esperanza',        // requerido
///   'vereda': 'Vereda El Retiro',           // requerido
///   'productos': [                          // requerido (mínimo 4)
///     {'nombre': 'Tomate chonto', 'precio': 3200},
///     {'nombre': 'Lechuga crespa', 'precio': 1800},
///   ],
///   'fotoPortada': 'https://...',           // opcional
///   'insignias': ['Agroecológico', '4.9 ★'],// opcional
/// }
class DetalleProducto extends StatefulWidget {
  final Map<String, dynamic> productor;
 
  const DetalleProducto({super.key, required this.productor});
 
  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}
 
class _DetalleProductoState extends State<DetalleProducto> {
  int carritoConteo = 0;
  double carritoTotal = 0;
  bool esFavorita = false;
 
  void agregarAlCarrito(Map<String, dynamic> producto) {
    setState(() {
      carritoConteo++;
      carritoTotal += (producto['precio'] as num).toDouble();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final String nombre = widget.productor['nombre'] ?? '';
    final String vereda = widget.productor['vereda'] ?? '';
    final String? fotoPortada = widget.productor['fotoPortada'];
    final List<String> insignias =
        List<String>.from(widget.productor['insignias'] ?? []);
    final List<Map<String, dynamic>> productos =
        List<Map<String, dynamic>>.from(widget.productor['productos'] ?? []);
 
    return Scaffold(
      appBar: AppBar(
        // Foto de portada (opcional)
        flexibleSpace: fotoPortada != null
            ? Image.network(
                fotoPortada,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                ),
              )
            : null,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.7),
            shape: const CircleBorder(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(esFavorita ? Icons.favorite : Icons.favorite_border),
            onPressed: () => setState(() => esFavorita = !esFavorita),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.7),
              shape: const CircleBorder(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Nombre y vereda del productor (mínimo requerido)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(vereda, style: TextStyle(color: Colors.grey[600])),
                // Insignias (opcional)
                if (insignias.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: insignias.map((i) => Chip(label: Text(i))).toList(),
                  ),
                ],
              ],
            ),
          ),
          const Divider(),
          // Lista de productos con precio y botón "+"
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return ListTile(
                  title: Text(producto['nombre']),
                  subtitle: Text('\$${producto['precio']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    onPressed: () => agregarAlCarrito(producto),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Botón "Ver carrito" (opcional), centrado con margen de 20px
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Ver carrito · $carritoConteo · \$${carritoTotal.toStringAsFixed(0)}'),
      ),
      floatingActionButtonLocation: const _CentradoConMargen(20),
    );
  }
}
 
/// Posiciona el FloatingActionButton centrado horizontalmente
/// y con un margen fijo respecto al borde inferior de la pantalla.
/// 
class _CentradoConMargen extends FloatingActionButtonLocation {
  final double margen;
  const _CentradoConMargen(this.margen);
 
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;
    final double fabY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        margen -
        scaffoldGeometry.minInsets.bottom;
    return Offset(fabX, fabY);
  }
}
 