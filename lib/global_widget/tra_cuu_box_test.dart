import 'package:flutter/material.dart';
import 'package:nms_app/core/values/app_color.dart';

class TraCuuBoxTest extends StatelessWidget {
  final Function(String?) onChanged;
  final TextEditingController controller; // Add controller
  final FocusNode focusNode; // Add focus node

  TraCuuBoxTest({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          controller: controller, // Use the controller
          focusNode: focusNode, // Use the focus node
          cursorColor: AppColor.helpBlue,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.helpBlue,
              ),
          onChanged: onChanged,
          decoration: InputDecoration(
            errorStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.helpBlue),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.helpBlue),
            ),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.helpBlue),
            focusColor: AppColor.blackColor,
            prefixIcon: Icon(
              Icons.search_outlined,
              color: AppColor.helpBlue,
              size: 25,
            ),
            hintText: "Nhập từ khóa tìm kiếm...",
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.greyColor),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.helpBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.helpBlue),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          ),
        ),
      ),
    );
  }
}
