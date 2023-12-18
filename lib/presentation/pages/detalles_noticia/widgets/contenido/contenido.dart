import 'package:flutter/material.dart';

import '../../../../common/tokens/paddings.dart';

class Contenido extends StatelessWidget {
  final String contenido;
  final String description;

  const Contenido({
    super.key,
    required this.contenido,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: paddingDetallesImagen,
        child: Text(
          (contenido == 'Sin contenido')
              ? (description == 'Sin descripción')
                  ? 'No hay nada XD'
                  : description
              : contenido,
        ),
      ),
    );
  }
}
