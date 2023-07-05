import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lib/pages/register/bloc/register_bloc.dart';
import 'package:flutter_lib/pages/welcome/bloc/welcome_bloc.dart';

import 'sign_in/bloc/sign_in_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        // BlocProvider(lazy: false, create: (context) => AppBlocs(),),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc())
      ];
}
