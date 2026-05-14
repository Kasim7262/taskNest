import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<Map<String, dynamic>> fetchQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/random'),);

    final data = jsonDecode(response.body);

    return data[0];
  }
}