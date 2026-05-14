import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  Future<Map<String, dynamic>> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'),);

    return jsonDecode(response.body);
  }
}