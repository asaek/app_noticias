import 'package:flutter/material.dart';

import '../../../../common/tokens/paddings.dart';

class SourceDate extends StatelessWidget {
  final String source;
  final DateTime publishedAt;

  const SourceDate({
    super.key,
    required this.source,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingDetallesImagen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(source),
          Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${publishedAt.day.toString()}/${publishedAt.month.toString()}/${publishedAt.year.toString()}',
              ),
            ],
          )
        ],
      ),
    );
  }
}
