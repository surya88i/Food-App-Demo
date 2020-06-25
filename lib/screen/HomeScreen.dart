import 'package:flutter/material.dart';
import 'package:sun/BurgerPage.dart';
import 'package:sun/search.dart';
import 'FoodTabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() { 
    super.initState();
    tabController=new TabController(length: 4, vsync: this);
  }
  double sliderVal=0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
        appBar:AppBar(
          title: Text("Food Delivery"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    showSearch(context: context, delegate: DataSearch());
                  });
                }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
               margin: EdgeInsets.only(top: 0.0),
               accountName: Text("Sunil Shedge"),
               accountEmail: Text("swarajya888@gmail.com"),
               currentAccountPicture: GestureDetector(
                 child: CircleAvatar(
                   foregroundColor: Colors.transparent,
                   backgroundColor: Colors.amber,
                   backgroundImage: AssetImage('assets/images/tuxedo.png')),
               ),
              ),
              Card(
               child: ListTile(
                 leading: Icon(Icons.home,color: Color(0xFF333945)),
                  title: Text("Home",style: TextStyle(fontSize: 16)),
                  onTap: (){},
                ),
              ),
              Card(
               child: ListTile(
                 leading: Icon(Icons.shopping_cart,color: Color(0xFF333945)),
                  title: Text("My Order",style: TextStyle(fontSize: 16)),
                  onTap: (){},
                ),
              ),
              Card(
               child: ListTile(
                 leading: Icon(Icons.settings,color: Color(0xFF333945)),
                  title: Text("Setting",style: TextStyle(fontSize: 16)),
                  onTap: (){},
                ),
              ),
              Card(
               child: ListTile(
                 leading: Icon(Icons.call,color: Color(0xFF333945)),
                  title: Text("Contact",style: TextStyle(fontSize: 16)),
                  onTap: (){},
                ),
              ),
              Card(
               child: ListTile(
                 leading: Icon(Icons.info_outline,color: Color(0xFF333945)),
                  title: Text("About",style: TextStyle(fontSize: 16)),
                  onTap: (){},
                ),
              )
            ],
          ),
        ),
        body:ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text("Popular Foods",style: TextStyle(fontSize: 21)),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildListItem('HamBurger','assets/images/burger.png', '200',Color(0xFFFFE90A), Color(0xFF757575)),
                  _buildListItem('sandwich','assets/images/sandwich.png', '100',Color(0xFFD2FADA), Color(0xFF6A8CAA)),
                  _buildListItem('Pizza','assets/images/pizza.png', '250',Color(0xFFD2A2FE), Color(0xFFFFFFFF)),
                  _buildListItem('Popcorn','assets/images/popcorn.png','80',Color(0xFF98C4FE), Color(0xFF757575)),
                  _buildListItem('hotdog','assets/images/hotdog.png','150', Color(0xFFFFC50A), Color(0xFF6A5CAA)),
                  _buildListItem('fries','assets/images/fries.png', '60', Colors.deepOrange, Color(0xFF6A5CAA)),
                  _buildListItem('taco', 'assets/images/taco.png', '90',Color(0xFF333945), Color(0xFFFFFFFF)),
                  _buildListItem('Cheese', 'assets/images/cheese.png', '120',Colors.cyan, Color(0xFFC890CAA)),
                  _buildListItem('doughnut', 'assets/images/doughnut.png', '300',Color(0xFFC25269), Color(0xFF333945)),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                isScrollable: true,
                tabs: [
                  Tab(child: Text("Reccommend",style: TextStyle(color: Colors.black))),
                  Tab(child: Text("COMBO",style: TextStyle(color: Colors.black))),
                  Tab(child: Text("Favourite",style: TextStyle(color: Colors.black))),
                  Tab(child: Text("Delicious",style: TextStyle(color: Colors.black))),
                ]),
            ),
            Padding(padding: EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height-300,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                  FoodTab(),
                ],
              ),
            ),
          ),
        ],
      ),
      );
  }
 
  Widget _buildListItem(String foodName,String imgPath,String price,Color bgColor,Color textColor)
  {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
          BurgerPage(heroTag: foodName,imgPath: imgPath,price: price)));
        },
        child: Container(
          width: 175,
          child: Card(
            color: bgColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: foodName, 
                  child: Center(child: Image.asset(imgPath,width: 50,height: 50,fit: BoxFit.fill))),
                  ),
                Text(foodName,style: TextStyle(fontSize: 21,color: textColor)),
                Text("\$"+price,style: TextStyle(fontSize: 21,color: textColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}