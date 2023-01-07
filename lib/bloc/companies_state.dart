import 'package:bloc_dio_app/data/model/companies_model/companies.dart';

abstract class CompaniesState{}

class InitialCompaniesState extends CompaniesState {}

class LoadCompaniesInProgress extends CompaniesState {}

class LoadCompaniesInSuccess extends CompaniesState {
  LoadCompaniesInSuccess({required this.companies});

  final Companies companies;
}

class LoadCompaniesInFailure extends CompaniesState {
  LoadCompaniesInFailure({required this.errorText});

  final String errorText;
}
