import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/notifiers/authNotifier.dart';
import 'package:canteen_food_ordering_app/screens/forgotPassword.dart';
import 'package:canteen_food_ordering_app/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:canteen_food_ordering_app/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  User _user = new User();
  bool isSignedIn = false, showPassword = true;

  @override
  void initState() {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier, context);
    super.initState();
  }

  void toast(String data){
    Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white
    );
  }

  void _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    RegExp regExp = new RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if(!regExp.hasMatch(_user.email)){
      toast("Enter a valid Email ID");
    } else if(_user.password.length < 8){
      toast("Password must have atleast 8 characters");
    } else {
      print("Success");
      login(_user, authNotifier, context);
    }
  }

  Widget _buildLoginForm() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 120,
        ),
        // Email Text Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),

          ),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.email = value;
            },
            cursorColor: Color.fromRGBO(24, 142, 190, 1.0),
            decoration: InputDecoration(
              hintText: 'Téléphone',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 142, 190, 1.0),
              ),
              icon: Icon(
                Icons.phone_android,
                color: Color.fromRGBO(24, 142, 190, 1.0),
              ),
            ),
          ),
        ), //EMAIL TEXT FIELD
        SizedBox(
          height: 20,
        ),
        // Password Text Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextFormField(
            obscureText: showPassword,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.password = value;
            },
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Color.fromRGBO(24, 142, 190, 1.0),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  (showPassword) ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromRGBO(24, 142, 190, 1.0),
                ), 
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                }
                ),
              border: InputBorder.none,
              hintText: 'Mot de passe',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 142, 190, 1.0),
              ),
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(24, 142, 190, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Forgot Password Line
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ForgotPasswordPage();
                  },
                ));
              },
              child: Container(
                child: Text(
                  'Mot de passe oublié?',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        //LOGIN BUTTON
        GestureDetector(
          onTap: () {
            _submitForm();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(24, 142, 190, 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Connexion",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        // SignUp Line
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SignupPage();
                  },
                ));
              },
              child: Container(
                child: Text(
                  'Inscrivez vous',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formkey,
          autovalidate: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      'Karah',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontFamily: 'MuseoModerno',
                      ),
                    ),
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
                _buildLoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
