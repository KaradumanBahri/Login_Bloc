import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/bloc/login/login_state.dart';
import 'package:login_bloc/views/auth/form_submission_status.dart';
import 'package:login_bloc/views/repository/auth/login/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;
  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await mapEventToState(event, emit);
      },
    );
  }
  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      emit(state.copyWrite(username: event.Username));
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWrite(Password: event.Password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWrite(formStatus: FromSubmitting()));

      try {
        await authRepo?.Login();
        emit(state.copyWrite(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
