import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/provider/products/product_detail/product_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class ProductAppbar extends StatelessWidget {
  const ProductAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 221, 221, 221)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                context.router.navigateBack();
              }, 
              iconSize: 20,
              color: Colors.grey,
              icon: const Icon(Icons.arrow_back_ios_new_rounded)
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  if (state is ProductDetailLoading) {
                    return const Text(
                      "Đang tải...",
                      style: TextStyle(
                        color: Color.fromRGBO(48, 63, 159, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
                  else if (state is ProductDetailLoaded) {
                    return Text(
                      state.product.attributes.name,
                      style: const TextStyle(
                        color: Color.fromRGBO(48, 63, 159, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
                  else {
                    return const Text(
                      "Không tìm thấy",
                      style: TextStyle(
                        color: Color.fromRGBO(48, 63, 159, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    );
                  }
                }
              ),
            ),
            const SizedBox(width: 20,),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.grey,
                  onPressed: () {  },
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert_rounded),
                  iconSize: 28,
                  color: Colors.grey,
                  onPressed: () {  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}