// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/constrains/routes.dart';
import 'package:ecommerce/constrains/textstyle.dart';
import 'package:ecommerce/model/product_models.dart';
import 'package:ecommerce/screen/welcomepage.dart';
import 'package:ecommerce/widget/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                children: categoriesLis
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.white,
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: Center(
                                child: Image.asset(
                                  e,
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
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemCount: foodProducts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Image.network(
                            foodProducts[index].image,
                            fit: BoxFit.cover,
                          ),
                          // Column(
                          //   children: [
                          //     Text(foodProducts[index].name),
                          //     Text(foodProducts[index].price.toString()),
                          //   ],
                          // ),
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
      image:
          'https://img.freepik.com/premium-psd/burger-3d-render-illustration-isolated-transparent-background_106547-1.jpg?w=740'),
  Product(
    id: '2',
    name: 'Pizza',
    status: 'In Stock',
    favorite: false,
    price: 9.99,
    description: 'Freshly baked pizza with your choice of toppings.',
    rating: 4.0,
    image:
        'https://toppng.com/uploads/preview/transparent-png-pizza-pepperoni-pizza-1156311772084svgw9hld.png',
  ),
  Product(
      id: '3',
      name: 'Pasta',
      status: 'In Stock',
      favorite: true,
      price: 7.99,
      description: 'Delicious pasta dish with homemade sauce.',
      rating: 4.7,
      image:
          'https://image.similarpng.com/very-thumbnail/2022/03/Spaghetti-in-dish-isolated-on-transparent-background-PNG.png'),
  Product(
    id: '4',
    name: 'Sushi',
    status: 'Out of Stock',
    favorite: false,
    price: 12.99,
    description: 'Fresh and flavorful sushi rolls.',
    rating: 4.2,
    image:
        'https://img.freepik.com/free-vector/watercolor-delicious-japanese-umeboshi-onigiri_52683-56147.jpg?w=740&t=st=1694938080~exp=1694938680~hmac=b8a58f919b76826075c692520840b802fb1155bc724a941e9e4bce49cdf84471',
  ),
  Product(
    id: '5',
    name: 'Salad',
    status: 'In Stock',
    favorite: true,
    price: 6.99,
    description: 'Healthy and crisp salad with a variety of veggies.',
    rating: 4.8,
    image:
        'https://img.freepik.com/free-vector/vegetables-mix-white_98292-5109.jpg?size=626&ext=jpg&ga=GA1.2.581296173.1694937398&semt=ais',
  ),
  Product(
    id: '6',
    name: 'Steak',
    status: 'In Stock',
    favorite: true,
    price: 15.99,
    description: 'Tender and juicy steak cooked to perfection.',
    rating: 4.9,
    image:
        'https://img.freepik.com/premium-photo/isolated-plate-grilled-beef-steak-bone_219193-9464.jpg?size=626&ext=jpg&ga=GA1.2.581296173.1694937398&semt=ais',
  ),
  Product(
    id: '7',
    name: 'Ice Cream',
    status: 'In Stock',
    favorite: false,
    price: 4.99,
    description: 'Creamy and delightful ice cream in various flavors.',
    rating: 4.3,
    image:
        'https://img.freepik.com/premium-photo/chocolate-vanilla-strawberry-ice-cream-isolated-white_807701-3441.jpg?size=626&ext=jpg&ga=GA1.1.581296173.1694937398&semt=ais',
  ),
  Product(
    id: '8',
    name: 'Soda',
    status: 'In Stock',
    favorite: true,
    price: 1.99,
    description: 'Refreshing carbonated beverages in assorted flavors.',
    rating: 3.8,
    image:
        'https://img.freepik.com/free-photo/ice-falling-into-glass-with-brown-drink_1194-1154.jpg?t=st=1694938367~exp=1694938967~hmac=bb835f2f84f1832bfa1f516c07944cb82ff855d2919acb2a1a0a952d5bd4aa6e',
  ),
  Product(
    id: '9',
    name: 'Soup',
    status: 'In Stock',
    favorite: true,
    price: 3.99,
    description: 'Warm and comforting soup with various options.',
    rating: 4.4,
    image:
        'https://img.freepik.com/free-photo/soup-isolated-white-background_93675-131990.jpg?size=626&ext=jpg&ga=GA1.2.581296173.1694937398&semt=ais',
  ),
  Product(
    id: '10',
    name: 'Fish Tacos',
    status: 'In Stock',
    favorite: false,
    price: 8.99,
    description: 'Delightful fish tacos with a zesty twist.',
    rating: 4.1,
    image:
        'https://img.freepik.com/premium-photo/tacos-with-meat-vegetables-isolated-white-background_1339-63877.jpg?size=626&ext=jpg&ga=GA1.1.581296173.1694937398&semt=ais',
  ),
  // Add more food products here with their respective details and image URLs
];
