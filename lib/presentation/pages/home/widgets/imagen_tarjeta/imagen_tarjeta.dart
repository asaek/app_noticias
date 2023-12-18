import 'package:flutter/material.dart';

class ImagenTarjeta extends StatelessWidget {
  final String urlImagen;
  const ImagenTarjeta({super.key, required this.urlImagen});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Image.network(urlImagen, fit: BoxFit.cover),
    );
  }
}
