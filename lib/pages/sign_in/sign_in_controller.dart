import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstmonie/common/widgets/flutter_toast.dart';
import 'package:firstmonie/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: 'You need to fill in email address');
          return;
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: 'You need to fill in password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            print('user exist');
            toastInfo(msg: 'User exists');
            //we got verified user from firebase
          } else {
            toastInfo(msg: "Currently you're not a user of this App");
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user_not_found') {
            print('No user found for that email.');
            toastInfo(msg: 'No user found for that email');
          } else if (e.code == 'wrong password') {
            print('Wrong password provided for that user');
            toastInfo(msg: 'Wrong password provided for that user');
          } else if (e.code == 'invalid-email') {
            print('Your email format is incorrect');
            toastInfo(msg: 'Your email format is wrong');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
