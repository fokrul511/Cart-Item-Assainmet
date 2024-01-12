import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

List<String> productName = ['Pullover', 'T-Shirt', 'Sport Dress'];
List<String> productSize = [
  'M',
  'M',
  'L',
];
List<String> productColor = ['black', 'White', 'Pink'];
List<int> productPrice = [
  30,
  40,
  50,
];
List<String> productImage = [
  'https://fullyfilmy.in/cdn/shop/files/Model_1_One_king.jpg?v=1689162855',
  'https://i.etsystatic.com/6134468/r/il/a1aace/4096656415/il_fullxfull.4096656415_8777.jpg',
  'https://mckups.com/wp-content/uploads/2021/01/t-shirt-2000x1335.jpg',
];

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  mySnakeBar(title, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }

  @override
  Widget build(BuildContext context) {
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
              itemCount: productImage.length,
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
                              imageUrl: productImage[index].toString(),height: 100, width: 100,fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
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
                                          productName[index].toString(),
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
                                          'Color: ${productColor[index].toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Size: ${productSize[index].toString()}',
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
                                                child: const Icon(CupertinoIcons.minus),
                                              ),
                                              onTap: () {
                                                print('-');
                                              },
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              '1',
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
                                                child: const Icon(CupertinoIcons.plus),
                                              ),
                                              onTap: () {
                                                print('+');
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${productPrice[index].toString()}",
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
                const Text('\$120',
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => dialogBox,
                );
              },
              child: const Text('CHECK OUT'),
            ),
          )
        ],
      ),
    );
  }
}

//start dilog
var dialogBox = Dialog(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0)), //this right here
  child: SizedBox(
    height: 300.0,
    width: 300.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Congratulation!',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'You have added',
            style: TextStyle(color: Colors.black,fontSize: 16),
          ),
        ),
        const Text(
          '5',
          style: TextStyle(color: Colors.black,fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'T-shirt on your bag',
            style: TextStyle(color: Colors.black,fontSize: 16),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        Padding(
          padding:  EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
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

//end dilaog
