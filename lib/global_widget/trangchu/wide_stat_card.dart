import 'package:flutter/material.dart';

class WideStatCard extends StatelessWidget {
  final String title;
  final String value;
  final List<Color> colors;
  final double progress;
  final String subtitle;
  final VoidCallback? onTap;

  const WideStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.colors,
    required this.progress,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
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
            child: _buildCardContent(context, screenWidth, screenHeight),
          ),
          _buildTapEffect(),
        ],
      ),
    );
  }

  Widget _buildCardContent(
      BuildContext context, double screenWidth, double screenHeight) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * 0.005),
            Row(
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.004),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.30),
                _buildCircularProgress(screenWidth),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCircularProgress(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.21,
      height: screenWidth * 0.21,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1,
            color: Colors.white.withOpacity(0.2),
            strokeWidth: 8,
          ),
          CircularProgressIndicator(
            value: progress,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 8,
            backgroundColor: Colors.transparent,
          ),
          Center(
            child: Text(
              '${(progress * 100).round()}%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
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
