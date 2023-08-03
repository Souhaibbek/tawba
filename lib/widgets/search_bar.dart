import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/icon_Button.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class SearchBarWidgets extends StatelessWidget {
  const SearchBarWidgets(
      {super.key,
      required this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: zekrContainerLinearGradient(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  child: TextFormField(
                    controller: controller,
                    onChanged: onChanged,
                    onFieldSubmitted: onFieldSubmitted,
                    onSaved: onSaved,
                    validator: validator,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    cursorColor: AppColors.kWhiteColor,
                    style: AppTextStyles.descriptionTextStyle,
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        alignLabelWithHint: true,
                        hintText: 'بحث في الاذكار',
                        suffixIconColor: AppColors.kWhiteColor,
                        suffixIcon: Icon(
                          Icons.search_outlined,
                        ),
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: AppTextStyles.descriptionTextStyle,
                        filled: true,
                        fillColor: Color.fromARGB(255, 10, 132, 143)),
                  ),
                ),
              ),
            ),
            iconButton(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
