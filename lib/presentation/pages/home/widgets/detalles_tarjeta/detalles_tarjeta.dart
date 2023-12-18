import 'package:flutter/material.dart';

import '../../../../common/tokens/paddings.dart';
import '../../../../common/tokens/tamanos.dart';

class DetallesTarjeta extends StatelessWidget {
  final String source;
  final List<String> autor;
  final DateTime fecha;

  const DetallesTarjeta({
    super.key,
    required this.source,
    required this.autor,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigthTItuloDetallles,
      width: double.infinity,
      child: Material(
        // color: Colors.yellow,
        child: Padding(
          padding: paddingTituloDetalles,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      source,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 5),
                        Text(fecha.year.toString()),
                        Text('/${fecha.month.toString()}/'),
                        Text(fecha.day.toString()),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(autor[0]),
                  if (autor.length > 1) Text(', ${autor[1]}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
