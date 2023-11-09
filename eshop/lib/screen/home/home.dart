// ignore_for_file: prefer_const_constructors

import 'package:eshop/constrains/textstyle.dart';
import 'package:eshop/firebase_helper/firebase_authhelper/firebase_auth_helper.dart';
import 'package:eshop/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:eshop/model/product_models.dart';
import 'package:eshop/widget/top-title.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  List<Product> categoriieslist = [];
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() async {
    setState(() {
      isLoading = true;
    });
    categoriieslist = await FirebaseFirestoreHelper.instance.getCategories();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading?Container(
        width: 200,
        alignment: Alignment.center,
        height:200,
        child: CircularProgressIndicator()): Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitles(title: 'E-Commerce', subtitle: ''),
            TextFormField(
              decoration: InputDecoration(hintText: 'Search.....'),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriieslist
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.blue[100],
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: Center(
                                child: Image.network(
                                  e.image,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Popular Product",
              style: customTextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.74,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemCount: foodProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue[100],
                      child: Column(
                        children: [
                          Image.network(
                            foodProducts[index].image,
                            height: 120,
                            width: 130,
                          ),
                          Column(
                            children: [
                              Text(
                                foodProducts[index].name,
                                style: customTextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Price: \$${foodProducts[index].price.toString()}"),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: 130,
                                child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.amber,
                                        shadowColor: Colors.amber,
                                        foregroundColor: Colors.black,
                                        side: BorderSide(color: Colors.black)),
                                    child: Text('Add to Cart')),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

List<String> categoriesLis = [
  'assets/images/food5.png',
  'assets/images/food6.png',
  'assets/images/food7.png',
  'assets/images/food1.png',
  'assets/images/food2.png',
  'assets/images/food3.png',
  'assets/images/food4.png',
];
List<Product> foodProducts = [
  Product(
      id: '1',
      name: 'Burger',
      status: 'In Stock',
      favorite: true,
      price: 5.99,
      description: 'Delicious burger with all the fixings.',
      rating: 4.5,
      image: 'https://www.pngmart.com/files/1/Burger-Food-PNG.png'),
  Product(
      id: '2',
      name: 'Pizza',
      status: 'In Stock',
      favorite: false,
      price: 9.99,
      description: 'Freshly baked pizza with your choice of toppings.',
      rating: 4.0,
      image: "https://www.pngmart.com/files/1/Pepperoni-Pizza.png"),
  Product(
      id: '3',
      name: 'Pasta',
      status: 'In Stock',
      favorite: true,
      price: 7.99,
      description: 'Delicious pasta dish with homemade sauce.',
      rating: 4.7,
      image:
          'https://www.pngmart.com/files/15/Food-Plate-Top-View-Pasta-PNG.png'),
  Product(
    id: '4',
    name: 'Sushi',
    status: 'Out of Stock',
    favorite: false,
    price: 12.99,
    description: 'Fresh and flavorful sushi rolls.',
    rating: 4.2,
    image:
        'https://www.pngmart.com/files/7/Fresh-Healthy-Food-Background-PNG.png',
  ),
  Product(
    id: '5',
    name: 'Salad',
    status: 'In Stock',
    favorite: true,
    price: 6.99,
    description: 'Healthy and crisp salad with a variety of veggies.',
    rating: 4.8,
    image: 'https://www.pngmart.com/files/1/Salad-Transparent-Background.png',
  ),
  Product(
    id: '6',
    name: 'Steak',
    status: 'In Stock',
    favorite: true,
    price: 15.99,
    description: 'Tender and juicy steak cooked to perfection.',
    rating: 4.9,
    image: 'https://www.pngmart.com/files/22/Steak-PNG-Pic.png',
  ),
  Product(
      id: '7',
      name: 'Ice Cream',
      status: 'In Stock',
      favorite: false,
      price: 4.99,
      description: 'Creamy and delightful ice cream in various flavors.',
      rating: 4.3,
      image: 'https://www.pngmart.com/files/23/Icecream-PNG-Image.png'),
  Product(
    id: '8',
    name: 'Soda',
    status: 'In Stock',
    favorite: true,
    price: 1.99,
    description: 'Refreshing carbonated beverages in assorted flavors.',
    rating: 3.8,
    image: 'https://www.pngmart.com/files/7/Soda-PNG-Image.png',
  ),
  Product(
    id: '9',
    name: 'Soup',
    status: 'In Stock',
    favorite: true,
    price: 3.99,
    description: 'Warm and comforting soup with various options.',
    rating: 4.4,
    image: 'https://www.pngmart.com/files/23/Soup-PNG-Isolated-Photo.png',
  ),

  // Add more food products here with their respective details and image URLs
];
