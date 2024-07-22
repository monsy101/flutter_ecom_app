import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:monsy_flutter_project/assets/colors/colors.dart';
import 'package:monsy_flutter_project/basket_screen/basket_screen.dart';
import 'package:monsy_flutter_project/homeScreen/homeScreen.dart';
import 'package:monsy_flutter_project/model/productModel.dart';
import 'package:monsy_flutter_project/setting_screen/setting_screen.dart';
import 'package:monsy_flutter_project/shopping_screen/shopping_screen.dart';

class HomeAppScreen extends StatefulWidget {
  HomeAppScreen({super.key});

  @override
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  Future<List<ProductModel>> getData() async {
    final response = await Dio().get('https://fakestoreapi.com/products');
    List<ProductModel> data = [];
    for (var item in response.data) {
      data.add(ProductModel.fromJson(item));
    }
    return data;
  }
  int currentIndex = 0;

  List<Widget> body = [
    HomeScreen(),
    BasketScreen(),
    shopppingScreen(image: Placeholder()),
    SettingScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colors[1],fixedColor: colors[1],
          onTap: (newindex) {
            setState(() {
              currentIndex = newindex;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: colors[1],
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket_rounded,
                  color: colors[1],
                ),
                label: 'View Basket'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: colors[1],
                ),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_rounded,
                  color: colors[1],
                ),
                label: 'Settings'),
          ]),
    );
  }
}
