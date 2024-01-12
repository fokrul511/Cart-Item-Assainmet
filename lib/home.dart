import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

List allItemCard = [
  {
    "productName": "Pullover",
    "productSize": "M",
    "productColor": "black",
    "productPrice": 30,
    "productImage":
        "https://fullyfilmy.in/cdn/shop/files/Model_1_One_king.jpg?v=1689162855",
    "quantity": 1
  },
  {
    "productName": "T-Shirt",
    "productSize": "M",
    "productColor": "White",
    "productPrice": 40,
    "productImage":
        "https://fullyfilmy.in/cdn/shop/files/Model_1_One_king.jpg?v=1689162855",
    "quantity": 1
  },
  {
    "productName": "Sport Dress",
    "productSize": "L",
    "productColor": "Pink",
    "productPrice": 50,
    "productImage":
        "https://fullyfilmy.in/cdn/shop/files/Model_1_One_king.jpg?v=1689162855",
    "quantity": 1
  }
];

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int get totalAmount {
    return allItemCard.fold<int>(
        0,
        (total, product) =>
            total + product['productPrice'] * product['quantity'] as int);
  }

  @override
  Widget build(BuildContext context) {
    mySnakeBar(title, context) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(title),
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.green,
      ));
    }

    var dialogBox = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Congratulation!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'You have added',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const Text(
              '5',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'T-shirt on your bag',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30.0)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 44),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                child: const Text(
                  'OKAY',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'My Bag',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allItemCard.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  allItemCard[index]['productImage'].toString(),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                  child: const CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Center(child: Icon(Icons.error)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          allItemCard[index]['productName']
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                        const Icon(
                                          Icons.more_vert,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Color: ${allItemCard[index]['productColor'].toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Size: ${allItemCard[index]['productSize'].toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ), // button start
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                        spreadRadius: 1,
                                                      )
                                                    ],
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                child: const Icon(
                                                    CupertinoIcons.minus),
                                              ),
                                              onTap: () {
                                                if (allItemCard[index]
                                                        ['quantity'] >
                                                    1) {
                                                  allItemCard[index]
                                                      ['quantity'] -= 1;
                                                  setState(() {});
                                                }
                                                mySnakeBar(
                                                    'decress Your product price',
                                                    context);
                                              },
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '${allItemCard[index]['quantity'].toString()}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(width: 10),
                                            InkWell(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                      )
                                                    ],
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                child: const Icon(
                                                    CupertinoIcons.plus),
                                              ),
                                              onTap: () {
                                                if (allItemCard[index]
                                                        ['quantity'] ==
                                                    4) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          dialogBox);
                                                }

                                                allItemCard[index]
                                                    ['quantity'] += 1;
                                                setState(() {});

                                                mySnakeBar(
                                                    'Incress Your product price',
                                                    context);
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${allItemCard[index]['productPrice'] * allItemCard[index]['quantity']}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(color: Colors.black.withOpacity(0.8)),
                ),
                Text(totalAmount.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 5,
                minimumSize: const Size(double.infinity, 44),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text('CHECK OUT'),
            ),
          )
        ],
      ),
    );
  }
}
