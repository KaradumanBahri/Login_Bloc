import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/bloc/login/login_state.dart';
import 'package:login_bloc/views/auth/form_submission_status.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FromSubmitting
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
    });
  }
}
