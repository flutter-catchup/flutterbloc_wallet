import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(5.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        //height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: const Center(
      child: Text(
        "Log In",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 18,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}

//we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 20),
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("apple"),
        _reusableIcons("facebook")
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.normal,
          fontSize: 15),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: AppColors.primaryFourthElementText),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            margin: const EdgeInsets.only(left: 15),
            height: 18,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: const TextStyle(
                      color: AppColors.primarySecondaryElementText)),
              style: const TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Rubik",
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
    margin: const EdgeInsets.only(left: 25),
    width: 260,
    height: 44,
    child: GestureDetector(
        onTap: () {},
        child: const Text(
          "Forgot password?",
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 13),
        )),
  );
}

Widget buildLogInAndRegButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(
          left: 25, right: 25, top: buttonType == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              //check for registration button border color
              color: buttonType == 'login'
                  ? Colors.transparent
                  : AppColors.primaryText),
          boxShadow: const [
            BoxShadow(spreadRadius: 0.1, blurRadius: 1),
          ]),
      child: Center(
        child: Text(buttonName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
            )),
      ),
    ),
  );
}
