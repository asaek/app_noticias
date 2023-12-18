import 'package:flutter/material.dart';
import 'package:news_api/domain/entitites/entitites.dart';

import '../../common/tokens/paddings.dart';
import 'widgets/widgets_detalles_noticia.dart';

class DetallesNotixiaPage extends StatelessWidget {
  final Noticia noticia;
  static const routerName = '/noticia_detalles';

  const DetallesNotixiaPage({
    super.key,
    required this.noticia,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.network(
              noticia.urlToImage,
              fit: BoxFit.cover,
              height: size.height * 0.4,
            ),
            const BackButtonMio(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SourceDate(
          source: noticia.source,
          publishedAt: noticia.publishedAt,
        ),
        const SizedBox(
          height: 10,
        ),
        TitleMio(titulo: noticia.title),
        const SizedBox(height: 15),
        Contenido(contenido: noticia.content, description: noticia.description),
        const SizedBox(height: 20),
        Padding(
          padding: paddingDetallesImagen,
          child: Row(
            children: List.generate(
              noticia.author.length,
              (index) => Text(
                noticia.author[index],
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
