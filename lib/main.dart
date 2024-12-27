import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahul_bloc_login/features/auth/bloc/auth_bloc.dart';
import 'package:rahul_bloc_login/features/home/screen/home_screen.dart';

import 'features/home/bloc/home_bloc.dart';
// import 'package:rahul_bloc_login/features/auth/screen/login_page.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(LoadHomeData()),
        ),
      ],
      child: MaterialApp(
        title: 'BLoC Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        // home: const LoginPage(),
        home: const HomeScreen(),
      ),
    );
  }
}
