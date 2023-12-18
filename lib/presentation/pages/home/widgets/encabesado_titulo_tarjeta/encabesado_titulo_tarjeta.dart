import 'package:flutter/material.dart';

import '../../../../common/tokens/paddings.dart';
import '../../../../common/tokens/tamanos.dart';

class EncabesadoTituloTarjeta extends StatelessWidget {
  final String titulo;
  const EncabesadoTituloTarjeta({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigthTItuloDetallles,
      child: Material(
        // color: Colors.yellow,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: paddingTituloDetalles,
            child: Text(
              titulo,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
