
import 'package:bloc/bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/data/services/api_service/countries_api.dart';
import 'package:graphql_task/utils/my_locale.dart';
import 'package:meta/meta.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<GetAllCountries, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<GetAllCountries>(getAllCountries);
  }

  getAllCountries(event, emit) async {
  emit(GettingCountriesInProgress());
  // await Future.delayed(Duration(seconds: 2));
  try{
    final countries = await getIt<CountriesApiClient>().getCountries();
    emit(GettingCountriesInSuccess(countries: countries));
  }catch(e){
    print(e.toString());
    emit(GettingCountriesInFailury(status: e.toString()));

  }


  }
}
