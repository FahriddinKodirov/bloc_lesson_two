import 'package:bloc_dio_app/bloc/companies_cubit.dart';
import 'package:bloc_dio_app/data/api_service/api_service.dart';
import 'package:bloc_dio_app/data/repositories/companies_repo.dart';
import 'package:bloc_dio_app/screen/companies_one_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
     BlocProvider(create: (context) => CompaniesCubit(CompaniesRepo(apiService: ApiService())))
  ], child: const MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CompaniesOnePage(),
    );
  }
}

