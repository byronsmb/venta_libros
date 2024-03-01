import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:venta_libros/data/datos_ficticios.dart';
import 'package:venta_libros/widgets/book_3d.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
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
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: librosPopulares.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 15, // sombra del card
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // bordes redondeados
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10.0), // para que la imagen tenga bordes redondeados
                      child: Image.network(
                        librosPopulares[index].urlImage, // URL de la imagen
                        fit:
                            BoxFit.cover, // ajuste de la imagen dentro del card
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Categorias'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: 'Setting')
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
          child: Icon(Icons.home),
          onPressed: () => setState(() {
            _currentIndex = 1;
          }),
        ),
      ),
    );
  }
}
