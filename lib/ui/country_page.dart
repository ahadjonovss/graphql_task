import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/state_managers/cubit/country_cubit.dart';

class CountryPage extends StatelessWidget {
  CountryModel countryModel;
   CountryPage({required this.countryModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(),
      child: Scaffold(
        appBar: AppBar(title:Text(countryModel.name ),),
        body: Center(
          child: BlocBuilder<CountryCubit,CountryState>(
            builder: (context,  state) {
              if(state.status==Status.PURE){
                print("${countryModel.code}");
                context.read<CountryCubit>().getCountry(countryModel.code);
              }
              if(state.status==Status.SUCCESS){
                return Center(child: Text(state.country!.name,));
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
