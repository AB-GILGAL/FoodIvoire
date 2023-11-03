import 'package:flutter/material.dart';
import 'package:foodivoire/presentation/home.dart';
import 'package:foodivoire/src/shared/utils/colors.dart';

class OTPValidationView extends StatelessWidget {
  const OTPValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Food Ivoire',
                style: TextStyle(
                  fontSize: 28,
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
                child: Text(
              'Please enter the code sent by SMS to\nphone number',
              textAlign: TextAlign.center,
            )),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration:
                    InputDecoration(isDense: true, border: InputBorder.none),
                keyboardType: TextInputType.phone,
                // Add necessary logic to capture the entered phone number
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              child: const Text('Next'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(grey),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              child: const Text('Send another code'),
            ),
          ],
        ),
      ),
    );
  }
}
