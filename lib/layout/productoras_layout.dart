import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class ProductorasLayout extends StatefulWidget {
  @override
  State<ProductorasLayout> createState() => _ProductorasLayoutState();
}

class _ProductorasLayoutState extends State<ProductorasLayout> {
  @override
  Widget build(BuildContext context) {
    final Size customSize = Size(85, 85);
    final double customWidth = customSize.width;
    final double customHeight = customSize.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CustomTextWidget2(
            text: 'Las productoras más galardonadas',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: customHeight,
                width: customWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv7K-BjtdCX863fkZI7FY50gZcwPmmlNT-ZUUU4r0u7Y5pOIklKONDuvzSMsMPGgqFuyo&usqp=CAU',
                    ),
                    placeholder: AssetImage('assets/images/usuario_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: customHeight,
                width: customWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    image: NetworkImage(
                      'https://logowik.com/content/uploads/images/paramount-network8623.jpg',
                    ),
                    placeholder: AssetImage('assets/images/usuario_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: customHeight,
                width: customWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    image: NetworkImage(
                      'https://img-new.cgtrader.com/items/3586206/49f6bf3034/large/netflix-logo-icon-3d-model-obj-3ds-fbx-c4d-stl.jpg',
                    ),
                    placeholder: AssetImage('assets/images/usuario_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: customHeight,
                width: customWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    image: NetworkImage(
                      'https://thenationonlineng.net/wp-content/uploads/2020/07/Dreamworks-Animation-studio.jpg',
                    ),
                    placeholder: AssetImage('assets/images/usuario_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
