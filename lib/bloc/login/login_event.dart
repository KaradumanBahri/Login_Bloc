import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginUsernameChanged extends LoginEvent {
  final String? Username;
  LoginUsernameChanged({this.Username});
  @override
  List<Object?> get props => [Username];
}

class LoginPasswordChanged extends LoginEvent {
  final String? Password;
  LoginPasswordChanged({this.Password});
  @override
  List<Object?> get props => [Password];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}
