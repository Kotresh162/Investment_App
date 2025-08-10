import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/company_model.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../api/company_api.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository repository;
  List<Company> allCompanies = []; // store original list

  CompanyBloc(this.repository) : super(CompanyInitial()) {
    on<FetchCompanies>(_onFetchCompanies);
    on<SearchItems>(_onSearchItems);
  }

  Future<void> _onFetchCompanies(
      FetchCompanies event,
      Emitter<CompanyState> emit,
      ) async {
    emit(CompanyLoading());
    try {
      final companies = await repository.fetchCompanies(); // List<Company>
      allCompanies = companies;
      emit(CompanyLoaded(companies));
    } catch (e) {
      emit(CompanyError(e.toString()));
    }
  }

  void _onSearchItems(
      SearchItems event,
      Emitter<CompanyState> emit,
      ) {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      emit(CompanyLoaded(allCompanies));
      return;
    }

    final filtered = allCompanies.where((company) {
      final name = company.companyName?.toLowerCase() ?? '';
      final isin = company.isin?.toLowerCase() ?? '';
      return name.contains(query) || isin.contains(query);
    }).toList();

    emit(CompanyLoaded(filtered));
  }
}
