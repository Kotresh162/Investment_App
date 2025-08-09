import '../models/company_details.dart';

abstract class CompanyDetailState {}

class CompanyDetailLoading extends CompanyDetailState {}

class CompanyDetailError extends CompanyDetailState {
  final String message;
  CompanyDetailError(this.message);
}

class CompanyDetailData extends CompanyDetailState {
  final CompanyDetail detail;
  CompanyDetailData(this.detail);
}