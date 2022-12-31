import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: const Text(
          "PROFILE",
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              ClipOval(
                child: SizedBox(
                  width: 230,
                  height: 230,
                  child: Image.asset('assets/images/profile.gif'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: dataprofile(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dataprofile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Ini Nama",
            style: GoogleFonts.inder(
              fontSize: 27,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 2,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "ininama@student.unsika.ac.id",
            style: GoogleFonts.inder(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 2,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "089538952****",
            style: GoogleFonts.inder(
              fontSize: 27,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 2,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
