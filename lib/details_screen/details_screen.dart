import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/assets/colors/colors.dart';

List itemsInCart = [];

void addToCart(meow) {
  itemsInCart.add(meow);
}

List getItemsInCart() {
  return itemsInCart;
}

class DetailsScreen extends StatelessWidget {
  String image;
  String itemsDetails;
  dynamic itemIndex;

  DetailsScreen(
      {super.key,
      required this.image,
      required this.itemsDetails,
      required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 4, color: colors[1])),
                  child: CarouselView(
                    scrollDirection: Axis.horizontal,
                    itemExtent: double.infinity,
                    children: List<Widget>.generate(10, (int index) {
                      return Center(
                          child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ));
                    }),
                  ),
                ),
                Text(
                  itemIndex.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors[1],
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(
                              color: colors[1],
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          itemIndex.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addToCart(itemIndex);
                        print(getItemsInCart());
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          shadowColor: colors[0],
                          backgroundColor: colors[1],
                          minimumSize: const Size(50, 50)),
                      child: Opacity(
                          opacity: 1,
                          child: Icon(
                            CupertinoIcons.add,
                            color: colors[4],
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    // height: 270,
                    child: Text(
                      itemsDetails,
                      style: TextStyle(fontSize: 20),
                      // overflow: TextOverflow.fade,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
