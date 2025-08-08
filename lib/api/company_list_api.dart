import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/company_model.dart';

class CompanyRepository {
  Future<List<Company>> fetchCompanies() async {
    final response = await http.get(Uri.parse('https://eol122duf9sy4de.m.pipedream.net/'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List companies = jsonData['data'];
      return companies.map((json) => Company.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch companies');
    }
  }

}
