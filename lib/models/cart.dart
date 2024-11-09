import 'package:ecommerceapp/models/shoe.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
  Shoe(
      name: 'Batch89',
      price: '\$200',
      imagePath: 'lib/images/20241007_094721.jpg',
      description: 'Gei collection made by Miadas'),

    Shoe(
        name: 'Villagers',
        price: '\$10',
        imagePath: 'lib/images/villagers_14.png',
        description: 'Special collection set at the heart of the Minties jungle!'),

    Shoe(
        name: '\$Gondas',
        price: '\$15',
        imagePath: 'lib/images/20241007_100007.jpg',
        description: 'Depressed collections of testicles'),

    Shoe(
        name: 'Rugonsei',
        price: '\$2',
        imagePath: 'lib/images/20241007_094810.jpg',
        description: 'It\'s a rug, it\'s not worth shit.')
  ];



  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }


  //remove items from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}