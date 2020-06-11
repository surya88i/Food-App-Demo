import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {
  final heroTag, imgPath, price, bgColor, textColor;
  BurgerPage(
      {this.heroTag, this.imgPath, this.price, this.bgColor, this.textColor});
  @override
  _BurgerPageState createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  int quantity = 1;
  var netprice = 0.0;
  IconData one;
  Color colors;
  bool flag = false;
  @override
  void initState() {
    super.initState();
    refresh();
  }

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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
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
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.menu, color: Colors.teal),
                      onPressed: () {
                        setState(() {
                          scaffoldKey.currentState.openDrawer();
                        });
                      }),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: -5.0,
                        right: 0.0,
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                spreadRadius: 6.0,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 3.0),
                              ),
                            ],
                          ),
                          child: Center(child: Text('$quantity')),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Super',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Bitter')),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(widget.heroTag,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Bitter')),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(widget.imgPath),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              spreadRadius: 6.0,
                              blurRadius: 4.0,
                              offset: Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.history,
                              color: Colors.deepOrange,
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              spreadRadius: 6.0,
                              blurRadius: 4.0,
                              offset: Offset(0.0, 3.0),
                            ),
                          ],
                        ),
                        child: IconButton(
                            icon: Icon(one, color: colors),
                            onPressed: () {
                              setState(() {
                                one = flag
                                    ? Icons.favorite
                                    : Icons.favorite_border;
                                colors = flag ? Colors.blue : Colors.deepOrange;
                                flag = !flag;
                              });
                            }),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "\$" + (int.parse(widget.price) * quantity).toString(),
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Card(
                    elevation: 2.0,
                    color: Color(0xFF55C87E),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  adjustQuantity('MINUS');
                                });
                              }),
                          Text(
                            '$quantity',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  adjustQuantity('PLUS');
                                });
                              }),
                          Text(
                            'Add to Cart\t\t\t',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Center(
                        child: FlatButton(
                      color: widget.bgColor,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: Text(
                          "ORDER NOW",
                          style: TextStyle(color: widget.textColor),
                        ),
                      ),
                    )))
              ],
            )
          ],
        ));
  }

  refresh() {
    setState(() {
      one = Icons.favorite_border;
      colors = Colors.deepOrange;
    });
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
