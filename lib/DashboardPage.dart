import 'package:flutter/material.dart';

import 'BurgerPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  void check() {
    backup = name;
    name = names;
    names = backup;

    backups = email;
    email = emails;
    emails = backups;

    pics = pic1;
    pic1 = pic2;
    pic2 = pics;
  }

  String name = "Sunil Shedge";
  String names = "Akash Shedge";
  String email = "swarajya888@gmail.com";
  String emails = "swarajya90@gmail.com";
  String backup;
  String backups;
  String pics;
  String pic1 = "S";
  String pic2 = "A";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.white, child: Text(pic1)),
                onTap: () {
                  setState(() {
                    setState(() {
                      check();
                    });
                  });
                },
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  child: CircleAvatar(
                      backgroundColor: Colors.white, child: Text(pic2)),
                  onTap: () {
                    setState(() {
                      setState(() {
                        check();
                      });
                    });
                  },
                ),
              ],
            ),
            new ListTile(
              leading: Icon(Icons.home),
              title: new Text("Home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.info_outline),
              title: new Text("About"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.contacts),
              title: new Text("Contact"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.image),
              title: new Text("portfolio"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.menu, color: Colors.teal),
                    onPressed: () {
                      setState(() {
                        scaffoldKey.currentState.openDrawer();
                      });
                    }),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: 6.0,
                        blurRadius: 4.0,
                        offset: Offset(0.0, 3.0),
                      ),
                    ],
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/tuxedo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Search For',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Recipies',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.0, right: 3.0),
              child: Container(
                height: 50,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(.1),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search ....",
                      hintStyle: TextStyle(fontSize: 18.0),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(.5)),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Reccommended',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListItem('Hamburg', 'assets/images/burger.png', '100',
                      Color(0xFFFFE90A), Color(0xFF6A5CAA)),
                  _buildListItem('Pizza', 'assets/images/pizza.png', '200',
                      Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                  _buildListItem('Sandwich', 'assets/images/sandwich.png', '80',
                      Color(0xFFCA90A), Color(0xFF55C87E)),
                  _buildListItem('Cheese', 'assets/images/cheese.png', '300',
                      Color(0xFFD2A2FE), Color(0xFF6A8CAA)),
                  _buildListItem('Popcorn', 'assets/images/popcorn.png', '150',
                      Color(0xFF98C4FE), Color(0xFF757575)),
                  _buildListItem('taco', 'assets/images/taco.png', '250',
                      Color(0xFFFFC50A), Color(0xFF6A5CAA)),
                  _buildListItem('Donuts', 'assets/images/doughnut.png', '70',
                      Color(0xFFFFE90A), Color(0xFF6A5CAA)),
                  _buildListItem('Fries', 'assets/images/fries.png', '50',
                      Color(0xFFA2A2FE), Color(0xFFF56CAA)),
                  _buildListItem('Donet', 'assets/images/hotdog.png', '40',
                      Color(0xFFA292FE), Color(0xFF6A5CAA)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String foodName, String imgPath, String price,
      Color bgColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Container(
        height: 175.0,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: bgColor.withOpacity(.4)),
        child: InkWell(
          onTap: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BurgerPage(
                          heroTag: foodName,
                          imgPath: imgPath,
                          price: price,
                          bgColor: bgColor,
                          textColor: textColor)));
            });
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                    tag: foodName,
                    child: Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(imgPath,
                            width: 50.0, height: 50.0, fit: BoxFit.contain),
                      ),
                    )),
              ),
              SizedBox(height: 20.0),
              Text(foodName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: textColor)),
              Text("\$" + price,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}
