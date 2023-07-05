import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import '../home/cubit/posts_cubit.dart';
import '../register/bloc/register_bloc.dart';
import 'bloc/sign_in_bloc.dart';
import 'bloc/signin_state.dart';
import 'widgets/sign_in_controller.dart';

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
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Log In"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child: reusableText("Or use your email account to login")),
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
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
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
                buildLogInAndRegButton("Sign Up", 'Register', () {
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
