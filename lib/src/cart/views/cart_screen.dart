import 'package:ecom_t/common/services/storage.dart';
import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/src/auth/views/login_screen.dart';
import 'package:ecom_t/src/cart/cartsProducts/cart_products_lists.dart';
import 'package:ecom_t/src/cart/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:ecom_t/src/cart/models/cart_product_model.dart'; // Import your CartProductModel

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Track products in the cart
  List<CartProductModel> cartProducts = [];

  // Function to add product to the cart
  void addToCart(CartProductModel product) {
    setState(() {
      cartProducts.add(product);
    });
  }
   // Function to show confirmation dialog
  void showRemoveConfirmationModal(BuildContext context, CartProductModel product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Removal"),
          content: Text("Are you sure you want to remove ${product.name} from your cart?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                removeFromCart(product); // Remove the product
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Remove"),
            ),
          ],
        );
      },
    );
  }


  // Function to remove product from the cart
  void removeFromCart(CartProductModel product) {
    setState(() {
      cartProducts.remove(product);
    });
  }

  // Check if a product is already in the cart
  bool isProductInCart(CartProductModel product) {
    return cartProducts.contains(product);
  }

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');

    if (accessToken == null) {
      print("User is not logged in. Redirecting to Login page.");
      return const LoginPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: Column(
        children: [
          // Cart items in a scrollable list
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
              ),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: cartProductsList.map((singleProduct) {
                        bool isInCart = isProductInCart(singleProduct);

                        return GestureDetector(
                          onTap: () {
                            print("Tapped on product: ${singleProduct.name}");
                          },
                          child: ProductCard(
                            product: singleProduct,
                            // Pass functions for actions based on the product's cart status
                            onRemove: (product) {
                              print(
                                  "Remove product called for: ${product.name}");
                              // removeFromCart(product);
                              // Trigger the confirmation modal when "Remove" is clicked
              showRemoveConfirmationModal(context, product);
                            },
                            toggleFavorite: (product) {
                              print(
                                  "Toggle favorite called for: ${product.name}");
                            },
                            onAddToCart: (product) {
                              print("Add to cart called for: ${product.name}");
                              addToCart(product);
                            },
                            // Pass the cart status
                            isInCart: isInCart,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  footer with .....Checkout and Add More buttons........
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Adding more More button
                FloatingActionButton.small(
                  backgroundColor: Kolors.kPrimary,
                  foregroundColor: Kolors.kWhite,
                  onPressed: () {
                    print(
                        "Floating Action Button Pressed to go home and add more");
                  },
                  child: const Icon(Icons.add),
                ),
                // Checkout button
                ElevatedButton(
                  onPressed: () {
                    if (cartProducts.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Your cart is empty. Add items to checkout."),
                        ),
                      );
                    } else {
                      print(
                          "Proceeding to checkout with ${cartProducts.length} items.");
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                const Text(
                  "Checkout Summary",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 ListView.builder(
                  shrinkWrap: true, // Ensures the list is scrollable inside the modal
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                    final product = cartProducts[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("Price: \$${product.price}"),
                    );
                  },
                ), const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Proceeding to payment");
                    Navigator.pop(context); // Close the modal
                  },
                  child: const Text("Proceed to Payment"),
                ),
                              ],
                            );
                          });
                      // Navigate to checkout page or perform checkout action
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    backgroundColor: Kolors.kPrimary,
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
