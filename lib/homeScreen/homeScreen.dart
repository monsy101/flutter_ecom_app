import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/productModel.dart';
import 'HomeIconButtonCard_Basket.dart';
import 'HomeIconButtonCard_ShoppingCart.dart';
import 'HomeWelcomeCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ProductModel>> getData() async{
    final response = await Dio().get('https://fakestoreapi.in/api/products');
    List<ProductModel> data=[];
    for(var item in response.data){
      data.add(ProductModel.fromJson(item));
    }
    return data;
  }
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeWelcomeCard(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(future: getData(), builder: (context,snapshot){
                  if(snapshot.hasData){
                    List? products = snapshot.data;
                    return Image.network(products?[1].image);
                  }else if (snapshot.hasError){
                    return Text(snapshot.error.toString());
                  }else{
                    return Text('missing');
                  }
                }),
                HomeIconButtonCard(),
                HomeIconButtonCard_Basket(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
