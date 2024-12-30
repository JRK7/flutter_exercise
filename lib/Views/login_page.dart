import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exercise/ViewModel/ProductList/product_list_bloc.dart';
import 'package:flutter_exercise/ViewModel/ProductList/product_list_repository.dart';
import 'package:flutter_exercise/ViewModel/TabViewModel/Bloc/tab_selection_bloc.dart';
import 'package:flutter_exercise/Views/guest_dashboard.dart';

import '../ViewModel/Login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocConsumer<LoginBloc, LoginSubmit>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                children: [
                  TextFormField(
                    controller: _controllerUserName,
                    decoration: const InputDecoration(hintText: "User name"),
                    onChanged: (text) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginUserNameEvent(text));
                    },
                  ),
                  TextFormField(
                    controller: _controllerPassword,
                    decoration: const InputDecoration(hintText: "Password"),
                    obscureText: true,
                    onChanged: (text) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginPasswordEvent(text));
                      // Rebuild when the text changes
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: state.userName.isEmpty ||
                              state.password.isEmpty
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                          create: (_) => TabSelectionBloc()),
                                      BlocProvider(
                                          create: (_) => ProductListBloc(
                                              repository:
                                                  ProductListRepository())),
                                    ],
                                    child: GuestDashboard(),
                                  ),
                                ),
                              );
                            },
                      focusNode: null,
                      child: const Text("Login"),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
