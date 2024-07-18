import 'package:flutter/material.dart';

class HomeIconButtonCard_Basket extends StatelessWidget {
  const HomeIconButtonCard_Basket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 185,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(.5),
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
              size: 69,color: Colors.white
            ),
            Text(
              'View Basket',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
