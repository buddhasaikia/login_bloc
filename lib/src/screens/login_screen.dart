import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: const EdgeInsets.only(top: 20.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "example@email.com",
            labelText: "Email Address",
            errorText: snapshot.hasError ? snapshot.error?.toString() : null,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText: snapshot.hasError ? snapshot.error?.toString() : null),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData
              ? () {
                  print("Hi there!");
                }
              : null,
          child: const Text("Login"),
        );
      },
    );
  }
}
