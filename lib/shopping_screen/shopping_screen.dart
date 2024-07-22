import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/assets/colors/colors.dart';
import 'package:monsy_flutter_project/details_screen/details_screen.dart';

import '../model/productModel.dart';

class shopppingScreen extends StatefulWidget {
  const shopppingScreen({
    super.key,
    required image,
  });

  @override
  State<shopppingScreen> createState() => _shopppingScreenState();
}

class _shopppingScreenState extends State<shopppingScreen> {
  Future<List<ProductModel>> getData() async {
    final response = await Dio().get('https://fakestoreapi.com/products');
    List<ProductModel> data = [];
    for (var item in response.data) {
      data.add(ProductModel.fromJson(item));
    }
    // print(data[1]);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shop',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: colors[1],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_basket,
                              size: 35,
                              color: colors[1],
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: .595,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                              future: getData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List? products = snapshot.data;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  DetailsScreen(
                                                      itemIndex:
                                                          products?[index],
                                                      image: products?[index]
                                                          .image,
                                                      itemsDetails:
                                                          products?[index]
                                                              .description)));
                                    },
                                    child: shopItemContainer(products, index),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              });
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container shopItemContainer(List<dynamic>? products, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: colors[0], width: 2)),
      child: Column(
        children: [
          Image.network(
            colorBlendMode: BlendMode.color,
            products?[index].image,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                    height: 40,
                    child: Text(
                      products?[index].title,
                      style: const TextStyle(overflow: TextOverflow.fade),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: colors[1],
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Text(
                                products![index].price.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: colors[1],
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Text(
                          //   "Price",
                          //   style: TextStyle(fontStyle: FontStyle.italic,color: colors[1].withOpacity(.8),),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
