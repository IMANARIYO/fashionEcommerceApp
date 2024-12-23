import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/src/cart/models/cart_product_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onRemove,
    required this.toggleFavorite,
    required this.onAddToCart,
    required this.isInCart, // Added to check if product is in cart
  });

  final void Function(CartProductModel product)? onRemove;
  final void Function(CartProductModel product)? toggleFavorite;
  final void Function(CartProductModel product)? onAddToCart;
  final bool isInCart; // Whether the product is in the cart or not
  final CartProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;
  bool wishlist = false;

  // Function to increment quantity
  void incrementQuantity() {
    if (quantity < widget.product.stock) {
      setState(() {
        quantity++;
      });
    }
  }

  // Function to decrement quantity
  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  // Function to handle add to cart
  void handleAddToCart() {
    widget.onAddToCart!(widget
        .product); // Calls the function passed from parent to add the product
    setState(() {
      quantity = 1; // Reset quantity to 1 when adding the product
    });
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = widget.product.price * quantity;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge and Wishlist Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.product.badge,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  wishlist ? Icons.favorite : Icons.favorite_border,
                  color: wishlist ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  widget.toggleFavorite!(widget.product);
                  setState(() {
                    wishlist = !wishlist;
                  });
                },
              ),
            ],
          ),

          // Product Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wallpapers.com/images/featured/the-flash-pictures-hbi9deutvaidc6oc.jpg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Image loaded successfully
                    }
                    return const Center(
                      child:
                          CircularProgressIndicator(), // Show a loader while image is loading
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 150,
                      color: const Color.fromARGB(
                          255, 229, 228, 235), // Placeholder background
                      child: const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Color.fromARGB(
                            255, 218, 173, 173), // Icon for a broken image
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        '${widget.product.color} • Size ${widget.product.size}'),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                            '${widget.product.rating} (${widget.product.reviews})'),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            '\$${widget.product.originalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // If the product is not in the cart, show "Add to Cart" button
          if (!widget.isInCart)
            ElevatedButton(
                onPressed: handleAddToCart,

                // child: const Text('Add to Cart'),
                child: const Text(
                  "add to cart",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ))
          else
            // Quantity and Subtotal if product is in the cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity Selector
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrementQuantity,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller:
                            TextEditingController(text: quantity.toString()),
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          final int? newQuantity = int.tryParse(value);
                          if (newQuantity != null &&
                              newQuantity > 0 &&
                              newQuantity <= widget.product.stock) {
                            setState(() {
                              quantity = newQuantity;
                            });
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: incrementQuantity,
                    ),
                  ],
                ),
                // Subtotal and Remove Button
                Row(
                  children: [
                    // const Text('Subtotal:'),
                    Text(
                      '\$${subtotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Kolors.kSecondaryLight,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          widget.onRemove!(widget
                              .product); // Calls onRemove to remove the product from the cart
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),

          // Stock Warning
          if (widget.product.stock >= 5)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Only ${widget.product.stock} items left!',
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
