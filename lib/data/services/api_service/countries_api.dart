import 'package:graphql/client.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/utils/my_locale.dart';

class GetJobsRequestFailure implements Exception {}

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
    if (result.hasException) throw GetJobsRequestFailure();
    final data = result.data?['countries'] as List;
    print("Data keldi");
    return data
        .map((dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  }



