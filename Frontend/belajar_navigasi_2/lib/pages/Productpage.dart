import 'package:belajar_navigasi_2/helper/Helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Productpage extends StatelessWidget {
  const Productpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Helper helper = Helper();
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product ${index + 1}",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                IconButton(
                    onPressed: () {
                      context.go('/home/product/${index + 1}');
                    },
                    icon: Icon(Icons.read_more))
              ],
            ),
          );
        },
      ),
    );
  }
}
