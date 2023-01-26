import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/state_managers/cubit/country_cubit.dart';
import 'package:country_icons/country_icons.dart';

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
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Flag.fromString('${state.country!.code}', height: null, width: null),
                      Text("Country:  "+state.country!.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text("Langiage:  "+state.country!.native,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                      Text("Phone code:  "+state.country!.phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),

                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
