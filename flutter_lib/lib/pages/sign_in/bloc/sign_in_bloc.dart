import 'package:bloc/bloc.dart';
import 'package:flutter_lib/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_lib/pages/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    //print('my email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    //print('my password is ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
