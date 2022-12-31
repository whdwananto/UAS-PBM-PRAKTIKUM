import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projectuas/Page/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 175,
                child: Image.asset(
                  'assets/images/Stet.jpeg',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'TOSERBA',
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  color: Color(0xffC84C55),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
