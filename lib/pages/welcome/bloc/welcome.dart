import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstmonie/pages/welcome/bloc/welcome_blocs.dart';
import 'package:firstmonie/pages/welcome/bloc/welcome_events.dart';
import 'package:firstmonie/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context)
                          .add(WelcomeEvents());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "Next",
                          "One Touch & Send Money",
                          "send money to every one by one step & organize your wallet easier.",
                          "assets/images/Splash_1.png"),
                      _page(
                          2,
                          context,
                          "Next",
                          "Organize your financial Life",
                          "You can save your money now and create limits for all your expenses every month.",
                          "assets/images/Splash_2.png"),
                      _page(
                          3,
                          context,
                          "Go",
                          "Add any Accounts & Manage",
                          "You can track your income, expenses activity & can know all statistics.",
                          "assets/images/Splash_3.png"),
                    ]),
                Positioned(
                  bottom: 10.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(17.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((5.0)))),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black26,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 3) {
              //animation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.linearToEaseOut);
            } else {
              //Jump to new page
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 180.h, left: 25.w, right: 25.w),
            width: 324.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
