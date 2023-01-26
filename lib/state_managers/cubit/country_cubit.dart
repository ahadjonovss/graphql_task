import 'package:bloc/bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:graphql_task/data/services/api_service/countries_api.dart';
import 'package:graphql_task/utils/my_locale.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState(status: Status.PURE,error: "",));

  getCountry(String name) async {
    emit(state.copyWith(status: Status.LOADING));
    await Future.delayed(Duration(seconds: 2));
    try{
      final country = await getIt<CountriesApiClient>().getSingleCountry(name);
      emit(state.copyWith(status: Status.SUCCESS,country:country));
    }catch(e){
      print(e.toString());
      emit(state.copyWith(status: Status.ERROR,error: e.toString()));

    }

  }
}
