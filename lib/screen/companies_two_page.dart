import 'package:bloc_dio_app/bloc/companies_cubit.dart';
import 'package:bloc_dio_app/bloc/companies_state.dart';
import 'package:bloc_dio_app/data/api_service/api_service.dart';
import 'package:bloc_dio_app/data/repositories/companies_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesTwoPage extends StatelessWidget {
  const CompaniesTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CompaniesCubit(CompaniesRepo(apiService: ApiService())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Builder Page'),
        ),
        body: BlocBuilder<CompaniesCubit, CompaniesState>(
          builder: (context, state) {
            if (state is InitialCompaniesState) {
              return const Text('data yoq', style: TextStyle(fontSize: 24));
            } else if (state is LoadCompaniesInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCompaniesInSuccess) {
              return ListView.builder(
                itemCount: state.companies.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(state.companies.data[index].carModel.toString()),
                    trailing: Image.network(state.companies.data[index].logo),
                    subtitle: Text(
                        state.companies.data[index].establishedYear.toString()),
                  );
                },
              );
            } else if (state is LoadCompaniesInFailure) {
              return Center(child: Text(state.errorText));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
