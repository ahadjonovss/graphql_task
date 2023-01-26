import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:graphql_task/data/services/api_service/countries_api.dart';
final getIt = GetIt.instance;

final Link _link = HttpLink(
 'https://countries.trevorblades.com',
);

void setup() {
 getIt.registerLazySingleton(() => GraphQLClient(cache: GraphQLCache(),link:_link ));
 getIt.registerLazySingleton(() => CountriesApiClient());
}