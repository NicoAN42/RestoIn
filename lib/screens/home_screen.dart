import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;

  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  var _value = "Sentul";

  // Buttons
  bool _foodButton = true;
  bool _restaurantButton = true;
  bool _nearbyButton = false;
  bool _opennowButton = false;
  bool _rateButton = false;
  bool _discountButton = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //TODO: link to location screen
    DropdownButton _myLocation() => DropdownButton<String>(
          style: Styles.customStyle("mediumboldblack"),
          underline: SizedBox(),
          items: [
            DropdownMenuItem<String>(
              value: "Sentul",
              child: Text("Sentul"),
            ),
            DropdownMenuItem<String>(
              value: "Jakarta",
              child: Text("Jakarta"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        );

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.1, screenWidth * 0.05, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "My Location",
                          style: Styles.customStyle("mediumblack"),
                        ),
                      ),
                      _myLocation(),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/favorite"),
                    child: Container(
                      child: Image.asset('assets/icon/fav.png',
                          width: 20, height: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 0, screenWidth * 0.05, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.8,
                    child: FlatButton(
                        color: Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () =>
                            Navigator.pushNamed(context, "/search"),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(FontAwesomeIcons.search,
                                color: Styles.gray),
                          ),
                          Text(
                            "Search food or restaurant",
                            style: Styles.customStyle("mediumGray"),
                          ),
                        ])),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/filter"),
                    child: Container(
                      child: Image.asset('assets/icon/g_filter.png',
                          width: 24, height: 24),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0, 0, 20),
              child: SizedBox(
                height: 40,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Food",
                            style: _foodButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _foodButton = !_foodButton;
                          });
                        },
                        color: _foodButton ? Styles.orange : Styles.white,
                        highlightColor:
                            _foodButton ? Styles.darkOrange : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Restaurant",
                            style: _restaurantButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _restaurantButton = !_restaurantButton;
                          });
                        },
                        color: _restaurantButton ? Styles.orange : Styles.white,
                        highlightColor: _restaurantButton
                            ? Styles.darkOrange
                            : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Near By",
                            style: _nearbyButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _nearbyButton = !_nearbyButton;
                          });
                        },
                        color: _nearbyButton ? Styles.orange : Styles.white,
                        highlightColor:
                            _nearbyButton ? Styles.darkOrange : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Open Now",
                            style: _opennowButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _opennowButton = !_opennowButton;
                          });
                        },
                        color: _opennowButton ? Styles.orange : Styles.white,
                        highlightColor:
                            _opennowButton ? Styles.darkOrange : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Rate: 4.0+",
                            style: _rateButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _rateButton = !_rateButton;
                          });
                        },
                        color: _rateButton ? Styles.orange : Styles.white,
                        highlightColor:
                            _rateButton ? Styles.darkOrange : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: FlatButton(
                        child: Text("Discount",
                            style: _discountButton
                                ? Styles.customStyle("mediumwhite")
                                : Styles.customStyle("mediumgray")),
                        onPressed: () {
                          setState(() {
                            _discountButton = !_discountButton;
                          });
                        },
                        color: _discountButton ? Styles.orange : Styles.white,
                        highlightColor:
                            _discountButton ? Styles.darkOrange : Styles.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Styles.white,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 20, screenWidth * 0.05, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Big Deals",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                  Text(
                    "Show All",
                    style: Styles.customStyle("mediumorange"),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0, 0, 20),
              child: SizedBox(
                height: screenWidth * 0.50 + 50,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    // Produk - 1
                    Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.05),
                            width: screenWidth * 0.425 + 6,
                            height: screenWidth * 2),
                        Positioned(
                            left: 6,
                            child: Container(
                              width: screenWidth * 0.425,
                              height: screenWidth * 0.50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/food/square/chunkyPie.jpg"),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            )),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: 0,
                          child: Container(
                              width: 60,
                              height: 28,
                              child:
                                  Image.asset("assets/icon/rating_page.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.02,
                          left: screenWidth * 0.30,
                          child: Container(
                              width: 50,
                              height: 52,
                              child:
                                  Image.asset("assets/icon/disc_circle.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.05 + 3,
                          left: 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle("mediumwhite"),
                                ),
                                Image.asset("assets/icon/w_star.png",
                                    width: 16, height: 16)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: screenWidth * 0.3 + 8,
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Text("30%",
                                  style:
                                      Styles.customStyle("mediumboldorange")),
                              Text("Off",
                                  style: Styles.customStyle("smallorange"))
                            ],
                          )),
                        ),
                        Positioned(
                          top: screenWidth * 0.5 + 10,
                          left: 6,
                          child: Container(
                              width: screenWidth * 0.425,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Chunky Pie",
                                            style: Styles.customStyle(
                                                "mediumblack")),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("IDR 75.000",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(" Western",
                                                style: Styles.customStyle(
                                                    "smallGray"))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 30,
                                      color: Styles.gray,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("40",
                                            style: Styles.customStyle(
                                                "mediumboldblack")),
                                        Text("MINS",
                                            style: Styles.customStyle(
                                                "smallblack")),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    // Produk 2
                    Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.05),
                            width: screenWidth * 0.425 + 6,
                            height: screenWidth * 2),
                        Positioned(
                            left: 6,
                            child: Container(
                              width: screenWidth * 0.425,
                              height: screenWidth * 0.50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/food/square/zucchini-chickpea-feta-veggie-burgers-GF-square1.jpg"),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            )),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: 0,
                          child: Container(
                              width: 60,
                              height: 28,
                              child:
                                  Image.asset("assets/icon/rating_page.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.02,
                          left: screenWidth * 0.30,
                          child: Container(
                              width: 50,
                              height: 52,
                              child:
                                  Image.asset("assets/icon/disc_circle.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.05 + 3,
                          left: 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "4.5 ",
                                  style: Styles.customStyle("mediumwhite"),
                                ),
                                Image.asset("assets/icon/w_star.png",
                                    width: 16, height: 16)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: screenWidth * 0.3 + 8,
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Text("60%",
                                  style:
                                      Styles.customStyle("mediumboldorange")),
                              Text("Off",
                                  style: Styles.customStyle("smallorange"))
                            ],
                          )),
                        ),
                        Positioned(
                          top: screenWidth * 0.5 + 10,
                          left: 6,
                          child: Container(
                              width: screenWidth * 0.425,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Mega Burger",
                                            style: Styles.customStyle(
                                                "mediumblack")),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("IDR 40.000",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(" Western",
                                                style: Styles.customStyle(
                                                    "smallGray"))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 30,
                                      color: Styles.gray,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("25",
                                            style: Styles.customStyle(
                                                "mediumboldblack")),
                                        Text("MINS",
                                            style: Styles.customStyle(
                                                "smallblack")),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    // Produk 3
                    Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.05),
                            width: screenWidth * 0.425 + 6,
                            height: screenWidth * 2),
                        Positioned(
                            left: 6,
                            child: Container(
                              width: screenWidth * 0.425,
                              height: screenWidth * 0.50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/food/square/miso-rice-noodle-ramen-vegetarian-lede-62.jpg"),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            )),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: 0,
                          child: Container(
                              width: 60,
                              height: 28,
                              child:
                                  Image.asset("assets/icon/rating_page.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.02,
                          left: screenWidth * 0.30,
                          child: Container(
                              width: 50,
                              height: 52,
                              child:
                                  Image.asset("assets/icon/disc_circle.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.05 + 3,
                          left: 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle("mediumwhite"),
                                ),
                                Image.asset("assets/icon/w_star.png",
                                    width: 16, height: 16)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.04,
                          left: screenWidth * 0.3 + 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text("Buy",
                                        style:
                                            Styles.customStyle("smallorange")),
                                    Text("Get",
                                        style:
                                            Styles.customStyle("smallorange")),
                                  ],
                                ),
                                Text("1",
                                    style:
                                        Styles.customStyle("largerboldorange")),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.5 + 10,
                          left: 6,
                          child: Container(
                              width: screenWidth * 0.425,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Ramen Yu Na",
                                            style: Styles.customStyle(
                                                "mediumblack")),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("IDR 195.000",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(" Japan",
                                                style: Styles.customStyle(
                                                    "smallGray"))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 30,
                                      color: Styles.gray,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("40",
                                            style: Styles.customStyle(
                                                "mediumboldblack")),
                                        Text("MINS",
                                            style: Styles.customStyle(
                                                "smallblack")),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    // Produk 4
                    Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.05),
                            width: screenWidth * 0.425 + 6,
                            height: screenWidth * 2),
                        Positioned(
                            left: 6,
                            child: Container(
                              width: screenWidth * 0.425,
                              height: screenWidth * 0.50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/food/square/socca-pesto-pizza-81.jpg"),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            )),
                        Positioned(
                          top: screenWidth * 0.05,
                          left: 0,
                          child: Container(
                              width: 60,
                              height: 28,
                              child:
                                  Image.asset("assets/icon/rating_page.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.02,
                          left: screenWidth * 0.30,
                          child: Container(
                              width: 50,
                              height: 52,
                              child:
                                  Image.asset("assets/icon/disc_circle.png")),
                        ),
                        Positioned(
                          top: screenWidth * 0.05 + 3,
                          left: 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle("mediumwhite"),
                                ),
                                Image.asset("assets/icon/w_star.png",
                                    width: 16, height: 16)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.04,
                          left: screenWidth * 0.3 + 8,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text("Buy",
                                        style:
                                            Styles.customStyle("smallorange")),
                                    Text("Get",
                                        style:
                                            Styles.customStyle("smallorange")),
                                  ],
                                ),
                                Text("1",
                                    style:
                                        Styles.customStyle("largerboldorange")),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.5 + 10,
                          left: 6,
                          child: Container(
                              width: screenWidth * 0.425,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Vegetable Pizza",
                                            style: Styles.customStyle(
                                                "mediumblack")),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("IDR 240.000",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(" Western",
                                                style: Styles.customStyle(
                                                    "smallGray"))
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 30,
                                      color: Styles.gray,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text("60",
                                            style: Styles.customStyle(
                                                "mediumboldblack")),
                                        Text("MINS",
                                            style: Styles.customStyle(
                                                "smallblack")),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Recommended
            Container(
              color: Styles.white,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 20, screenWidth * 0.05, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Recommended",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                  Text(
                    "Show All",
                    style: Styles.customStyle("mediumorange"),
                  ),
                ],
              ),
            ),

            // Recommended Content
            Container(
              width: screenWidth,
              color: Styles.white,
              child: Column(
                children: <Widget>[
                  // Resto 1
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.15 + 40,
                      ),
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.15 + 20,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.05 + 10,
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/unnamed.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.20 + 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Altar Ruins Resto",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Open 7am - 9pm",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Western Chinese Cake",
                              style: Styles.customStyle("mediumlightGray"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle(
                                      "mediumbolddarkOrange"),
                                ),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 50,
                        child: Container(
                          width: 2,
                          height: screenWidth * 0.15,
                          color: Styles.gray,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: screenWidth * 0.05 + 10,
                        child: Column(
                          children: <Widget>[
                            Text("40",
                                style: Styles.customStyle("mediumboldblack")),
                            Text("MINS",
                                style: Styles.customStyle("smallblack")),
                          ],
                        ),
                      ),

                      // Dots
                      Positioned(
                        top: 15,
                        right: screenWidth * 0.05 - 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.green,
                          ),
                        ),
                      )
                    ],
                  ),

                  // Resto 2
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.15 + 40,
                      ),
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.15 + 20,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.05 + 10,
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/restaurant-png-hd--1920.png")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.20 + 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Chinese Resident",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Open 8am - 9pm",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Cake Chinese",
                              style: Styles.customStyle("mediumlightGray"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle(
                                      "mediumbolddarkOrange"),
                                ),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 50,
                        child: Container(
                          width: 2,
                          height: screenWidth * 0.15,
                          color: Styles.gray,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: screenWidth * 0.05 + 10,
                        child: Column(
                          children: <Widget>[
                            Text("40",
                                style: Styles.customStyle("mediumboldblack")),
                            Text("MINS",
                                style: Styles.customStyle("smallblack")),
                          ],
                        ),
                      ),

                      // Overlay
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: screenWidth * 0.9,
                            height: screenWidth * 0.15 + 20,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Styles.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text("Restaurant is Closed",
                                  style: Styles.customStyle("largeboldwhite")),
                              Text("Open 8am - 9pm",
                                  style: Styles.customStyle("mediumwhite")),
                            ],
                          ),
                        ),
                      ),

                      // Dots
                      Positioned(
                        top: 15,
                        right: screenWidth * 0.05 - 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.red,
                          ),
                        ),
                      )
                    ],
                  ),

                  // Resto 3
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.15 + 40,
                      ),
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.15 + 20,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.05 + 10,
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/restaurant-png-hd--1920.png")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.20 + 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Chinese Resident",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Open 8am - 9pm",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Cake Chinese",
                              style: Styles.customStyle("mediumlightGray"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle(
                                      "mediumbolddarkOrange"),
                                ),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 50,
                        child: Container(
                          width: 2,
                          height: screenWidth * 0.15,
                          color: Styles.gray,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: screenWidth * 0.05 + 10,
                        child: Column(
                          children: <Widget>[
                            Text("40",
                                style: Styles.customStyle("mediumboldblack")),
                            Text("MINS",
                                style: Styles.customStyle("smallblack")),
                          ],
                        ),
                      ),

                      // Dots
                      Positioned(
                        top: 15,
                        right: screenWidth * 0.05 - 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.green,
                          ),
                        ),
                      )
                    ],
                  ),

                  // Resto 4
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.15 + 40,
                      ),
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.15 + 20,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.05 + 10,
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/unnamed.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.20 + 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Altar Ruins Resto",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Open 7am - 9pm",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Western Chinese Cake",
                              style: Styles.customStyle("mediumlightGray"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle(
                                      "mediumbolddarkOrange"),
                                ),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 50,
                        child: Container(
                          width: 2,
                          height: screenWidth * 0.15,
                          color: Styles.gray,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: screenWidth * 0.05 + 10,
                        child: Column(
                          children: <Widget>[
                            Text("40",
                                style: Styles.customStyle("mediumboldblack")),
                            Text("MINS",
                                style: Styles.customStyle("smallblack")),
                          ],
                        ),
                      ),

                      // Dots
                      Positioned(
                        top: 15,
                        right: screenWidth * 0.05 - 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.green,
                          ),
                        ),
                      )
                    ],
                  ),

                  // Resto 5
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.15 + 40,
                      ),
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.15 + 20,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.05 + 10,
                        child: Container(
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/restaurant-png-hd--1920.png")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: screenWidth * 0.20 + 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Chinese Resident",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Open 8am - 9pm",
                              style: Styles.customStyle("mediumblack"),
                            ),
                            Text(
                              "Cake Chinese",
                              style: Styles.customStyle("mediumlightGray"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "5.0 ",
                                  style: Styles.customStyle(
                                      "mediumbolddarkOrange"),
                                ),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                            Text(
                              "",
                              style: Styles.customStyle("mediumbolddarkOrange"),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: screenWidth * 0.05 + 50,
                        child: Container(
                          width: 2,
                          height: screenWidth * 0.15,
                          color: Styles.gray,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: screenWidth * 0.05 + 10,
                        child: Column(
                          children: <Widget>[
                            Text("40",
                                style: Styles.customStyle("mediumboldblack")),
                            Text("MINS",
                                style: Styles.customStyle("smallblack")),
                          ],
                        ),
                      ),

                      // Overlay
                      Positioned(
                        top: 20,
                        left: screenWidth * 0.05,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: screenWidth * 0.9,
                            height: screenWidth * 0.15 + 20,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Styles.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text("Restaurant is Closed",
                                  style: Styles.customStyle("largeboldwhite")),
                              Text("Open 8am - 9pm",
                                  style: Styles.customStyle("mediumwhite")),
                            ],
                          ),
                        ),
                      ),

                      // Dots
                      Positioned(
                        top: 15,
                        right: screenWidth * 0.05 - 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Styles.red,
                          ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("Show All",
                        style: Styles.customStyle("mediumorange")),
                  )
                ],
              ),
            ),

            // Newest Food
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 20, screenWidth * 0.05, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Newest Food",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                ],
              ),
            ),

            // Newest Food Content
            Container(
              color: Colors.white,
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  // Food 1
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.60 + 80,
                      ),
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/food/landscape/BACKYARD+FARMS+TOMATOES_JUNE+2015_BRIAN+SAMUELS+PHOTOGRAPHY-0295.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.60 + 10,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Lamb Da Grilled",
                                    style: Styles.customStyle("largeblack")),
                                Text("IDR 75.000",
                                    style: Styles.customStyle("mediumblack")),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "4.0 ",
                                          style: Styles.customStyle(
                                              "mediumboldblack"),
                                        ),
                                        Image.asset("assets/icon/b_star.png",
                                            width: 16, height: 16),
                                      ],
                                    ),
                                    Text(
                                      "Western",
                                      style:
                                          Styles.customStyle("mediumlightGray"),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: 2,
                                  height: 40,
                                  color: Styles.gray,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("40",
                                        style: Styles.customStyle(
                                            "largeboldblack")),
                                    Text("MINS",
                                        style:
                                            Styles.customStyle("smallblack")),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Food 2
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.60 + 80,
                      ),
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/food/landscape/Citrus-Poppy-Seed-Almond-Flour-Pancakes-2.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.60 + 10,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Fresh Paladise Lone",
                                    style: Styles.customStyle("largeblack")),
                                Row(
                                  children: <Widget>[
                                    Text("IDR 175.000  ",
                                        style:
                                            Styles.customStyle("mediumblack")),
                                    Text("200.000",
                                        style: TextStyle(
                                            color: Styles.gray,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "4.0 ",
                                          style: Styles.customStyle(
                                              "mediumboldblack"),
                                        ),
                                        Image.asset("assets/icon/b_star.png",
                                            width: 16, height: 16),
                                      ],
                                    ),
                                    Text(
                                      "Western",
                                      style:
                                          Styles.customStyle("mediumlightGray"),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: 2,
                                  height: 40,
                                  color: Styles.gray,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("40",
                                        style: Styles.customStyle(
                                            "largeboldblack")),
                                    Text("MINS",
                                        style:
                                            Styles.customStyle("smallblack")),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Food 3
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.60 + 80,
                      ),

                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/food/landscape/GreenLasadaPasta.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),

                      // Overlay
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: screenWidth * 0.9,
                            height: screenWidth * 0.60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Styles.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.30 - 15,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text("Out of Stock",
                              style: Styles.customStyle("largerboldwhite")),
                        ),
                      ),

                      Positioned(
                        top: screenWidth * 0.60 + 10,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Green Lasada Pasta",
                                    style: Styles.customStyle("largeblack")),
                                Row(
                                  children: <Widget>[
                                    Text("IDR 55.000  ",
                                        style:
                                            Styles.customStyle("mediumblack")),
                                    Text("200.000",
                                        style: TextStyle(
                                            color: Styles.gray,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "4.0 ",
                                          style: Styles.customStyle(
                                              "mediumboldblack"),
                                        ),
                                        Image.asset("assets/icon/b_star.png",
                                            width: 16, height: 16),
                                      ],
                                    ),
                                    Text(
                                      "Western",
                                      style:
                                          Styles.customStyle("mediumlightGray"),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: 2,
                                  height: 40,
                                  color: Styles.gray,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("40",
                                        style: Styles.customStyle(
                                            "largeboldblack")),
                                    Text("MINS",
                                        style:
                                            Styles.customStyle("smallblack")),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Trending Restaurant
            Container(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 20, screenWidth * 0.05, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Trending Restaurant",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                ],
              ),
            ),

            // Trending Restaurant Content
            // Newest Food Content
            Container(
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  // Restaurant 1
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.60 + 80,
                      ),
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/modernRestaurant.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.60 + 10,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("De Luna Resto",
                                    style: Styles.customStyle("largeblack")),
                                Text("Open 7am - 11pm",
                                    style: Styles.customStyle("mediumblack")),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "4.0 ",
                                          style: Styles.customStyle(
                                              "mediumboldblack"),
                                        ),
                                        Image.asset("assets/icon/b_star.png",
                                            width: 16, height: 16),
                                      ],
                                    ),
                                    Text(
                                      "Chinese",
                                      style:
                                          Styles.customStyle("mediumlightGray"),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: 2,
                                  height: 40,
                                  color: Styles.gray,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("40",
                                        style: Styles.customStyle(
                                            "largeboldblack")),
                                    Text("MINS",
                                        style:
                                            Styles.customStyle("smallblack")),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Restaurant 2
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.60 + 80,
                      ),
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.9,
                          height: screenWidth * 0.60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/restaurant/thumb-1920-444393.jpg")),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),

                      // Overlay
                      Positioned(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Opacity(
                          opacity: 0.6,
                          child: Container(
                            width: screenWidth * 0.9,
                            height: screenWidth * 0.60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Styles.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.30 - 15,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text("Restaurant is Closed",
                              style: Styles.customStyle("largerboldwhite")),
                        ),
                      ),

                      Positioned(
                        top: screenWidth * 0.60 + 10,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("High Tower Cuisine",
                                    style: Styles.customStyle("largeblack")),
                                Text("Open 9am - 12pm",
                                    style: Styles.customStyle("mediumblack")),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "3.2 ",
                                          style: Styles.customStyle(
                                              "mediumboldblack"),
                                        ),
                                        Image.asset("assets/icon/b_star.png",
                                            width: 16, height: 16),
                                      ],
                                    ),
                                    Text(
                                      "American",
                                      style:
                                          Styles.customStyle("mediumlightGray"),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: 2,
                                  height: 40,
                                  color: Styles.gray,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("20",
                                        style: Styles.customStyle(
                                            "largeboldblack")),
                                    Text("MINS",
                                        style:
                                            Styles.customStyle("smallblack")),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // End of code
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset("assets/icon/o_home.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_home.png", width: 20, height: 20),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset("assets/icon/o_notif.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_notif.png", width: 20, height: 20),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset("assets/icon/o_wallet.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_wallet.png",
                    width: 20, height: 20),
            title: Text('Wallet'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset("assets/icon/o_note.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_note.png", width: 20, height: 20),
            title: Text('Note'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Image.asset("assets/icon/o_profile.png",
                    width: 20, height: 20)
                : Image.asset("assets/icon/b_profile.png",
                    width: 20, height: 20),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
