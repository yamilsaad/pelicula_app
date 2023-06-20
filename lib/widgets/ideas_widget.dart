import 'package:flutter/material.dart';

import 'widget.dart';

class Product {
  //final String title;
  final String imageUrl;
  //final String detalle;

  Product({required this.imageUrl});
}

class ProductoraWidget extends StatefulWidget {
  const ProductoraWidget({super.key});

  @override
  State<ProductoraWidget> createState() => _ProductoraWidgetState();
}

class _ProductoraWidgetState extends State<ProductoraWidget> {
  final List<Product> products = [
    Product(
      imageUrl: 'assets/action.png',
    ),
    Product(
      imageUrl: 'assets/sexy.png',
    ),
    Product(
      imageUrl: 'assets/show.png',
    ),
    Product(
      imageUrl: 'assets/love.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget2(
          text: 'Sabemos lo que querés',
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 210, // Ajusta la altura según tus necesidades
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                height: 190,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    products[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
