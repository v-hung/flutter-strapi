import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/model/image.dart';
import 'package:flutter_application_1/utils/helper.dart';
import 'package:flutter_application_1/widgets/CustomNetworkImage.dart';

class ProductSlide extends StatefulWidget {
  const ProductSlide({super.key, required this.images});

  final List<ImageData> images;

  @override
  State<ProductSlide> createState() => _ProductSlideState();
}

class _ProductSlideState extends State<ProductSlide> {
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
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 3/1.9,
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
            items: widget.images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                  widthFactor: 1 / _pageController.viewportFraction,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey
                    ),
                    child: CustomNetworkImage(
                      url: getImage(i.attributes.url),
                      fit: BoxFit.cover,
                    ),
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
            children: indicators(widget.images.length,activePage)
          ),
        )
      ],
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
            color: currentIndex == index ? Colors.blue : Colors.grey,
            shape: BoxShape.circle
          ),
        ),
      );
    });
  }
}