

import 'package:flutter/material.dart';
import 'package:k_car_care_project/core/constant/app_images.dart';
import 'package:k_car_care_project/core/constant/theme_constant.dart';
import 'package:k_car_care_project/core/shared/typography.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          backgroundColor: defaultColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('អំពីយើង',style: subTitleTextStyleWhite),
          actions: [
            IconButton(
              icon: (const Icon(Icons.notifications, color: Colors.white)),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:  Image.asset(AppImages.logoImg, width: 100),
              ),
              const SizedBox(height: 7),
              Text(
                "សាលា គម្ពីរជាវេទិកានិម្មិត សម្រាប់សិស្សានុសិស្ស គ្រូបង្រៀន និងអ្នកជំនាញធ្វើការចែករំលែកចំនេះដឹងទៅកាន់អ្នកសិក្សាដទៃទៀត។ អ្នកអាចបើកមើលឬបង្កើតមេរៀននៅលើវេទិកាដោយឥតគិតថ្លៃព្រមទាំងបង្កើតសាលារៀនមួយផងដែរ។សាលារៀននិមួយៗមានបង្រៀនមុខជំនាញខុសៗគ្នាជាច្រើនដែលក្នុងនោះមានវិទ្យាសាស្រ្ត បច្ចេកវិទ្យា វិស្វកម្ម សិល្បៈ និងគណិតវិទ្យា។ សាលារៀនមួយចំនួនក៏មានវត្តមានពិតនៅក្នុងប្រទេសកម្ពុជាផងដែរ។ ពួកយើងពិតជាចង់ឃើញសាលារៀននិងអ្នកបង្កើតមាតិកាបន្ថែមទៀតនៅលើវេទិកានេះ ដើម្បីឲ្យសិស្សានុសិស្សទទួលបានចំនេះដឹងកាន់តែច្រើន។ ការចូលរួមរបស់អ្នកនឹងធ្វើឲ្យមានការផ្លាស់ប្តូរនិងរីកចម្រើនក្នុងវិស័យអប់រំឌីជីថលរបស់ប្រទេសកម្ពុជា ដោយស្របទៅតាមទស្សនវិស័យ និងបេសកម្មរបស់សាលាគម្ពីរ យើងចង់ផ្ដល់ភាពងាយស្រួលដល់ការសិក្សា ហើយធ្វើការប្រែក្លាយវាទៅជាឧបករណ៍មួយដែលមានសារប្រយោជន៍និង ជួយជម្រុញដល់អ្នកសិក្សាជំនាន់ក្រោយរបស់ពួកយើងដើម្បីឲ្យមានការប្រកួតប្រជែងឈានទៅរកការរីកចម្រើន។​ ហើយវាជាផ្នែកមួយដែលយើងអាចធ្វើការលើកស្ទួយដល់សង្គមជាតិរបស់យើង ដោយចាប់ផ្ដើមធ្វើការចែករំលែកនូវចំនេះដឹងរបស់ពួកយើង។ ",
                textAlign: TextAlign.justify,
                style: bodyTextStyleBlack,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('គាំទ្រ និងរក្សាសិទ្ធដោយ',
                    style: subTitleTextStyleBlack
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(AppImages.logoImg, height: 70),
                  ),
                  Expanded(
                    child:  Image.asset(AppImages.logoImg, height: 70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
