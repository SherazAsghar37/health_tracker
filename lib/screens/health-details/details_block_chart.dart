import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';

class DetailsBlockChart extends StatefulWidget {
  const DetailsBlockChart({super.key});

  @override
  State<DetailsBlockChart> createState() => _DetailsBlockChartState();
}

class _DetailsBlockChartState extends State<DetailsBlockChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int maxValue =
        AppStrings.chartData.isNotEmpty
            ? AppStrings.chartData.reduce((a, b) => a > b ? a : b)
            : 1;
    int minValue =
        AppStrings.chartData.isNotEmpty
            ? AppStrings.chartData.reduce((a, b) => a < b ? a : b)
            : 1;
    int avg =
        AppStrings.chartData.isNotEmpty
            ? (AppStrings.chartData.reduce((a, b) => a + b) ~/
                    (AppStrings.chartData.length * 2.5))
                .round()
            : 1;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(Constants.homeScreenProgressCount, (row) {
                return Container(
                  height: AppSizes.lg,
                  width:
                      (constraints.maxWidth -
                          (Constants.homeScreenProgressCount *
                              AppSizes.xxs *
                              2)) /
                      Constants.homeScreenProgressCount,
                  margin: EdgeInsets.symmetric(horizontal: AppSizes.xxs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusLg,
                    ),
                  ),
                  child: Center(
                    child: Transform.flip(
                      flipY: true,
                      child: AppText(
                        text: AppStrings.chartPrimaryAxis[row],
                        fontSize: AppSizes.md,
                        fontWeight: FontWeight.w500,
                        color: Colours.secondaryTextColorlight,
                      ),
                    ),
                  ),
                );
              }),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(Constants.homeScreenProgressCount, (row) {
                if (row >= AppStrings.chartData.length) {
                  return const SizedBox();
                }

                int normalizedValue =
                    (AppStrings.chartData[row] * 7 / (maxValue + minValue))
                        .round();

                return Column(
                  children: List.generate(6, (index) {
                    if ((index) > (normalizedValue - 1)) {
                      return const SizedBox();
                    }

                    return Container(
                      height: AppSizes.lg * 2.05,
                      width:
                          (constraints.maxWidth -
                              (Constants.homeScreenProgressCount *
                                  AppSizes.xxs *
                                  2)) /
                          Constants.homeScreenProgressCount,
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.xxs,
                        vertical: 0.1,
                      ),
                      decoration: BoxDecoration(
                        color:
                            Colours.detailsColor[index %
                                Colours.detailsColor.length],
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusLg,
                        ),
                      ),
                      child: Center(
                        child:
                            index == normalizedValue - 1
                                ? Transform.flip(
                                  flipY: true,
                                  child: AppText(
                                    text:
                                        AppStrings.chartData[row] < avg
                                            ? "<$avg"
                                            : AppStrings.chartData[row]
                                                .toString(),
                                    fontSize: AppSizes.lg,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        index >=
                                                Constants
                                                        .homeScreenProgressCount -
                                                    2
                                            ? Colours.whiteColor
                                            : Colours.secondaryTextColor,
                                    height: -0.1,
                                  ),
                                )
                                : null,
                      ),
                    ).fadeIn(
                      delay: Duration(milliseconds: 1000 + (index * 100)),
                      duration: const Duration(milliseconds: 500),
                    );
                  }),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
