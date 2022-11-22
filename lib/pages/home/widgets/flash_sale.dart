import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/home/flash_sale/flash_sale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FlashSaleHome extends StatelessWidget {
  const FlashSaleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlashSaleCubit()..loadData(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flash sale",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900]
                  ),
                ),
                Text(
                  "See More",
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
              child: BlocBuilder<FlashSaleCubit, FlashSaleState>(
                builder: (context, state) {
                  if (state is FlashSaleLoading) {
                    return Row(
                      children: List.filled(5, null, growable: false).map((e) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 203, 221, 235)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1/1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.grey[300]
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  width: 80,
                                  height: 18,
                                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)),
                                ),
                                const SizedBox(height: 2,),
                                Container(
                                  height: 18,
                                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)),
                                ),
                                const SizedBox(height: 15,),
                                Container(
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(color: Colors.blue[300], borderRadius: BorderRadius.circular(6)),
                                ),
                                const SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 18,
                                      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(6)),
                                    ),
                                    
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 30,
                                      height: 18,
                                      decoration: BoxDecoration(color: Colors.red[300], borderRadius: BorderRadius.circular(6)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList()
                    );
                  }
                  else if (state is FlashSaleLoaded) {
                    return Row(
                      children: <Widget>[
                        for(var i = 0; i < 10; i++)
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromARGB(255, 203, 221, 235)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1/1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                        image: NetworkImage("https://cf.shopee.vn/file/84c099fcf4fbe3a29792512b4a86e9dc",),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.grey
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  "Giày thể thao sneaker nam nữ PEAK Culture E14611B",
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.indigo[900],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 15,),
                                const Text(
                                  "714,000₫",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Text(
                                      "1,190,000₫",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text(
                                      "40% off",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        const SizedBox(width: 20,)
                      ],
                    );
                  }
                  else if (state is FlashSaleError) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Error"),
                    );
                  }
                  else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}