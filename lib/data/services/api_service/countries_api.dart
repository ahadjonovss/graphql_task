import 'package:graphql/client.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/utils/my_locale.dart';

class GetCountriesInFailury implements Exception {}

var json = {
  "countries":{
    "name":"BR"
  }
};

class CountriesApiClient{

  Future<List<CountryModel>> getCountries() async {
    final result = await getIt<GraphQLClient>().query(QueryOptions(document: gql('''
  query GetCountries() {
    countries {
    name
    native
    capital
    emoji
    currency
    }
  }
''')));
    if (result.hasException) throw GetCountriesInFailury();
    final data = result.data?['countries'] as List;
    print(data);
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  Future<CountryModel> getSingleCountry(String name) async {
    final result = await getIt<GraphQLClient>().query(QueryOptions( variables:{
    "countries":{
    "name":"$name"
    }
    },document: gql('''
  query GetCountries() {
    countries {
    name
    native
    capital
    emoji
    currency
    }
  }
''')));
    if (result.hasException) throw GetCountriesInFailury();
    final data = result.data?['countries'] as List;
    print(data);
    return CountryModel.fromJson(data[0]);
  }
  }



