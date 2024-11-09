import 'package:flutter/material.dart';
import 'package:ecommerceapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
                Image.asset(
                    'lib/images/download.png',
                  height: 240,
                  color: Colors.red[400],
                ),

              const SizedBox(height: 40,),

              //title
              Text("Just Buy It",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),

              // sub title
              Text("Brand new marketplace for trading worthless Jpegs",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10,),

              //start now button
              GestureDetector(
                onTap: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> HomePage())),

                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(25),
                  child: Text("Shop Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
