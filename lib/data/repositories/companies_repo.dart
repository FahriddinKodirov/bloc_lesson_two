import 'package:bloc_dio_app/data/api_service/api_service.dart';
import 'package:bloc_dio_app/data/model/my_response/my_response.dart';

class CompaniesRepo {
  CompaniesRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getSingleCompanies() =>
      apiService.getSingleCompanies();

}