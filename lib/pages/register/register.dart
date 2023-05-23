import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("Or use your email account to login")),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(top: 36.h),
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    const SizedBox(
                      height: 5,
                    ),
                    buildTextField("Enter your email address", "email", "user",
                        (value) {
                      context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    reusableText("Password"),
                    buildTextField("Enter your password", "password", "lock",
                        (value) {
                      context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              forgotPassword(),
              const SizedBox(
                height: 30,
              ),
              buildLogInAndRegButton("Log In", 'login', () {
                SignInController(context: context).handleSignIn('email');
              }),
              const SizedBox(
                height: 10,
              ),
              buildLogInAndRegButton("Register", 'Register', () {
                Navigator.of(context).pushNamed('register');
              }),
            ],
          ),
        ),
      )),
    );
  }
}
