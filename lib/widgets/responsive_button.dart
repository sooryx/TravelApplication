import 'package:app/misc/colors.dart';
import 'package:app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final VoidCallback? onPressed;

  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment:
          isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppText(text: "Book Now", color: Colors.white),
            )
                : Container(),
            GestureDetector(
              onTap: onPressed,
              child: Image.asset("img/button-one.png"),
            ),
          ],
        ),
      ),
    );
  }
}
