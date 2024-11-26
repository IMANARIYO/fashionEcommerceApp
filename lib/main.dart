import 'package:ecom_t/common/utils/app_routes.dart';
import 'package:ecom_t/common/utils/environment.dart';
import 'package:ecom_t/common/utils/kstrings.dart';
import 'package:ecom_t/src/auth/controllers/auth_notifier.dart';
import 'package:ecom_t/src/auth/controllers/passoword_notifier.dart';
import 'package:ecom_t/src/categories/views/controllers/category_notifier.dart';
import 'package:ecom_t/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:ecom_t/src/home/controllers/home_tab_notifier.dart';
import 'package:ecom_t/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:ecom_t/src/products/controllers/colors_sizes_notifier.dart';
import 'package:ecom_t/src/products/controllers/product_notifier.dart';
import 'package:ecom_t/src/splashScreen/views/splashscreen_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Override debugPrint to suppress unwanted logs

  debugPrintRebuildDirtyWidgets = false;
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ChangeNotifierProvider(create: (_) => CategoryNotifier()),
      ChangeNotifierProvider(create: (_) => HomeTabNotifier()),
      ChangeNotifierProvider(create: (_) => ProductNotifier()),
      ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
      ChangeNotifierProvider(create: (_) => ColorsSizesNotifier()),
      ChangeNotifierProvider(create: (_) => PasswordNotifier()),
      ChangeNotifierProvider(create: (_) => Authnotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: false,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppNName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
      child: const Splashscreen(),
    );
  }
}
