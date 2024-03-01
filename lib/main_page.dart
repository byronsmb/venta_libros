import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:venta_libros/data/datos_ficticios.dart';
import 'package:venta_libros/widgets/book_3d.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('LIBROS'),
          CarouselSlider.builder(
              itemCount: librosDisponibles.length,
              options: CarouselOptions(
                height: 280.0, //altura
                initialPage: 1,
                //agrandar pantalla central
                enlargeCenterPage: false,
                //autoPlay: true, // se reproduzca automatico
                //aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.5,
                onPageChanged: (index, reason) {
                  /*setState(() {
                      widget.currentIndex = index;
                    });*/
                },
              ),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Book3DWidget(
                  libroActual: librosDisponibles[itemIndex],
                );
              }),
          Text('LIBROS POPULARES'),
        ],
      ),
    );
  }
}
