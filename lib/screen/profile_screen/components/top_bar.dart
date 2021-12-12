import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildIcon(
              iconData: Icons.arrow_back,
              onTap: () {
                Navigator.pop(context);
              }),
          buildIcon(
            iconData: Icons.logout_outlined,
            onTap: () {
              //Go  Logout
            },
          ),
        ],
      ),
    );
  }

  Widget buildIcon({required Function onTap, required IconData iconData}) {
    return GestureDetector(
      onTap: () {
        return onTap();
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
          padding: const EdgeInsets.all(7),
          // alignment: Alignment.center,
          child: Icon(iconData, color: Colors.black)),
    );
  }
}
