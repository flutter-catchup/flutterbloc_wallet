import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstmonie/common/widgets/flutter_toast.dart';
import 'package:firstmonie/pages/register/bloc/register_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name cannot be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'Email cannot be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Password confirmation is wrong');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email.To activate it please check your email");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-is-already-in-use') {
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email is invalid');
      }
    }
  }
}
