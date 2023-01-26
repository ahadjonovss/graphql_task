import 'package:flutter/material.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';

class CountryPage extends StatelessWidget {
  CountryModel countryModel;
   CountryPage({required this.countryModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(countryModel.name ),),
    );
  }
}
