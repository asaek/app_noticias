import 'package:flutter/material.dart';

import '../../../../common/tokens/paddings.dart';

class TitleMio extends StatelessWidget {
  final String titulo;

  const TitleMio({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: paddingDetallesImagen,
        child: Text(
          titulo,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
