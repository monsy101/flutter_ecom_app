import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/assets/colors/colors.dart';
import 'package:monsy_flutter_project/details_screen/details_screen.dart';
import 'package:monsy_flutter_project/thanks_screen/thanks_screen.dart';

List basketItems = getItemsInCart();
double totalPriceAmount = 0;

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  double calculateTotalPrice() {
    for (int i = 0; i < basketItems.length; i++) {
      totalPriceAmount += basketItems[i].price;
    }
    return totalPriceAmount;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: colors[1],
          height: 100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total is \$',
                    style: TextStyle(
                        color: colors[4],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${calculateTotalPrice()}",
                    style: TextStyle(
                        color: colors[4],
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThanksScreen()));
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: colors[1],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: basketItems.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors[1], width: 3),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: colors[0],
                        blurRadius: 5,
                      )
                    ],
                    color: colors[4],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Image.network(basketItems[index].image),
                          radius: 60,
                          backgroundColor: colors[4],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 230,
                              child: Text(
                                basketItems[index].title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: colors[1],
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('\$ ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontStyle: FontStyle.italic,
                                        color: colors[1],
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.clip)),
                                Text(basketItems[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: colors[1],
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis)),
                                SizedBox(
                                  width: 80,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    basketItems.removeAt(index);
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.remove,
                                      color: colors[4],
                                    ),
                                    backgroundColor: colors[1],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
