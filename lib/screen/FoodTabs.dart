import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'BurgerPage.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Delicious Burger', 2.5, '100', 'assets/images/burger.png'),
          _buildListItem('Sweet SandWich', 4.5, '80', 'assets/images/sandwich.png'),
          _buildListItem('Awesome pizza', 4.2, '200', 'assets/images/pizza.png'),
          _buildListItem('Tasty donuts', 3.1, '40', 'assets/images/doughnut.png'),
          _buildListItem('Chips fries', 3.5, '50', 'assets/images/fries.png'),
        ],
      ),
    );
  }

  Widget _buildListItem(
      String foodName, double rating, String price, String imgPath) {
    return SingleChildScrollView(
          child: Card(
            color: Color(0xFFD1FADA),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0,bottom: 10.0),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  Container(
                    width:50,
                    height:50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imgPath),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(foodName, style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: SmoothStarRating(
                            allowHalfRating: false,
                            onRated: (v) {},
                            rating: rating.toDouble(),
                            size: 15.0,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            spacing: 0.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text("\$" + price, style: TextStyle(fontSize: 18)),
                      ),
                      
                    ],
                  ),
                ],
              ),
              FloatingActionButton(
                heroTag: foodName,
                backgroundColor: Colors.deepOrange,
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                    BurgerPage(heroTag: foodName,imgPath: imgPath,price: price,bgColor: Color(0xFF333945).withOpacity(1),textColor:Colors.white.withOpacity(1),)));
                  });
                },
              ),
              
            ],
          ),
            ),
          ),
    );
  }
}
