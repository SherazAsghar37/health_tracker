import 'package:flutter/material.dart';
import 'package:health_tracker/screens/health-details/details_block_chart.dart';
import 'package:health_tracker/screens/health-details/details_chat_header.dart';
import 'package:health_tracker/screens/home/home_screen_card.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({super.key, required this.size});

  final Size size;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool _shouldAnimate = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _shouldAnimate = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'heartRateCard',
      child: SingleChildScrollView(
        child: SizedBox(
          height: widget.size.height * 0.68,
          width: widget.size.width,
          child: Column(
            children: [
              IntrinsicHeight(
                child: HomeScreenCard(
                  cardSize: Size(0, AppSizes.xl * 4.3),
                  padding: EdgeInsets.fromLTRB(
                    AppSizes.lg,
                    AppSizes.xl,
                    AppSizes.lg,
                    0,
                  ),
                  icon: Constants.heartIcon,
                  title: AppStrings.heartRateCardTitile,
                  progress: AppStrings.heartRateCardProgress,
                  positiveProgress: false,
                  value: AppStrings.heartRateCardValue,
                  totalValue: AppStrings.heartRateCardTotalValue,
                  percent: AppStrings.heartRateCardPercent,
                  backgroundColor: Colours.primaryColor,
                  contrastColor: Colours.secondaryTextColor,
                  lightContrastColor: Colours.lightCardColor,
                  bottomBorder: false,
                  delay: const Duration(milliseconds: 0),
                  flipCounterDelay: const Duration(milliseconds: 0),
                  progressBarDelay: const Duration(milliseconds: 0),
                  animate: false,
                ),
              ),

              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 500,
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.lg,
                      horizontal: AppSizes.xl,
                    ),
                    decoration: BoxDecoration(
                      color: Colours.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppSizes.xl),
                        bottomRight: Radius.circular(AppSizes.xl),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: Colours.secondaryTextColor.withValues(
                            alpha: 0.1,
                          ),
                        ),
                      ),
                    ),
                    child:
                        _shouldAnimate
                            ? Column(
                              spacing: AppSizes.lg,
                              children: [
                                DetailsChartHeader(),
                                Transform.flip(
                                  flipY: true,
                                  child: DetailsBlockChart(),
                                ),
                              ],
                            )
                            : SizedBox.expand(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
