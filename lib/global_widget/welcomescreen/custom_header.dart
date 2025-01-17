import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      title: null,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF0277BD),
      flexibleSpace: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.04),
          child: Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
