class Product {
  final String id;
  final String name;
  final String status;
  final bool favorite;
  final double price;
  final String description;
  final double rating;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.status,
    required this.price,
    required this.description,
    required this.rating,
    required this.favorite,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'] as String,
      favorite:json['favorite'] as bool ,
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'status': status,
      'price': price,
      'description': description,
      'rating': rating,
      'favorite': favorite,
    };
  }
}
Map<String, dynamic> json = {

  "favorite": 'true',
  "id": '1001',
  "name": "Product Name",
  "status": 'pending',
  'image':'https://www.pngmart.com/files/15/Food-Plate-Top-View-Pasta-PNG.png',
  "price": 19.99,
  "description": 'Product description goes here',
  "rating": 4.5,
};

Product product = Product.fromJson(json);
Map<String, dynamic> productJson = product.toJson();
