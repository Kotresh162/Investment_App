import '../../models/company_model.dart';

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> companies;

  CompanyLoaded(this.companies);
}

class CompanyError extends CompanyState {
  final String message;

  CompanyError(this.message);
}
