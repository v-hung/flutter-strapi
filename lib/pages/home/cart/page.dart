import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/cart/_cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: ,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 221, 221, 221)),
            ),
          ),
          child: Text(
            "Account",
            style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  for(var i = 0; i < 3; i++)
                    CartItem(),

                  Container(
                    child: Text("hihi"),
                  )

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}