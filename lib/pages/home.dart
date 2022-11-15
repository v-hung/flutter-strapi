import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   foregroundColor: Colors.grey,
      //   elevation: 0,
      //   shadowColor: Theme.of(context).colorScheme.shadow,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.favorite),
      //       onPressed: () {  },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {  },
      //     )
      //   ],
      //   bottom: PreferredSize(
      //     preferredSize: const Size.fromHeight(0.0),
      //     child: Container(
      //       color: Colors.grey[300],
      //       height: 1,
      //     )
      //   ),
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color.fromARGB(255, 221, 221, 221)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...'
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(10.0, 0.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.grey,
                      onPressed: () {  },
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      color: Colors.grey,
                      onPressed: () {  },
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}