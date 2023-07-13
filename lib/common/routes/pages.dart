import 'package:firstmonie/common/routes/routes.dart';
import 'package:firstmonie/pages/welcome/bloc/welcome_blocs.dart';
import 'package:firstmonie/pages/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  List<PageEntity> routes = [
    PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ))
  ];
}

//unify blocProvider,routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
