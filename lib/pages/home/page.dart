import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widgets/home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  CarouselController buttonCarouselController = CarouselController();
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1.05);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),

            Container(
              height: 200,
              // constraints: BoxConstraints( minHeight: 200), min height not working
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.05,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activePage = index;
                    });
                  },
                ),
                carouselController: buttonCarouselController,
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return FractionallySizedBox(
                      widthFactor: 1 / _pageController.viewportFraction,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: NetworkImage("https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.2),
                                  Colors.grey.withOpacity(0.0),
                                ],
                              )
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                constraints: BoxConstraints( maxWidth: 300),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Super flash Sale 20% Off",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                        height: 1.3
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "08",
                                              style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          " : ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                          ),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "34",
                                              style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          " : ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                          ),
                                        ),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "51",
                                              style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    );
                    },
                  );
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(5,activePage)
              ),
            ),
          ],
        ),
      )
    );
  }


  List<Widget> indicators(length,currentIndex) {
    return List<Widget>.generate(length, (index) {
      return GestureDetector(
        onTap: () {
          buttonCarouselController.animateToPage(
            index, 
            duration: const Duration(milliseconds: 500), 
            curve: Curves.ease
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle
          ),
        ),
      );
    });
  }
}