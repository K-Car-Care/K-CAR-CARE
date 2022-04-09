import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class DateFilterOption extends StatefulWidget {
  const DateFilterOption({ Key? key }) : super(key: key);

  @override
  _DateFilterOptionState createState() => _DateFilterOptionState();
}

class _DateFilterOptionState extends State<DateFilterOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: white,
      ),
      child:SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            BuildLineTop(context: context),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/6816/6816624.png',width: 25,height: 25,),
                ),
                title: Text('Today',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/4285/4285599.png',width: 25,height: 25,),
                ),
                title: Text('Yesterday',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/4285/4285646.png',width: 25,height: 25,),
                ),
                title: Text('Lask Week',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child:  Image.network('https://cdn-icons-png.flaticon.com/512/3652/3652191.png',width: 25,height: 25,),
                ),
                title: Text('Last Two Weeks',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/4285/4285650.png',width: 25,height: 25,),
                ),
                title: Text('Last Month',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                      // shape: BoxShape.circle
                      ),
                  padding: const EdgeInsets.all(10),
                  // alignment: Alignment.center,
                  child:  Image.network('https://cdn-icons-png.flaticon.com/512/4285/4285652.png',width: 25,height: 25,),
                ),
                title: Text('Date Rang',  style: subTitleTextStyleBlack.copyWith(fontWeight: FontWeight.w600)),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}



class BuildLineTop extends StatelessWidget {
  const BuildLineTop({
    Key? key,
    @required this.context,
  }) : super(key: key);

  final BuildContext? context;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 100,
        height: 3,
        decoration: BoxDecoration(
            color: grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
