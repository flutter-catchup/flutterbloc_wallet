
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_in/widgets/sign_in_widget.dart';
import 'bloc/register_bloc.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: reusableText(
                            "Enter your details below and free sign up")),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          buildTextField("Enter your user name", "name", "user",
                                  (value) {
                                context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                          reusableText("Email"),
                          buildTextField("Enter your Email", "email", "user",
                                  (value) {
                                context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                          reusableText("Password"),
                          buildTextField("Enter your password", "password", "lock",
                                  (value) {
                                context.read<RegisterBloc>().add(PasswordEvent(value));
                              }),
                          reusableText("Re-enter your password"),
                          buildTextField("Re-enter your password to confirm",
                              "password", "lock", (value) {
                                context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child:
                      reusableText("Enter your details below and free sign up"),
                    ),
                    buildLogInAndRegButton("Sign Up", 'login', () {
                      Navigator.of(context).pushNamed('register');
                    }),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
