import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/models/company_details.dart';
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

  Future<CompanyDetail> fetchCompanyDetails() async {
    final url = Uri.parse('https://eo61q3zd4heiwke.m.pipedream.net/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      print("data loaded");
      return CompanyDetail.fromJson(decoded);
    } else {
      throw Exception(
        'Failed to fetch company details: ${response.statusCode}',
      );
    }
  }



}
