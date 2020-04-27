import 'package:flutter/material.dart';
import 'package:sgpapp/src/block/authentication_bloc/authentication_bloc.dart';
import 'package:sgpapp/src/block/authentication_bloc/authentication_event.dart';
import 'package:sgpapp/src/block/authentication_bloc/authentication_state.dart';
import 'package:sgpapp/src/block/simple_delegate_bloc.dart';
import 'package:sgpapp/src/repository/user_respository.dart';
import 'package:sgpapp/src/ui/home_screen.dart';
import 'package:sgpapp/src/ui/spash_screen.dart';
import 'loginPage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
      child: App(userRepository: userRepository),
    )
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
    : assert (userRepository != null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          if (state is Unauthenticated) {
            return LoginPage();
          }
        },
      ),
    );
  }
}


// void main() => runApp(MyApp());


// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Librasoft App Login',
//       theme: ThemeData(
//         dividerColor: Colors.black,
//         primarySwatch: Colors.blueGrey,
//         buttonTheme: ButtonThemeData(height: 50, buttonColor: Colors.blueAccent),
//         textTheme: TextTheme(
//           button: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ),
//       home: LoginPage(),
//     );
//   }
// }
