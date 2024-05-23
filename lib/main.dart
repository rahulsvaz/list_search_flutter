import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController searchController = TextEditingController();
  List<String> products = ["mobiles", 'Camera', 'Laptop', 'Laptop Bag'];
  List<String> filteredProducts = [];

  @override
  void initState() {
    filteredProducts = products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color.fromARGB(255, 213, 210, 210),
                ),
                child: TextField(
                  onChanged: _filtterProducts,
                  controller: searchController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: filteredProducts.isEmpty?1:filteredProducts.length ,
                  itemBuilder: (context, index) {
                    log(filteredProducts.length.toString());
                    if (filteredProducts.isEmpty) {
                      return const Center(child: Text('No Products Found'),);
                    }
                    return ListTile(
                      title: Text(filteredProducts[index]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  _filtterProducts(String value) {
    setState(() {
      filteredProducts = products
          .where((elements) =>
              elements.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
