import 'package:firstmonie/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home/cubit/posts_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> getPosts() async {
    final postsCubit = context.read<PostsCubit>();
    await postsCubit.getPosts();
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

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
              Container(
                margin: EdgeInsets.only(top: 66.h),
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    const SizedBox(
                      height: 5,
                    ),
                    buildTextField("Enter your email address", "email", "user"),
                    const SizedBox(
                      height: 5,
                    ),
                    reusableText("Password"),
                    buildTextField("Enter your password", "password", "lock")
                  ],
                ),
              ),
              forgotPassword(),
              buildLogInAndRegButton("Log In", 'Login'),
              buildLogInAndRegButton("Register", 'Register')
            ],
          ),
        ),
      )),
    );
  }
}
