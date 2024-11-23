import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    _naigator();
    super.initState();
  }

  _naigator() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      if (Storage().getBool("firstOpen") == null) {
        //go to on boarding screnn
        GoRouter.of(context).go('/onboarding');
      } else {
        //Go  to the home page
        GoRouter.of(context).go("/home");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG),
            fit: BoxFit.cover,
          ),
        ),

        // child: Text("SplashScreen"),
      ),
    );
  }
}
