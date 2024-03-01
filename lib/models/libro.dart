class Libro {
  const Libro({
    required this.titulo,
    required this.subtitulo,
    required this.autor,
    required this.descripcion,
    required this.urlImage,
  });

  final String titulo;
  final String subtitulo;
  final String autor;

  final String descripcion;
  final String urlImage;
}
