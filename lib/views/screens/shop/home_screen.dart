import 'package:crafty_bay/views/screens/shop/_part/all_categories.dart';
import 'package:crafty_bay/views/screens/shop/_part/product_by_remark.dart';
import 'package:crafty_bay/views/widgets/crafty_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CraftyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const AllCategories(),
              const ProductByRemark(remark: 'Popular'),
              const ProductByRemark(remark: 'Special'),
              const ProductByRemark(remark: 'New'),
            ],
          ),
        ),
      ),
    );
  }
}
