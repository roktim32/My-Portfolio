import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_profile/myprojects.dart';
import 'package:my_profile/recommended_job_model.dart';
import 'package:my_profile/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<RecommendedJobModel> recommendedJobs = [
    RecommendedJobModel("C++", "assets/C++.png", Color(0xFFE8EAF6)),
    RecommendedJobModel("Python", "assets/python_logo.png", Color(0xFFE8EAF6)),
    RecommendedJobModel(
        "Flutter", "assets/flutter_logo.png", Color(0xFFE8EAF6)),
    RecommendedJobModel("HTML", "assets/html_logo.png", Color(0xFFE8EAF6)),
    RecommendedJobModel("CSS", "assets/css_logo.png", Color(0xFFE8EAF6)),
    RecommendedJobModel("UI/UX", "assets/xd_logo.png", Color(0xFFE8EAF6)),
    RecommendedJobModel("Photoshop", "assets/ps_logo.png", Color(0xFFE8EAF6)),
  ];

  final List<MyProjects> myProjects = [
    MyProjects("BMI Calculator", Color(0xFF37474F)),
    MyProjects("My Portfolio", Color(0xFF37474F)),
    MyProjects("Shop App", Color(0xFF37474F)),
    MyProjects("Dice roller", Color(0xFF37474F)),
    MyProjects("Xylophone", Color(0xFF37474F)),
    // MyProjects("BMI Calculator", Colors.blue.shade300),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFAFAFAFA),
      drawer: Drawer(
        key: _key,
        child: Text("Bonabo baki ase"),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFF),
        elevation: 0,
        leading: Builder(builder: (
          context,
        ) {
          return IconButton(
            icon: Image.asset("assets/hamburger_menu.png"),
            onPressed: () {
              // _key.currentState!.openDrawer();
              Scaffold.of(context).openDrawer();
              //print("hi");
            },
          );
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Image.asset("assets/hamburger_menu.png"),
                    // ),

                    // Stack(
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       icon: Image.asset("assets/notification_icon.png"),
                    //     ),
                    //     Positioned(
                    //       right: 8,
                    //       child: Container(
                    //         height: 16.0,
                    //         width: 16.0,
                    //         decoration: BoxDecoration(
                    //           color: Colors.red,
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "Roktim Kamal Senapoty",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Software Engineer",
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.pink.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10.0,
                              offset: Offset(0.0, 4.0)),
                        ],
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: Image.asset(
                            "assets/profile1.png",
                          ).image,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xFF303F9F),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 4.0)),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildInfo('HS', 'Science\nVKV'),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.white,
                    ),
                    buildInfo(
                        'B.Tech', ' Computer Science\nKaziranga University'),
                  ],
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Skills",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 156,
                padding: EdgeInsets.only(left: 24),
                child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedJobs.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 4.0)),
                            ],
                            color: recommendedJobs[index].backgroundColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 34,
                              ),
                              Text(
                                recommendedJobs[index].jobTitle,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              // SizedBox(
                              //   height: 16,
                              // ),
                              // Text(
                              //   "Flutter Mobile\nDeveloper",
                              //   style: TextStyle(
                              //     fontFamily: "Avenir",
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 14,
                              //     color: Colors.grey.shade700,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment(0.0, -1.2),
                            child: Image.asset(
                              recommendedJobs[index].companyImageSource,
                              scale: 0.7,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Projects",
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  children: List.generate(myProjects.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        // color: Colors.blueAccent,
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //         color: Colors.black.withOpacity(0.2),
                        //         blurRadius: 10.0,
                        //         offset: Offset(0.0, 4.0)),
                        //   ],
                        // ),
                        child: Chip(
                          label: Text(
                            myProjects[index].projectName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          padding: EdgeInsets.all(6),
                          elevation: 6,
                          shadowColor: Colors.black.withOpacity(0.8),
                          backgroundColor: myProjects[index].backgroundColor,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  child: Image.asset(
                    "assets/4_Victory_011.png",
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                openurl();
              },
              // => Utils.openLink(url: 'http://pub.dev'),
              // icon: Image.asset(
              //   "assets/instagram_icon.png",
              //   scale: 0.5,
              // ),
              icon: Icon(Icons.account_box_outlined),
            ),
            IconButton(
              onPressed: () {
                openurl2();
              },
              icon:
                  // Icon(Icons.account_circle)
                  Image.asset(
                "assets/linkedin_icon.png",
                scale: 0.5,
              ),
            ),
            IconButton(
              // iconSize: 15,
              onPressed: () {
                openurl3();
              },
              // icon: Image.asset(
              //   "assets/message_icon.png",
              //   scale: 0.5,
              // ),
              icon: Icon(Icons.email),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildInfo(String value, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w900,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w900,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

openurl() {
  String url1 = "https://www.instagram.com/roktim._/";
  launch(url1);
}

openurl2() {
  String url1 = "https://www.linkedin.com/in/roktim-kamal-senapoty-939a0b1b1/";
  launch(url1);
}

openurl3() {
  String url1 = "mailto:roktimsenapoty2@gmail.com";
  launch(url1);
}
