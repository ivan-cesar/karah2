import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/notifiers/authNotifier.dart';
import 'package:canteen_food_ordering_app/screens/adminHome.dart';
import 'package:canteen_food_ordering_app/screens/login.dart';
import 'package:canteen_food_ordering_app/screens/signup.dart';
import 'package:canteen_food_ordering_app/screens/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
// import 'package:foodlab/api/food_api.dart';
// import 'package:foodlab/screens/login_signup_page.dart';
// import 'package:foodlab/notifier/auth_notifier.dart';
// import 'package:foodlab/screens/navigation_bar.dart';
// import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier, context);
    super.initState();
    final List<String> imgList = [
       'Mozart',
      'ivan',
      'cesr'
    ];
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/',
              fit: BoxFit.contain,
            ),
            SizedBox(width: 50,),
            GestureDetector(
              onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginPage();
                    })) :
                (authNotifier.userDetails == null) ? print('wait') :
                (authNotifier.userDetails.role == 'admin')?
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdminHomePage();
                  },
                )):  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NavigationBarPage(selectedIndex: 1);
                  },
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(1, 70, 134, 1.0)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "J'AI UNE QUESTION",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(1, 70, 134, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
            Text(
              'Karah',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontFamily: 'MuseoModerno',
              ),
            ),
            Text(
              '',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 17,
                color: Color.fromRGBO(252, 188, 126, 1),
              ),
            ),
            SizedBox(
                height:230,
                //height: 200.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    Image.asset("images/1.png",fit: BoxFit.cover,),
                    Image.asset("images/2.png",fit: BoxFit.cover,),
                    Image.asset("images/3.png",fit: BoxFit.cover,),

                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.grey,
                  indicatorBgPadding: 5.0,
                  dotIncreasedColor: Colors.blue,
                  dotBgColor: Colors.transparent,
                  borderRadius: true,
                )
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage();
                  })) :
                (authNotifier.userDetails == null) ? print('wait') :
                  (authNotifier.userDetails.role == 'admin')?
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AdminHomePage();
                      },
                    )):  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return NavigationBarPage(selectedIndex: 1);
                      },
                    ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "SE CONNECTER",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignupPage();
                    })) :
                (authNotifier.userDetails == null) ? print('wait') :
                (authNotifier.userDetails.role == 'admin')?
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdminHomePage();
                  },
                )):  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NavigationBarPage(selectedIndex: 1);
                  },
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(221, 232, 253, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "S'INSCRIRE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(1, 70, 134, 1.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'POWERD BY PROPULSE GROUP',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
                fontFamily: 'MuseoModerno',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
