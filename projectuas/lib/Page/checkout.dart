import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:projectuas/Page/listproduct.dart';

enum MetodeBayar { bayarditempat, indoalfa, viabank }

enum PilihanKurir { sicepat, tiki, jne }

class PesanBayar extends StatefulWidget {
  // final produk barang;
  // const PesanBayar({super.key, required this.barang});
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Product;
  // ignore: non_constant_identifier_names
  const PesanBayar({super.key, required this.Product});

  @override
  // ignore: no_logic_in_create_state
  State<PesanBayar> createState() => _PesanBayarState(Product);
}

class _PesanBayarState extends State<PesanBayar> {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Product;
  _PesanBayarState(this.Product);
  MetodeBayar? _character = MetodeBayar.bayarditempat;
  PilihanKurir? _char = PilihanKurir.sicepat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "Check Out",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 3),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 110,
            child: Row(
              children: [
                // Icon(Icons.image, size: 110),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    Product.thumbnail,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Product.title,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 17,
                            // overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Harga: \$ ${Product.price}",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Alamat',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15),
                  prefixIcon: Icon(
                    Icons.location_on,
                    // color: Color(0xff5ac18e),
                    color: Colors.red,
                  ),
                  hintText: 'masukan alamat',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'No Handphone',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: const TextField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  hintText: 'masukan nomor handphone',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Jumlah Pembelian',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 3),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: const TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 15),
                  prefixIcon: Icon(
                    Icons.shopping_bag,
                    // color: Color(0xff5ac18e),
                    color: Colors.red,
                  ),
                  hintText: 'masukan jumlah pembelian',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              'Metode Pembayaran',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Alfamart/Indomart'),
                  leading: Radio<MetodeBayar>(
                    activeColor: Colors.red,
                    value: MetodeBayar.indoalfa,
                    groupValue: _character,
                    onChanged: (MetodeBayar? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Bayar ditempat'),
                  leading: Radio<MetodeBayar>(
                    activeColor: Colors.red,
                    value: MetodeBayar.bayarditempat,
                    groupValue: _character,
                    onChanged: (MetodeBayar? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Transfer Via Bank'),
                  leading: Radio<MetodeBayar>(
                    activeColor: Colors.red,
                    value: MetodeBayar.viabank,
                    groupValue: _character,
                    onChanged: (MetodeBayar? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              'Pilihan Kurir',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  title: const Text('SiCepat'),
                  leading: Radio<PilihanKurir>(
                    activeColor: Colors.red,
                    value: PilihanKurir.sicepat,
                    groupValue: _char,
                    onChanged: (PilihanKurir? value) {
                      setState(() {
                        _char = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('TIKI'),
                  leading: Radio<PilihanKurir>(
                    activeColor: Colors.red,
                    value: PilihanKurir.tiki,
                    groupValue: _char,
                    onChanged: (PilihanKurir? value) {
                      setState(() {
                        _char = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('JNE'),
                  leading: Radio<PilihanKurir>(
                    activeColor: Colors.red,
                    value: PilihanKurir.jne,
                    groupValue: _char,
                    onChanged: (PilihanKurir? value) {
                      setState(() {
                        _char = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            onPressed: () {
              CoolAlert.show(
                context: context,
                confirmBtnColor: Colors.red,
                type: CoolAlertType.success,
                text: "Your transaction was successful!",
                onConfirmBtnTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              'Pesan Sekarang',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
