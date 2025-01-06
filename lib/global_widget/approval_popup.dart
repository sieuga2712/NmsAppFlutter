import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';

class ApprovalPopup extends StatefulWidget {
  final String title;
  final Function(String) onConfirm;
  final VoidCallback onCancel;

  const ApprovalPopup({
    super.key,
    required this.title,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  _ApprovalPopupState createState() => _ApprovalPopupState();
}

class _ApprovalPopupState extends State<ApprovalPopup> {
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
        width: screenWidth * 0.8, // 80% of screen width
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.6, // Max height 60% of screen height
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // 4.5% of screen width
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Get.back(); // Đóng popup khi nhấn close
                      widget.onCancel(); // Gọi callback onCancel
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              const Text(
                'Nội Dung xử lý:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // 1% of screen height
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: TextField(
                  controller: _contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: InputBorder.none,
                    hintText: 'Nhập nội dung xử lý...',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      widget.onCancel();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04, // 4% of screen width
                        vertical: screenHeight * 0.01, // 1% of screen height
                      ),
                      child: Text(
                        'Hủy',
                        style: TextStyle(color: AppColor.greyColor),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02), // 2% of screen width
                  ElevatedButton(
                    onPressed: () {
                      if (_contentController.text.trim().isEmpty) {
                        Get.snackbar(
                          'Thông báo',
                          'Vui lòng nhập nội dung xử lý',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      widget.onConfirm(_contentController.text);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blueAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01,
                      ),
                      child: const Text(
                        'Xác nhận',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
