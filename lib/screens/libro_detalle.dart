import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibroDetalle extends StatelessWidget {
  const LibroDetalle(
      {super.key, required this.imagenUrlActual, required this.idActual});
  final String imagenUrlActual;
  final String idActual;

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
                      child: Image.network(imagenUrlActual, fit: BoxFit.cover)),
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
                                  tag: idActual,
                                  child: Image.network(imagenUrlActual)))),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('PONER HERO A  imgsn')),
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
