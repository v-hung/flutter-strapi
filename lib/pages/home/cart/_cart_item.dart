import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey
              //  image: const DecorationImage(
              //   image: NetworkImage("https://cf.shopee.vn/file/84c099fcf4fbe3a29792512b4a86e9dc"),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                "https://cdn.shopify.com/s/files/1/0081/3305/0458/files/banner-image-4_420x.jpg?v=1655801178",
                fit: BoxFit.cover,
              )
            ),
          ),

          const SizedBox(width: 15,),
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami Nike Air Zoom Pegasus 36 Miami",
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 10,),
                      const Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      )
                    ],
                  ),
            
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "714,000₫",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: (){}, 
                              child: Text("-"),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[800],
                                minimumSize: Size.zero, // Set this
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18)// and this
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                controller: TextEditingController(text: '0'),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  filled: true, //<-- SEE HERE
                                  fillColor: Color.fromARGB(255, 226, 226, 226),
                                ),
                                style: const TextStyle(
                                  fontSize: 14.0, 
                                  height: 1.0, 
                                  color: Color.fromRGBO(66, 66, 66, 1),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TextButton(
                              onPressed: (){}, 
                              child: Text("+"),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[800],
                                minimumSize: Size.zero, // Set this
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18)// and this
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}