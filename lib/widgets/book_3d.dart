import 'package:flutter/material.dart';
import 'package:venta_libros/models/libro.dart';

class Book3DWidget extends StatelessWidget {
  const Book3DWidget({super.key, required this.libroActual});
  final Libro libroActual;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      decoration: BoxDecoration(),
      width: 200.0,
      height: 300.0,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // Perspectiva
          ..rotateY(0.5), // Rotación en el eje Y
        alignment: Alignment.center,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children: [
                Image.network(
                  libroActual.urlImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  //left: 10,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color.fromARGB(255, 31, 31, 31),
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
