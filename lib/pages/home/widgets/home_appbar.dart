import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbar({ Key? key}) : preferredSize = const Size.fromHeight(80), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 221, 221, 221)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 206, 206, 206)
                    ),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.blue
                    ),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Product'
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(10.0, 0.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    iconSize: 28,
                    color: Colors.grey,
                    onPressed: () {  },
                  ),
                  IconButton(
                    icon: Stack(
                      children: const [
                        Icon(Icons.notifications_none_outlined),
                        Positioned(
                          top: 1.0,
                          right: 5.0,
                          child: Icon(
                            Icons.brightness_1, 
                            size: 10.0, 
                            color: Colors.redAccent
                          ),
                        )
                      ]
                    ),
                    iconSize: 28,
                    color: Colors.grey,
                    onPressed: () {  },
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}