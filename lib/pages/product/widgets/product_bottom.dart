import 'package:flutter/material.dart';

class ProductBottomNavbar extends StatelessWidget {
  const ProductBottomNavbar({super.key, required this.select_color, required this.select_size});

  final int? select_size;
  final Color? select_color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: InkWell(
        onTap: () {
          print({select_size, select_color});
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue[400],
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue[400]!.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(0, 3.0), // changes position of shadow
              ),
            ],
          ),
          child: const Text(
            "Add To Cart",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              // fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}