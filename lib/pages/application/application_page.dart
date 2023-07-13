import 'package:firstmonie/common/values/colors.dart';
import 'package:firstmonie/pages/application/application_widgets.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            body: buildPage(_index),
            bottomNavigationBar: Container(
              width: 375,
              height: 58,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ]),
              child: BottomNavigationBar(
                currentIndex: _index,
                onTap: (value) {
                  setState(() {
                    _index = value;
                  });
                  print(_index);
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourthElementText,
                items: [
                  BottomNavigationBarItem(
                    label: "home",
                    icon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/home.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/home.png',
                          color: AppColors.primaryElement),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "search",
                    icon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/search2.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/search2.png',
                          color: AppColors.primaryElement),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "course",
                    icon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/play-circle1.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/play-circle1.png',
                          color: AppColors.primaryElement),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "chat",
                    icon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/message-circle.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/message-circle.png',
                          color: AppColors.primaryElement),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "profile",
                    icon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/person2.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15,
                      height: 15,
                      child: Image.asset('assets/icons/person.png',
                          color: AppColors.primaryElement),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
