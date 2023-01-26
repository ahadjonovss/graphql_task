import 'package:bloc/bloc.dart';
import 'package:graphql_task/data/models/country_model/country_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState(status: Status.PURE,error: "",countries: []));
}
