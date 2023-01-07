import 'package:bloc_dio_app/bloc/companies_state.dart';
import 'package:bloc_dio_app/data/model/my_response/my_response.dart';
import 'package:bloc_dio_app/data/repositories/companies_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final CompaniesRepo companiesRepo;

  CompaniesCubit(this.companiesRepo) : super(InitialCompaniesState()){
    fetchCompanies();
  }

  fetchCompanies() async {
    emit(LoadCompaniesInProgress());
    MyResponse myResponse = await companiesRepo.getSingleCompanies();
    if (myResponse.error.isEmpty) {
      emit(LoadCompaniesInSuccess(companies: myResponse.data));
    } else {
      emit(LoadCompaniesInFailure(errorText: myResponse.error));
    }
  }
}
