import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venta_libros/models/libro.dart';

class LibroDetalle extends StatelessWidget {
  const LibroDetalle({super.key, required this.libroActual});
  final Libro libroActual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(libroActual.urlImage,
                          fit: BoxFit.cover)),
                  Container(
                    color: Color.fromARGB(255, 56, 107, 237).withOpacity(
                        0.5), // Cambia la opacidad según sea necesario
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 32, 30, 30)
                                    .withOpacity(0.5), // Color de la sombra
                                spreadRadius: 5, // Radio de propagación
                                blurRadius: 7, // Radio de desenfoque
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Hero(
                                  tag: libroActual.id,
                                  child: Image.network(libroActual.urlImage)))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      libroActual.titulo,
                      style: GoogleFonts.teko(
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                        //fontSize: 48,
                        fontWeight: FontWeight.w700,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              )
              //Image.network(imagenUrlActual),
              ),
          Expanded(
            child: Text('TEXTO Y OTRAS COSAS DE ABAJO'),
          ),
        ],
      ),
    );
  }
}
