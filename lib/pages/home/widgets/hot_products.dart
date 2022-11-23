import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/home/hot_product/hot_product_cubit.dart';
import 'package:flutter_application_1/utils/price.dart';
import 'package:flutter_application_1/widgets/CustomNetworkImage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:shimmer/shimmer.dart';
import 'package:auto_route/auto_route.dart';

class HotProductHome extends StatelessWidget {
  const HotProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<HotProductCubit, HotProductState>(
        builder: (context, state) {
          if (state is HotProductLoading) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(var i = 0; i < 2; i++)...[
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 203, 221, 235)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: (MediaQuery.of(context).size.width - 60) * 0.5,
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
                  ),
                ]
              ],
            );
          }
          else if (state is HotProductLoaded) {
            return LayoutGrid(
              // spacing: 20,
              // runSpacing: 20,
              columnSizes: [1.fr, 1.fr],
              rowSizes: List<TrackSize>.filled(state.hot_product.attributes.products.data.length.floor(), auto, growable: true),
              // rowGap: 20,
              columnGap: 20, 
              children: [
                for(final product in state.hot_product.attributes.products.data)...[
                  GestureDetector(
                    onTap: () {
                      context.router.pushNamed('/products/${product.attributes.slug}');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      // width: (MediaQuery.of(context).size.width - 60) * 0.5,
                      // height: 1000,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 203, 221, 235)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      // width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1/1,
                            child: Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: CustomNetworkImage(
                                  url: product.getImage(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            product.attributes.name,
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
                          Text(
                            product.getPrice(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (product.attributes.promotional_price == null)
                                const Text("",style: TextStyle(fontSize: 14)),
                              if (product.attributes.promotional_price != null)...[
                                Text(
                                  formatPrice(product.attributes.price ?? 0),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  product.getOff(),
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ]
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]
              ]
            );
          }
          else if (state is HotProductError) {
            return const Text("Error");
          }
          else {
            return Container();
          }
        }
      )
    );
  }
}