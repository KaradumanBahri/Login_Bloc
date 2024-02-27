import 'package:flutter/material.dart';
import 'package:login_bloc/views/login/widgets/login_button.dart';
import 'package:login_bloc/views/login/widgets/password_textfield.dart';
import 'package:login_bloc/views/login/widgets/username_textfield.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameTextField(),
          PasswordTextField(),
          const SizedBox(
            height: 15,
          ),
          LoginButton(
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
