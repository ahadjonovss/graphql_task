import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_task/data/country_model/country_model.dart';
import 'package:meta/meta.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<GetAllCountries, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<GetAllCountries>((event, emit) {
      // TODO: implement event handler
    });
  }
}
