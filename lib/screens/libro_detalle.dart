import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venta_libros/models/libro.dart';
import 'package:flip_widget/flip_widget.dart';
import 'dart:math' as math;

class LibroDetalle extends StatefulWidget {
  const LibroDetalle({super.key, required this.libroActual});
  final Libro libroActual;

  @override
  State<LibroDetalle> createState() => _LibroDetalleState();
}

const double _MinNumber = 0.008;
double _clampMin(double v) {
  if (v < _MinNumber && v > -_MinNumber) {
    if (v >= 0) {
      v = _MinNumber;
    } else {
      v = -_MinNumber;
    }
  }
  return v;
}

class _LibroDetalleState extends State<LibroDetalle> {
  GlobalKey<FlipWidgetState> _flipKey = GlobalKey();
  Offset _oldPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    Size size = Size(256, 256);
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 56, 107, 237)),
      body: Column(
        children: [
          Container(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(widget.libroActual.urlImage,
                          fit: BoxFit.cover)),
                  Container(
                    color: Color.fromARGB(255, 56, 107, 237).withOpacity(
                        0.5), // Cambia la opacidad según sea necesario
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.amber,
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
                            tag: widget.libroActual.id,
                            child: GestureDetector(
                              child: FlipWidget(
                                key: _flipKey,
                                child:
                                    Image.network(widget.libroActual.urlImage),
                              ),
                              onHorizontalDragStart: (details) {
                                _oldPosition = details.globalPosition;
                                _flipKey.currentState?.startFlip();
                              },
                              onHorizontalDragUpdate: (details) {
                                Offset off =
                                    details.globalPosition - _oldPosition;
                                double tilt =
                                    1 / _clampMin((-off.dy + 20) / 100);
                                double percent =
                                    math.max(0, -off.dx / size.width * 1.4);
                                percent =
                                    percent - percent / 2 * (1 - 1 / tilt);
                                _flipKey.currentState?.flip(percent, tilt);
                              },
                              onHorizontalDragEnd: (details) {
                                _flipKey.currentState?.stopFlip();
                              },
                              onHorizontalDragCancel: () {
                                _flipKey.currentState?.stopFlip();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.libroActual.titulo,
                      style: GoogleFonts.teko(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                backgroundColor:
                                    const Color.fromARGB(255, 71, 69, 69)
                                        .withOpacity(0.5)),
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
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sobre el libro',
                    style: GoogleFonts.titilliumWeb(
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                    ),
                  ),
                ),
                Text(
                  widget.libroActual.descripcion,
                  style: GoogleFonts.titilliumWeb(
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 56, 107, 237),
                      ),
                    ),
                    child: const Text('ADQUIRIR'),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
