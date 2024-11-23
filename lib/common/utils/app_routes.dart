
import 'package:ecom_t/src/auth/views/login_screen.dart';
import 'package:ecom_t/src/auth/views/registration_screen.dart';
import 'package:ecom_t/src/categories/views/categories_screen.dart';
import 'package:ecom_t/src/categories/views/category_page.dart';
import 'package:ecom_t/src/entrypoint/views/entrypoint.dart';
import 'package:ecom_t/src/notifications/views/notifications_screen.dart';
import 'package:ecom_t/src/onboarding/views/onbaording_sreen.dart';
import 'package:ecom_t/src/products/views/product_screen.dart';
import 'package:ecom_t/src/profile/views/orders_screen.dart';
import 'package:ecom_t/src/profile/views/policy_screen.dart';
import 'package:ecom_t/src/profile/views/shipping_address.dart';
import 'package:ecom_t/src/search/views/search_screen.dart';
import 'package:ecom_t/src/splashScreen/views/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


final GoRouter _router = GoRouter(
   navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => AppEntryPoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewsPage(),
    // ),
    GoRoute(
      path: '/policy',
      builder: (context, state) => const PolicyPage(),
    ),
    // GoRoute(
    //   path: '/verification',
    //   builder: (context, state) => const VerificationPage(),
    // ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
    // GoRoute(
    //   path: '/help',
    //   builder: (context, state) => const HelpCenterPage(),
    // ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesPage(),
    ),
     GoRoute(
      path: '/category',
      builder: (context, state) => const CategoryPage(),
    ),

    GoRoute(
      path: '/address',
      builder: (context, state) => const ShippingAddress(),
    ),

    // GoRoute(
    //   path: '/addresses',
    //   builder: (context, state) => const AddressesListPage(),
    // ),

     GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsPage(),
    ),

    //  GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),

    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),

    //   GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),

    //   GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),

    GoRoute(
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return ProductPage(productId: productId.toString());
      },
    ),
  ],
);

GoRouter get router => _router;