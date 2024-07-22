import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/basket_screen/basket_screen.dart';

import '../assets/colors/colors.dart';
import '../model/productModel.dart';
import '../shopping_screen/shopping_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ProductModel>> getData() async {
    final response = await Dio().get('https://fakestoreapi.com/products');
    List<ProductModel> data = [];
    for (var item in response.data) {
      data.add(ProductModel.fromJson(item));
    }
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors[4],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                height: 200,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: colors[3]),
                    ),
                    Text(
                      'Mr.Kareem',
                      style: TextStyle( fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Start Shopping',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: colors[3]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  shopppingScreen(image: Placeholder())));
                    },
                    child: Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                        color: colors[1],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: colors[0],
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.cart_fill,
                              size: 69, color: colors[4]),
                          Text(
                            'Start Shopping',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: colors[4]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Check Your Basket',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: colors[3]),
                  ),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> BasketScreen()));
                  },
                    child: Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                        color: colors[1],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: colors[0],
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.shopping_basket_rounded,
                              size: 69,color: colors[4]
                          ),
                          Text(
                            'View Basket',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: colors[4]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
