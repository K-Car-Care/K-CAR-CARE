import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/screen/history_screen.dart/main_history_screen.dart';
import 'package:k_car_care_project/screen/home_screen/home_screen.dart';
import 'package:k_car_care_project/screen/promotion/components/main_promotion.dart';
import '../towing_company/main_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _currentPage;

  @override
  void initState(){
    _currentPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: getPage(_currentPage!),
      bottomNavigationBar: AnimatedBottomNav(
          isPromotion:true,
          scaffoldKey: scaffoldKey,
          currentIndex: _currentPage!,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }

  getPage(int page) {
    switch (page) {
      case 0:
        return const MyHomeScreen();
      case 1:
        return const TowingCompany();
      case 2:
        return const HisstoryScreen();
      case 3:
        return const WelcomeScreen();
    }
  }
}

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final bool isPromotion;
  final Function(int) onChange;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AnimatedBottomNav(
      {
        Key? key, 
        required this.currentIndex, 
        required this.onChange, 
        required this.scaffoldKey,
        required this.isPromotion, 
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: const BoxDecoration(
        color: white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            // offset: Offset(15.0, 20.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onChange(0),
              child: BottomNavItem(
                isPromotion:false,
                icon: Icons.home_rounded,
                title:'Home',
                isActive: currentIndex == 0,
                inactiveColor: Colors.grey,
                activeColor: defaultColor,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(1),
              child: BottomNavItem(
                isPromotion:false,
                icon: Icons.commute_rounded,
                title: "Towing",
                isActive: currentIndex == 1,
                inactiveColor: Colors.grey,
                activeColor: defaultColor,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(2),
              child: BottomNavItem(
                isPromotion:false,
                icon: Icons.description_rounded,
                title: "History",
                isActive: currentIndex == 2,
                inactiveColor: Colors.grey,
                activeColor: defaultColor,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(3),
              child: BottomNavItem(
                isPromotion:false,
                icon: Icons.school_rounded,
                title: "Promotion",
                isActive: currentIndex == 3,
                inactiveColor: Colors.grey,
                activeColor: defaultColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;
  final bool isPromotion;
  const BottomNavItem(
      {Key? key,
      this.isActive = false,
      required this.icon,
      required this.activeColor,
      required this.inactiveColor,
      required this.title,
      required this.isPromotion,
    })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (isActive) Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,style: TextStyle(color:activeColor,fontWeight: FontWeight.w700)),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor,
                    ),
                  ),
                ],
              ),
            ) else Icon(
              icon,
              size: 27,
              color: inactiveColor,
            ),
          isPromotion? 
          Positioned(
            top:0,
            left: 0,
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
              ),
            ),
          ):Container(),
        ],
      ),
    );
  }
}
