import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/bloc/login/login_state.dart';
import 'package:login_bloc/views/auth/form_submission_status.dart';
import 'package:login_bloc/views/login/widgets/form_widget.dart';
import 'package:login_bloc/views/repository/auth/login/login_repository.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/yoga.png'),
                  FormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String massage) {
    final snackBar = SnackBar(
      content: Text(massage),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
