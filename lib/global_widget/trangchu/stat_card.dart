import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final List<Color> colors;
  final double progress;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.colors,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = screenWidth * 0.04; // 4% chiều rộng màn hình

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(cardPadding), // Sử dụng padding động
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: _buildCardContent(),
          ),
          _buildTapEffect(),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return Builder(builder: (context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final spacingHeight = screenWidth * 0.07;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container cho title để đảm bảo chiều cao tối thiểu
          Container(
            constraints: const BoxConstraints(minHeight: 40),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: spacingHeight), // Sử dụng spacing động
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildTapEffect() {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          splashFactory: InkRipple.splashFactory,
        ),
      ),
    );
  }
}
