import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/products/featured_products/featured_products_cubit.dart';
import 'package:flutter_application_1/app/provider/products/product_detail/product_detail_cubit.dart';
import 'package:flutter_application_1/pages/product/widgets/featured_products.dart';
import 'package:flutter_application_1/pages/product/widgets/product_appbar.dart';
import 'package:flutter_application_1/pages/product/widgets/product_bottom.dart';
import 'package:flutter_application_1/pages/product/widgets/product_slide.dart';
import 'package:flutter_application_1/utils/price.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ProductDetailLayout extends StatelessWidget {
  const ProductDetailLayout({super.key, @pathParam required this.slug});

 final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(),
      child: ProductDetailPage(slug: slug),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    context.read<ProductDetailCubit>().loadData(slug);
    return ProductDetailPageContent();
  }
}

class ProductDetailPageContent extends StatefulWidget {
  const ProductDetailPageContent({super.key});

  @override
  State<ProductDetailPageContent> createState() => _ProductDetailPageContentState();
}

class _ProductDetailPageContentState extends State<ProductDetailPageContent> {
  int? select_size = null;
  Color? select_color = null;

  List<Color> colors = [Colors.amber[300]!, Colors.blue[400]!, Colors.red[400]!, Colors.green[400]!, Colors.purple[400]!, Colors.grey[400]!];

  @override
  Widget build(BuildContext context) {
    // context.read<ProductDetailCubit>().loadData(widget.slug);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const ProductAppbar(),

                Expanded(
                  child: SingleChildScrollView(
                    child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
                      builder: (context, state) {
                        if (state is ProductDetailLoading) {
                          return Container(
                            height: MediaQuery.of(context).size.height - 75,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        }
                        else if (state is ProductDetailLoaded) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // slide
                              ProductSlide(images: state.product.getImages()),

                              // name product
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.product.attributes.name,
                                        style: TextStyle(
                                          color: Colors.indigo[700],
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.favorite_border,
                                      size: 26,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),

                              // star product
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    for(var i = 0; i < 5; i++)...[
                                      Icon(
                                        Icons.star_rounded,
                                        size: 24,
                                        color: i < 4 ? Color.fromARGB(255, 238, 179, 31) : Colors.grey,
                                      )
                                    ]
                                  ],
                                ),
                              ),

                              // price product
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      state.product.getPrice(),
                                      style: TextStyle(
                                        color: Colors.lightBlue[600],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    if (state.product.attributes.promotional_price != null)...[
                                      const SizedBox(width: 20,),
                                      Text(
                                        formatPrice(state.product.attributes.price ?? 0),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          decoration: TextDecoration.lineThrough
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),

                              // select size
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Select size",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for(var i = 1; i < 15; i++)...[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            select_size = i;
                                          });
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          margin: const EdgeInsets.only(left: 20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: (select_size != i) ? Border.all(color: Colors.grey[200]!) : Border.all(color: Colors.blue, width: 2),
                                            shape: BoxShape.circle
                                          ),
                                          child: Text(
                                            (35.5 + i / 2).toString(),
                                            style: TextStyle(
                                              color: Colors.indigo[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                    const SizedBox(width: 20,)
                                  ],
                                ),
                              ),

                              // select color
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Select color",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for(var i in colors)...[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            select_color = i;
                                          });
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          margin: const EdgeInsets.only(left: 20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: i
                                          ),
                                          child: select_color == i ? Container(
                                            width: 20,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                            ),
                                          ) : null,
                                        ),
                                      )
                                    ],
                                    const SizedBox(width: 20,)
                                  ],
                                ),
                              ),

                              // specification
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Select color",
                                  style: TextStyle(
                                    color: Colors.indigo[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10,),
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        color: Colors.indigo[700]
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(
                                      state.product.attributes.description ?? "",
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(
                                      "Content",
                                      style: TextStyle(
                                        color: Colors.indigo[700]
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    MarkdownBody(
                                      data: state.product.attributes.content ?? "",
                                    ),
                                  ],
                                ),
                              ),

                              if (state.product.attributes.categories != null)...[
                                BlocProvider(
                                  create: (context) => FeaturedProductsCubit()..loadData(state.product.attributes.categories, state.product.attributes.slug),
                                  child: const FeaturedProduct(),
                                )
                              ],

                              // padding last
                              const SizedBox(height: 100,)
                            ],
                          );
                        }
                        else if (state is ProductDetailError) {
                          return const Text("Không tìm thấy sản phẩm");
                        }
                        else {
                          return Container();
                        }
                      },
                    )
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ProductBottomNavbar(
                select_color: select_color,
                select_size: select_size,
              )
            )
          ],
        )
      ),
    );   
  }
}