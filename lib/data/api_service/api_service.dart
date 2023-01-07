import 'package:bloc_dio_app/data/model/companies_model/companies.dart';
import 'package:bloc_dio_app/data/model/my_response/my_response.dart';
import 'package:dio/dio.dart';

import 'api_client.dart';

class ApiService extends ApiClient {
  
  Future<MyResponse> getSingleCompanies() async {
    MyResponse myResponse = MyResponse(error: "");
    
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");
      if (response.statusCode == 200) {
        myResponse.data = Companies.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
      //print(err.toString());
    }

    return myResponse;
  }

 
}