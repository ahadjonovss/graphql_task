import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/bloc/countries_bloc/countries_bloc.dart';

class AllCountriesPage extends StatelessWidget {
  const AllCountriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Countries"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountriesBloc>().add(GetAllCountries());

        },
      ),
    );
  }
}
