import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widgets/home_appbar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 20;
    const double min_with_item = 70;
    int item = ((MediaQuery.of(context).size.width - (spacing * 2) + spacing) / (spacing + min_with_item)).floor();
    
    double with_item = (MediaQuery.of(context).size.width - (spacing * 2) - (item - 1) * spacing) / item;

    return Column(
      children: [
        const HomeAppbar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Man Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900]
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    runSpacing: spacing,
                    spacing: spacing,
                    children: <Widget>[
                      for(var i = 0; i < 10; i++)
                        Container(
                          // margin: const EdgeInsets.only(left: 20),
                          width: with_item,
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1/1,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color.fromARGB(255, 203, 221, 235))
                                  ),
                                  child: const Icon(
                                    Icons.agriculture_sharp,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                  "Woman",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      const SizedBox(width: 20,)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Woman Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900]
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: <Widget>[
                      for(var i = 0; i < 10; i++)
                        Container(
                          // margin: const EdgeInsets.only(left: 20),
                          width: with_item,
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1/1,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color.fromARGB(255, 203, 221, 235))
                                  ),
                                  child: const Icon(
                                    Icons.agriculture_sharp,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                  "Woman",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14
                                  ),
                                ),
                            ],
                          ),
                        ),
                      const SizedBox(width: 20,)
                    ],
                  ),
                ),
          
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}