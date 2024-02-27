import 'package:equatable/equatable.dart';
import 'package:login_bloc/views/auth/form_submission_status.dart';

class LoginState extends Equatable {
  final String Username;
  bool get isValidUsername => Username.length > 3;

  final String Password;
  bool get isValidPassword => Password.length > 6;

  final FormSubmissionStatus formStatus;

  const LoginState({
    this.Username = '',
    this.Password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWrite(
      {String? username, String? Password, FormSubmissionStatus? formStatus}) {
    return LoginState(
      Username: username ?? this.Username,
      Password: Password ?? this.Password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [Username, Password, formStatus];
}
