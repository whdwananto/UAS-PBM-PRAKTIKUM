import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectuas/Page/checkout.dart';

class DetailProducts extends StatelessWidget {
  final Product;
  const DetailProducts({super.key, this.Product});

  @override
  Widget build(BuildContext context) {
    final rating = Product.rating;
    final List<String> imgList = Product.images;
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                ),
              ),
            ))
        .toList();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          Product.title,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                ),
                Container(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  // height: 190,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              Product.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // const Spacer(
                          //   flex: 5,
                          // ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border_outlined))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ${Product.price}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     RatingBar(
                      //       initialRating: rating,
                      //       direction: Axis.horizontal,
                      //       allowHalfRating: true,
                      //       ignoreGestures: true,
                      //       itemCount: 5,
                      //       ratingWidget: RatingWidget(
                      //           full: const Icon(Icons.star,
                      //               color: Colors.orange),
                      //           half: const Icon(
                      //             Icons.star_half,
                      //             color: Colors.orange,
                      //           ),
                      //           empty: const Icon(
                      //             Icons.star_outline,
                      //             color: Colors.orange,
                      //           )),
                      //       onRatingUpdate: (double value) {
                      //         rating;
                      //       },
                      //     ),
                      //     Text('${Product.rating}')
                      //   ],
                      // ),
                      Container(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          minimumSize: const Size(double.infinity, 30),
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PesanBayar(Product: Product),
                              ));
                        },
                        child: const Text(
                          'Pesan Sekarang',
                          // style: TextStyle(color: Colors.black),
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  // height: 80,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Ulasan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                      Row(
                        children: [
                          RatingBar(
                            initialRating: rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                                full: const Icon(Icons.star,
                                    color: Colors.orange),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.orange,
                                ),
                                empty: const Icon(
                                  Icons.star_outline,
                                  color: Colors.orange,
                                )),
                            onRatingUpdate: (double value) {
                              rating;
                            },
                          ),
                          Text('${Product.rating}')
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  // height: 80,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Keterangan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(Product.description)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 100,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            "Detail Produk",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 10,
                      // ),
                      Container(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text("Kategori: "),
                          Text(Product.category),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text("Merek: "),
                          Text(Product.brand),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                      // Row(
                      //   children: [
                      //     const Text("Harga: "),
                      //     Text(Product.price.toString()),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
