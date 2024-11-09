import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:ecommerceapp/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added
    DelightToastBar(
        builder: (context) => ToastCard(
            title: Text("Worthless JPEG successfully added to cart"),
          leading: Icon(
            Icons.flutter_dash,
            size: 28,
          ),
            color: Colors.grey[100],
        ),
        snackbarDuration: Duration(milliseconds: 1500),
        autoDismiss: true,
        animationDuration: Duration(milliseconds: 650)
    ).show(context);

    /*showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Successful added"),
          content: Text('Check your cart'),
        )
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) =>
            Column(
              children: [
                // search bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.search, color: Colors.grey)
                    ],
                  ),
                ),

                //message
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
                  child: Text("Spend some valuable dollars on worthless JPEGS today!!!",
                  textAlign: TextAlign.center,
                  ),
                ),

                //hot picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Hot Picks 🔥",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text("See all",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                //list view of shoes for sale
                Expanded(
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          //get a shoe from the shoe shop
                          Shoe shoe = value.getShoeList()[index];

                          //return shoe
                          return ShoeTile(
                              shoe: shoe,
                              onTap: ()=> addShoeToCart(shoe),
                          );
                        }
                    )
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Divider(
                    color: Colors.transparent,
                  ),
                )
              ],
            )
    );
  }
}
