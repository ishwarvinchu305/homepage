import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homepage/constants.dart';
import 'package:homepage/screens/details_screen.dart';
import 'package:homepage/widgets/bottom_nav_bar.dart';
import 'package:homepage/widgets/category_card.dart';
import 'package:homepage/widgets/search_bar.dart';
import 'package:homepage/Screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthyCommunity',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen1(),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 155, 195),
                // image: DecorationImage(
                //   alignment: Alignment.centerLeft,
                //   // image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                // ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/menu.svg"),
                        ),
                      ),
                      Text(
                        "Good Morning \nRIKGDA",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      SearchBar(),
                      Expanded(
                          child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: .85,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: <Widget>[
                            CategoryCard(
                              title: "Nutrition \n Cycle",
                              svgSrc: "assets/icons/Hamburger.svg",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  }),
                                );
                              },
                            ),
                            CategoryCard(
                              title: "Height and Weight \n  Index",
                              svgSrc: "assets/icons/Excrecises.svg",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "  Daily \n Exercises",
                              svgSrc: "assets/icons/Excrecises.svg",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "Disease Symtoms and Cure",
                              svgSrc: "assets/icons/Meditation.svg",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailsScreen();
                                  }),
                                );
                              },
                            ),
                            CategoryCard(
                              title: "Healthy Community",
                              svgSrc: "assets/icons/yoga.svg",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "Degree of\nIllness",
                              svgSrc: "assets/icons/yoga.svg",
                              press: () {},
                            ),
                          ])),
                    ]),
              ),
            ),
          ],
        ));
  }
}
