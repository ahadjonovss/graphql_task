
part of 'country_cubit.dart';

class CountryState extends Equatable{
  String error;
  CountryModel? country;
  Status status;

  CountryState({required this.status,  this.country,required  this.error});

  copyWith({
    String? error,
    Status? status,
    CountryModel? country,
}){
  return CountryState(status: status??this.status, country: country??this.country, error: error??this.error);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    error,
    country,
    status
  ];

}

enum Status{
  PURE,
  SUCCESS,
  ERROR,
  LOADING
}
