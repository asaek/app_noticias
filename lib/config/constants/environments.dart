import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static final String newsApiKey =
      dotenv.env['THE_NEWS_API_KEY'] ?? 'No hay api key';
}
