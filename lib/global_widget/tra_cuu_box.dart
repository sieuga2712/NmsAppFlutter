import 'package:flutter/material.dart';
import 'package:nms_app/core/values/app_color.dart';

class TraCuuBox extends StatelessWidget {
  final Function onChanged;
  TraCuuBox({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          cursorColor: AppColor.helpBlue,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColor.helpBlue,
              ),
          onFieldSubmitted: ((value) {
            this.onChanged(value);
          }),
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
