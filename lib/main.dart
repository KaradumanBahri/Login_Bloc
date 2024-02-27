import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/views/login/login_screen.dart';
import 'package:login_bloc/views/repository/auth/login/login_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
        primarySwatch: Colors.purple,
      ),
      home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: LoginScreen(),
      ),
    );
  }
}
