import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/company_api.dart';
import '../models/company_details.dart';
import 'comapny_state.dart';

class CompanyDetailCubit extends Cubit<CompanyDetailState> {
  final CompanyRepository repository;

  CompanyDetailCubit(this.repository) : super(CompanyDetailLoading());

  Future<void> fetchCompanyDetail() async {
    emit(CompanyDetailLoading());
    try {
      final CompanyDetail detail = await repository.fetchCompanyDetails();
      emit(CompanyDetailData(detail));
    } catch (e) {
      emit(CompanyDetailError(e.toString()));
    }
  }
}