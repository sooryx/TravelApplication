import 'package:flutter/material.dart';
import 'package:app/widgets/app_large_text.dart';
import 'package:app/widgets/app_text.dart';
import 'package:app/widgets/responsive_button.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool bookingSuccessful = false;

  void bookNow() {
    setState(() {
      bookingSuccessful = true;
    });

    // POP UP
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Successful'),
          content: const Text('Your booking has been confirmed.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
              left: 20,
              top: 50,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.black54),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Align(
                      alignment: Alignment.center,
                      child: AppLargeText(
                        text: "Booking Details",
                        color: Colors.black.withOpacity(0.8),
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppText(text: "Name", color: Colors.black, size: 18),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppText(text: "Email", color: Colors.black, size: 18),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppText(text: "Phone", color: Colors.black, size: 18),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ResponsiveButton(
                      isResponsive: true,
                      onPressed: bookNow,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
