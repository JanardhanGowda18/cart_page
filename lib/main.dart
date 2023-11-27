import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProductDetails {
  final String name;
  final double price;
  final String description;

  ProductDetails({
    required this.name,
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
    name: 'Indian Filter Coffee',
    price: 7.50,
    description:
    'One of the most common ways to drink coffee in India is as a Filter Kaapi. Filter Kaapi basically means filter coffee and is incredibly popular in southern India. With the migrations of Southern Indians worldwide, they brought their coffee culture along with them. ',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cafe Shop',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, size: 35, color: Colors.brown),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0,bottom: 2.0),
              child: Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'images/th1.jpg',
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 26),
                    Row(
                      children: [
                        Text(
                          'Indian Filter Coffee',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(width: 100),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),

                    IngredientImages(
                      imageUrls: [
                        'https://cdn.wallpapersafari.com/22/8/eqPAEm.jpg',
                        'https://tse3.mm.bing.net/th?id=OIP.DgJZEYAEaWhz_XKvshu-cgHaHa&pid=Api&P=0&h=220',
                        'https://tse4.mm.bing.net/th?id=OIP.fatNujrwhVfusDITRSV9UAHaFn&pid=Api&P=0&h=220',
                        'https://tse4.mm.bing.net/th?id=OIP.qphinZje4LtU_Qo_Ikok5gHaEo&pid=Api&P=0&h=220',
                      ],
                      labels: ['Water', 'Milk', 'Sugar', 'Coffee Beans'],
                    ),

                    SizedBox(height: 16),
                    Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
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
                    SizedBox(height: 40),
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
                            primary: Colors.brown,
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
                            color: Colors.brown,
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
                            primary: Colors.brown,
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
                            primary: Colors.brown,
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
