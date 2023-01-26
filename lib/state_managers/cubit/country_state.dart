
part of 'country_cubit.dart';

class CountryState extends Equatable{
  String error;
  List<CountryModel> countries;
  Status status;

  CountryState({required this.status, required this.countries,required  this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [
    error,
    countries,
    status
  ];

}

enum Status{
  PURE,
  SUCCESS,
  ERROR,
  LOADING
}
