import 'package:flutter/material.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';
import 'package:health_tracker/widgets/rounded_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: AppStrings.appBarTitle,
                  fontSize: AppSizes.fontSizeXXl,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: AppSizes.xxs),
                AppText(
                  text: AppStrings.appBarSubtitle,
                  fontSize: AppSizes.fontSizeMd,
                  color: Colours.primaryTextColorLight,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            RoundedImage(
              source: Constants.userImageUrl,
              type: ImageSourceType.network,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
