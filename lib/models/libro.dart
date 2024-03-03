import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Libro {
  Libro({
    required this.titulo,
    required this.subtitulo,
    required this.autor,
    required this.descripcion,
    required this.urlImage,
  }) : id = uuid.v4();

  final String id;
  final String titulo;
  final String subtitulo;
  final String autor;
  final String descripcion;
  final String urlImage;
}
