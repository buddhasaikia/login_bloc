import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Log Me In!",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login Bloc"),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
