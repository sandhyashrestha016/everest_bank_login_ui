import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkBoxValue = false;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("image/everest.jpg"),
                      width: 350,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                preferredSize: Size.fromHeight(25.0)),
            centerTitle: true,
            backgroundColor: Color(0xff900000),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color(0xff900000),
            onPressed: null,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.grey,
            iconSize: 25,
            unselectedFontSize: 14,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.lock_outline),
                title: Container(
                  padding: EdgeInsets.all(15),
                  child: Text("Login"),
                ),
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  title: Container(
                    padding: EdgeInsets.all(15),
                    child: Text("FonePay"),
                  ),
                  backgroundColor: Colors.yellow),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  title: Container(
                    padding: EdgeInsets.all(15),
                    child: Text("Branches"),
                  ),
                  backgroundColor: Colors.grey),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline),
                title: Container(
                  padding: EdgeInsets.all(15),
                  child: Text("Others"),
                ),
                backgroundColor: Colors.red,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                /*Container(
                  color: Color(0xff900000),
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Image.asset(
                    "image/everestbank.png",
                    height: 80,
                    width: 500,
                  ),
                ),*/
                Container(
                  height: 180,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    images: [
                      AssetImage('image/1st.jpg'),
                      AssetImage('image/2nd.jpg'),
                      AssetImage('image/3rd.jpg'),
                    ],
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 2000),
                    dotSize: 5.0,
                    dotColor: Colors.white,
                    dotBgColor: Colors.grey.withOpacity(0.5),
                    indicatorBgPadding: 12.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 255, 0),
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                      fontSize: 19.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 0),
                  child: SizedBox(
                    height: 100,
                    width: 400,
                    child: TextFormField(
                      cursorColor: Color(0xff900000),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 310, 0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 19.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 20, 0),
                  child: SizedBox(
                    height: 85,
                    width: 400,
                    child: TextFormField(
                      cursorColor: Color(0xff900000),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1, color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xff900000),
                        value: checkBoxValue,
                        onChanged: (bool value) {
                          print(value);
                          setState(() {
                            checkBoxValue = value;
                          });
                        },
                      ),
                      Text(
                        "Remember Mobile Number",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      //Padding(padding: EdgeInsets.fromLTRB(60, 0, 6, 0)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 10, 5),
                  child: SizedBox(
                    height: 60,
                    width: 500,
                    child: RaisedButton(
                      color: Color(0xff900000),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      onPressed: () {
                        print("login");
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                    Icon(
                      Icons.fingerprint,
                      size: 30,
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                      child: Center(
                        child: Text(
                          "Tap here to sign in with your finger print",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onTap: () => print("tap here"),
                  child: Card(
                    elevation: 1,
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 5),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Having trouble signing in?',
                            style: TextStyle(fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Tap here',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text(
                    "Connect with us",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 25, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Image.asset(
                          "image/facebook.png",
                          width: 50,
                          height: 40,
                        ),
                        onTap: () => launch('https://www.facebook.com/'),
                      ),
                      InkWell(
                        child: Image.asset(
                          "image/twitter.png",
                          width: 50,
                          height: 40,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          "image/instagram.png",
                          width: 50,
                          height: 40,
                        ),
                      ),
                      InkWell(
                        child: Image.asset(
                          "image/youtube.png",
                          width: 50,
                          height: 45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
