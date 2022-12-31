import 'package:flutter/material.dart';
import 'package:projectuas/Page/detailproduct.dart';
import 'package:projectuas/Service%20Api/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  ProductApiServices services = ProductApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('My App'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Keluar'),
              leading: const Icon(Icons.keyboard_arrow_left),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', false);
                // ignore: use_build_context_synchronously
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: services.fetchProductApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 230,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                itemCount: snapshot.data!.products.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data!.products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailProducts(
                            Product: product,
                          );
                        },
                      ));
                    },
                    child: Card(
                      elevation: 30,
                      shadowColor: Colors.black,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              color: Colors.grey,
                              child: Image.network(
                                snapshot.data!.products[index].thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data!.products[index].title,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange),
                                Text(
                                    "${snapshot.data!.products[index].rating}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
