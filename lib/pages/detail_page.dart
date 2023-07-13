import 'package:app/misc/colors.dart';
import 'package:app/widgets/app_buttons.dart';
import 'package:app/widgets/app_large_text.dart';
import 'package:app/widgets/app_text.dart';
import 'package:app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/booking_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  void navigateToBookingPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500), // Set the desired transition duration
        pageBuilder: (_, __, ___) => const BookingPage(), // Replace with your booking page widget
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("img/mountain-one.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.white),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Tarsar Marsar", color: Colors.black.withOpacity(0.8)),
                        AppLargeText(text: "25000", color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        const SizedBox(width: 5),
                        AppText(text: "Jammu & Kashmir, India", color: AppColors.textColor1),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: index < gottenStars ? AppColors.starColor : AppColors.textColor2);
                          }),
                        ),
                        const SizedBox(width: 5),
                        AppText(text: "4.0", color: AppColors.textColor2),
                      ],
                    ),
                    const SizedBox(height: 30),
                    AppLargeText(text: "People", color: Colors.black.withOpacity(0.8), size: 20),
                    const SizedBox(height: 5),
                    AppText(text: "Number of people in your group", color: AppColors.mainTextColor),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index ? Colors.white : Colors.black,
                              backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 20),
                    const SizedBox(height: 5),
                    AppText(
                      text: "Hiking the Tarsar Marsar Pass will take you to the very centre of Kashmir. From Aru's lovely town to Lidderwat's open fields. Shekhawa's verdant mountains tumble down to enormous alpine lakes. Tarsar Marsar's location is so stunning, it will take weeks for the wonder to wear off.",
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60,
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(width: 20),
                  ResponsiveButton(
                    isResponsive: true,
                    onPressed: navigateToBookingPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
