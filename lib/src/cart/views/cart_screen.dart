import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/src/auth/views/login_screen.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
     String? accesstoken = Storage().getString('accessToken');
  
    if (accesstoken == null) {
      return const LoginPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('cart screenn'),
      ),
      body: const Center(
        child: Text('cart screeen page'),
      ),
    );
  }
}