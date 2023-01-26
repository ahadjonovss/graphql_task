import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/state_managers/bloc/countries_bloc/countries_bloc.dart';
import 'package:graphql_task/ui/country_page.dart';

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
      body: Center(
        child: BlocBuilder<CountriesBloc,CountriesState>(
          builder: (context, state) {
            if(state is GettingCountriesInProgress){
              return const CircularProgressIndicator();
            }
            if(state is GettingCountriesInSuccess){
              List<CountryModel> countries = state.countries;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: countries.length,
                itemBuilder: (context, index) =>InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CountryPage(countryModel: countries[index]),));
                  },
                    child: ListTile(title: Text(countries[index].name))),);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
