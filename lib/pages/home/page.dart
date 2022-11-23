import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/home/category/category_cubit.dart';
import 'package:flutter_application_1/app/provider/home/flash_sale/flash_sale_cubit.dart';
import 'package:flutter_application_1/app/provider/home/hot_product/hot_product_cubit.dart';
import 'package:flutter_application_1/app/provider/home/mega_sale/mega_sale_cubit.dart';
import 'package:flutter_application_1/pages/home/widgets/flash_sale.dart';
import 'package:flutter_application_1/pages/home/widgets/home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/pages/home/widgets/home_bottom.dart';
import 'package:flutter_application_1/pages/home/widgets/hot_products.dart';
import 'package:flutter_application_1/pages/home/widgets/mega_sale.dart';
import 'package:flutter_application_1/widgets/CustomNetworkImage.dart';
import 'package:flutter_application_1/widgets/CustomNetworkSvg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(),
        Expanded(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<CategoryCubit>(
                create: (BuildContext context) => CategoryCubit()..loadData(),
              ),
              BlocProvider<FlashSaleCubit>(
                create: (BuildContext context) => FlashSaleCubit()..loadData(),
              ),
              BlocProvider<MegaSaleCubit>(
                create: (BuildContext context) => MegaSaleCubit()..loadData(),
              ),
              BlocProvider<HotProductCubit>(
                create: (BuildContext context) => HotProductCubit()..loadData(),
              ),
            ],
            child: const HomePageContent()
          ),
        ),
      ],
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  late PageController _pageController;
  CarouselController buttonCarouselController = CarouselController();
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1.05);
  }

  Future<void> refresh(BuildContext context) async {
    context.read<CategoryCubit>().loadData();
    context.read<FlashSaleCubit>().loadData();
    context.read<MegaSaleCubit>().loadData();
    context.read<HotProductCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refresh(context),
      child: SingleChildScrollView(
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
                              borderRadius: BorderRadius.circular(5),
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
      
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900]
                    ),
                  ),
                  Text(
                    "More Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[600]
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(var i = 0; i < 3; i++)
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                width: 80,
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
                                          Icons.category,
                                          size: 30,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Container(
                                      width: 60,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            const SizedBox(width: 20,)
                          ],
                        ),
                      );
                    }
                    else if (state is CategoryLoaded) {
                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for(var category in state.categories.data.take(7))
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              width: 80,
                              // height: 200,
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1/1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: const Color.fromARGB(255, 203, 221, 235))
                                      ),
                                      child:  CustomNetworkSvg(
                                        url: category.getIcon(),
                                        color: Colors.blue,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    category.attributes.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(width: 20,)
                        ],
                      );
                    }
                    else {
                      return Container();
                    }
                  }
                ),
              ),
            ),
      
            const FlashSaleHome(),
      
            const MegaSaleHome(),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
                        constraints: BoxConstraints( maxWidth: 250),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recomended Product",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1.3
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "We recommened the best for you",
                              style: TextStyle(
                                color: Colors.grey[200]
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
            
            const HotProductHome(),
          ],
        ),
      ),
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
