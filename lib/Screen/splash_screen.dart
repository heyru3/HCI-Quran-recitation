import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goHome();
  }

  void _goHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacementNamed(context, '/home', arguments: Colors.cyan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width / 0.7,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/splash-lottie.json'),
                const SizedBox(height: 10),
                Text(
                  'Qura\'n Audio',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ));
  }
}
