import 'package:firstmonie/pages/sign_in/bloc/sign_in_events.dart';
import 'package:firstmonie/pages/sign_in/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {});
  }
}
