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
            "Your Cart",
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

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: TextField(
                              controller: TextEditingController(text: ''),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Enter Cupon Code'
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (){}, 
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightBlue,
                            // minimumSize: Size.zero, // Set this
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            )
                          ),
                          child: Text(
                            "Apply",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                        ),
                      ],
                    ),
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