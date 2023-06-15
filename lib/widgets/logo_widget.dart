import 'package:flutter/material.dart';

import 'widget.dart';

class LogoWidgetFlutter extends StatelessWidget {
  const LogoWidgetFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextWidget(
                text: 'Verifarma Video Club',
              ),
            ),
            FlutterLogo(
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
