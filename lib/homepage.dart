import 'package:flutter/material.dart';
import 'package:darazapp/drawerside.dart' as drawer;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> products = [
    {
      "image": "assets/p1.jpeg",
      "name": "Product 1",
      "description": "High-quality product for everyday use.",
    },
    {
      "image": "assets/p2.jpeg",
      "name": "Product 2",
      "description": "Reliable and affordable product.",
    },
    {
      "image": "assets/p3.jpeg",
      "name": "Product 3",
      "description": "Premium materials with long-lasting performance.",
    },
    {
      "image": "assets/p4.jpeg",
      "name": "Product 4",
      "description": "Top choice for professionals.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: drawer.DrawerSide(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            const SizedBox(height: 10),
            _buildCategoryRow(),
            const SizedBox(height: 10),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daraz Screen',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleImage('assets/circle1.jpg'),
          _circleImage('assets/circle2.jpg'),
          _circleImage('assets/circle3.jpg'),
          _circleImage('assets/circle4.jpg'),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    product["image"]!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product["description"]!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            behavior: SnackBarBehavior.floating,
                            content: Row(
                              children: [
                                const Icon(Icons.check_circle, color: Colors.black),
                                const SizedBox(width: 8),
                                Text(
                                  '${product["name"]} added to cart',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart, color: Colors.white),
                      label: const Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _circleImage(String imagePath) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
