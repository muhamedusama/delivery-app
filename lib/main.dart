import 'package:delivery/screens/login/cubit/cubit.dart';
import 'package:delivery/screens/login/login.dart';
import 'package:delivery/shared/network/network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key}
  //
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.teal,
            ),
        ),
        home: Scaffold(
          backgroundColor: Colors.teal,
        ),
        initialRoute: 'login_screen' ,
        routes: {
          'login_screen': (context)=> LoginScreen(),
        },
      );
  }
}