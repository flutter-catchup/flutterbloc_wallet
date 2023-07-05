import 'package:firebase_core/firebase_core.dart';
import 'package:firstmonie/http_helper.dart';
import 'package:firstmonie/pages/bloc_providers.dart';
import 'package:firstmonie/pages/register/register.dart';
import 'package:firstmonie/pages/sign_in/sign_in.dart';
import 'package:firstmonie/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/values/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _httpHelper = HTTPHelper();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _httpHelper),
      ],
      child: MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: AppColors.primaryText),
                    elevation: 0,
                    backgroundColor: Colors.white)),
            home: const Welcome(),
            routes: {
              //'myHomePage': (context) => const MyHomePage(),
              'signIn': (context) => const SignIn(),
              'register': (context) => const Register(),
            },
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         shadowColor: Colors.white,
//       ),
//       body: Center(
//         child: BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 "${BlocProvider.of<AppBlocs>(context).state.counter}",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         }),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           FloatingActionButton(
//             heroTag: 'heroTag1',
//             onPressed: () =>
//                 BlocProvider.of<AppBlocs>(context).add(Increment()),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             heroTag: 'heroTag2',
//             onPressed: () =>
//                 BlocProvider.of<AppBlocs>(context).add(Decrement()),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
