import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectuas/Page/detailproduct.dart';
import 'package:projectuas/Page/profilepage.dart';
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
              // ignore: sort_child_properties_last
              child: Text(
                'My App',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.asset('assets/images/profile.gif'),
              ),
              title: const Text(
                'My Account',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ProfilePage();
                  },
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.keyboard_arrow_left),
              title: const Text('Keluar'),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', false);
                // ignore: use_build_context_synchronously
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text(
          'HomePage',
          style: TextStyle(color: Colors.white),
        ),
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
                      elevation: 10,
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
                                style: GoogleFonts.inder(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange),
                                Text(
                                  "${snapshot.data!.products[index].rating}",
                                  style: GoogleFonts.inder(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
