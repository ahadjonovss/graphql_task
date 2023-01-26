import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_task/app/app.dart';
import 'package:graphql_task/app/bloc_observer.dart';
import 'package:graphql_task/utils/my_locale.dart';

import 'ui/all_countries_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setup();
  runApp(const App());
}


