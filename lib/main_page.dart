import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:venta_libros/data/datos_ficticios.dart';
import 'package:venta_libros/screens/libro_detalle.dart';
import 'package:venta_libros/widgets/book_3d.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.menu), Icon(Icons.explore)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'LIBROS',
                  style: GoogleFonts.teko(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            CarouselSlider.builder(
                itemCount: librosDisponibles.length,
                options: CarouselOptions(
                  height: 280.0, //altura
                  initialPage: 1,

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
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LibroDetalle(
                                libroActual: librosDisponibles[itemIndex]),
                          ));
                    },
                    child: Book3DWidget(
                      libroActual: librosDisponibles[itemIndex],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'LIBROS POPULARES',
                  style: GoogleFonts.teko(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: librosPopulares.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LibroDetalle(
                                libroActual: librosPopulares[index],
                              ),
                            ));
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            //color: Colors.red,
                            height: 180,
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // bordes redondeados
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Hero(
                                  tag: librosPopulares[index].id,
                                  child: Image.network(
                                    librosPopulares[index].urlImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            librosPopulares[index].titulo,
                            style: GoogleFonts.teko(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: kBottomNavigationBarHeight,
            child: Container(
              decoration: const BoxDecoration(
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
                      currentIndex = index;
                    });
                  },
                  items: const [
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
            backgroundColor: currentIndex == 1 ? Colors.blue : Colors.blueGrey,
            child: const Icon(Icons.home),
            onPressed: () => setState(() {
              _currentIndex = 1;
            }),
          ),
        ),
      ),
    );
  }
}
