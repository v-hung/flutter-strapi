import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/products/product_detail/product_detail_cubit.dart';
import 'package:flutter_application_1/pages/product/widgets/product_appbar.dart';
import 'package:flutter_application_1/pages/product/widgets/product_slide.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, @pathParam required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit()..loadData(slug),
      child: const ProductDetailPageContent(),
    );
  }
}

class ProductDetailPageContent extends StatelessWidget {
  const ProductDetailPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(       
      body: SafeArea(
        child: Column(
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
                      print(state.product.getImages());
                      return Column(
                        children: [
                          // ProductSlide(images: state.product.getImages())
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
        )
      ),
    );   
  }
}