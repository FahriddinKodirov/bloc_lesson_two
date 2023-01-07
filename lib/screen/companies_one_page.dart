import 'package:bloc_dio_app/bloc/companies_cubit.dart';
import 'package:bloc_dio_app/bloc/companies_state.dart';
import 'package:bloc_dio_app/screen/companies_two_page.dart';
import 'package:bloc_dio_app/util/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesOnePage extends StatelessWidget {
  const CompaniesOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer Page'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CompaniesTwoPage()));
          }, icon: const Icon(Icons.queue_play_next_sharp))
        ],
      ),
      body: BlocConsumer<CompaniesCubit,CompaniesState>(
        builder: (context, state) {
          if(state is InitialCompaniesState){
            return const Text('data yoq',style: TextStyle(fontSize: 24));
          } else if(state is LoadCompaniesInProgress){
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else if(state is LoadCompaniesInSuccess) {
            return ListView.builder(
              itemCount: state.companies.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                title: Text(state.companies.data[index].carModel),
                trailing: Image.network(state.companies.data[index].logo),
                );
                
              },
            );
          } else if(state is LoadCompaniesInFailure){
            return Center(child: Text(state.errorText));
          }
          return const SizedBox();
        }, 
        listener: (context, state) {
          if(state is LoadCompaniesInSuccess){
            MyUtils.getMyToast(message: 'Datanig lenth: ${state.companies.data.length}');
          } else {
            MyUtils.getMyToast(message: 'hatolik yuz berdi');
          }
        }),
    );
  }
}