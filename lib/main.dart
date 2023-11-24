import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProductDetails {
  final String name;
  final String weight;
  final String calories;
  final double price;
  final String description;

  ProductDetails({
    required this.name,
    required this.weight,
    required this.calories,
    required this.price,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  final ProductDetails product = ProductDetails(
    name: 'Fruity Summer',
    weight: '300gr',
    calories: '567cal',
    price: 7.50,
    description:
    'Fluffy butter layers,  whole blueberries and cinnamon jamraspberries, Fruit the fleshy or dry ripened ovary of a flowering plant; fruits have been developed',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cupcake',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(

                    icon: Icon(Icons.shopping_cart, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Text(
              'Product Details',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
              textAlign: TextAlign.end,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/th.jpeg',
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Fruity Summer ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 130),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      '${product.weight} ${product.calories}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),

                    IngredientImages(
                        imageUrls: [
                          'https://vectorified.com/image/gluten-vector-2.jpg',
                          'https://tse4.mm.bing.net/th?id=OIP.8H5m4mD82jec9FvouDwwRwAAAA&pid=Api&P=0&h=220',
                          'https://cdn2.vectorstock.com/i/1000x1000/04/46/milk-flat-icon-with-long-shadow-vector-4920446.jpg',
                          'https://tse1.mm.bing.net/th?id=OIP.n342pHKDT007BvmBknPftAAAAA&pid=Api&P=0&h=220'],
                        labels: ['Gluten', 'Walnut','Milk','Eggs']
                    ),

                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.start,
                    ),

                    SizedBox(height: 10),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              quantity = quantity - 1 > 0 ? quantity - 1 : 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Icon(Icons.remove),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              quantity = quantity + 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            print('Added to Cart: $quantity ${product.name}(s)');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientImages extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> labels;

  const IngredientImages({
    Key? key,
    required this.imageUrls,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: List.generate(
        imageUrls.length,
            (index) {
          if (index < labels.length) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imageUrls[index],
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}